package com.example.mguidevisitor.signal_detector

import com.example.mguidevisitor.position_estimator.PositionEstimator
import com.example.mguidevisitor.signal_detector.SignalDetectionConfig.Companion.config

class StereoSignalDetector {

    private val signalDetectorLeft = AbstractSignalDetector()
    private val signalDetectorRight = AbstractSignalDetector()

    var positionEstimator = PositionEstimator()

    fun reset() {
        signalDetectorLeft.reset()
        signalDetectorRight.reset()
        positionEstimator = PositionEstimator()
    }

    private val factorOfBetweenCycleGap = 2.5

    private val TAG: String = "SignalDetector"


    private var previousDetectionTime = 0.0
    private var signalDetections = mutableListOf<Double>()
    private var isSignal = false


    fun processStereoSamples(leftChannelSamples: ShortArray, rightChannelSamples: ShortArray) {
        for (i in leftChannelSamples.indices) {
            processStereoSamples(leftChannelSamples[i], rightChannelSamples[i])
        }
    }

    fun processStereoSamples(sampleLeft: Short, sampleRight: Short) {
        signalDetectorLeft.forEverySample(sampleLeft)
        signalDetectorRight.forEverySample(sampleRight)
        if (!isSignal && anySignalDetected()) {
            onSignalDetection()
        }
        isSignal = anySignalDetected()
    }

    fun anySignalDetected(): Boolean {
        return signalDetectorLeft.isSignal || signalDetectorRight.isSignal
    }

    fun onSignalDetection() {
        val currentDetectionTime = whenSignalDetected()
        val delta = currentDetectionTime - previousDetectionTime
        if (delta > config.emittingWindowLength * 2.0) {
            // nowy cykl
            checkPosition()
        } else if (delta < config.emittingWindowLength / 2.0) {
            return
        }
        // nowa detekcja
        previousDetectionTime = currentDetectionTime
        signalDetections.add(currentDetectionTime)
    }

    fun checkPosition() {
        //Log.v(TAG, "size: ${signalDetections.size}")
        if (signalDetections.size < 3) return
        positionEstimator.resetDetections()
        for (i in 0 until signalDetections.size) {
            positionEstimator.addNewDetection(signalDetections[i] - signalDetections[0] - config.emittingWindowLength * i)
        }
        signalDetections.clear()
        positionEstimator.onNewCycle()
    }

    fun whenSignalDetected(): Double {
        return if (signalDetectorLeft.isSignal) signalDetectorLeft.currentDetectionTime
        else signalDetectorRight.currentDetectionTime
    }

}