package com.example.mguide.signal_detector

import com.example.mguide.position_estimator.PositionEstimator
import com.example.mguide.signal_detector.SignalDetectionConfig.Companion.config

class MonoSignalDetector : AbstractSignalDetector() {
    private val TAG: String = "SignalDetector"

    val positionEstimator = PositionEstimator()

    override fun onSignalOccurred() {
        if (!detected) {
            detectionCounterState = counter
            currentDetectionTime = counter / config.samplingRate // w sekundach
            detected = true
        } else if (!isSignal
            && counter - detectionCounterState > minDurationInSamples
            && (currentDetectionTime - previousDetectionTime) > (config.emittingWindowLength / 2.0)
        ) {
            val delta = (currentDetectionTime - previousDetectionTime)
            onSignalDetection(delta)
            isSignal = true
            previousDetectionTime = currentDetectionTime
        }
    }

    override fun onSignalDetection(delta: Double) {
        positionEstimator.addDetection(delta)
    }

}