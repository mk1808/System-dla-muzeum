package com.example.mguidevisitor.signal_detector

import com.example.mguidevisitor.signal_detector.SignalDetectionConfig.Companion.config
import kotlin.math.*

open class AbstractSignalDetector {
    private val TAG: String = "AbstractSignalDetector"

    private var samplesByPeriod = config.samplingRate / config.signalFrequency
    private var maxSamples = ceil(config.processingPeriodCount * samplesByPeriod).toInt()
    private var singleSampleRotationAngle = 2 * PI / samplesByPeriod
    var minDurationInSamples = samplesByPeriod * config.minSignalDuration;

    var detected = false;
    var isSignal = false;

    private var currentSampleIndex = -1
    var currentDetectionTime = 0.0

    var counter = 0L;
    var detectionCounterState = 0L
    var previousDetectionTime = 0.0

    private var samplesReal = DoubleArray(maxSamples)
    private var samplesImaginary = DoubleArray(maxSamples)
    private var scopeDetectionStatus = DoubleArray(maxSamples)
    var scopeSumModule = 0.0

    open fun reset() {
        samplesByPeriod = config.samplingRate / config.signalFrequency
        maxSamples = ceil(config.processingPeriodCount * samplesByPeriod).toInt()
        singleSampleRotationAngle = 2 * PI / samplesByPeriod
        minDurationInSamples = samplesByPeriod * config.minSignalDuration;

        detected = false;
        isSignal = false;

        currentSampleIndex = -1
        currentDetectionTime = 0.0

        counter = 0L;
        detectionCounterState = 0L;

        samplesReal = DoubleArray(maxSamples)
        samplesImaginary = DoubleArray(maxSamples)
        scopeDetectionStatus = DoubleArray(maxSamples)
        scopeSumModule = 0.0

        previousDetectionTime = 0.0
    }

    fun processSamples(samples: ShortArray) {
        samples.forEach {
            forEverySample(it)
        }
    }

    fun calculateSampleComplexValueAndGetScopeModule(sampleValue: Short): Double {
        counter++
        currentSampleIndex = (currentSampleIndex + 1).rem(maxSamples)
        val currentSampleRotationAngle = singleSampleRotationAngle * currentSampleIndex

        samplesReal[currentSampleIndex] = sampleValue * cos(currentSampleRotationAngle)
        samplesImaginary[currentSampleIndex] = sampleValue * sin(currentSampleRotationAngle)

        val scopeAvgReal = samplesReal.average()
        val scopeAvgImaginary = samplesImaginary.average()

        return sqrt(scopeAvgReal * scopeAvgReal + scopeAvgImaginary * scopeAvgImaginary)
    }

    private fun processScopeModule() {
        scopeDetectionStatus[currentSampleIndex] =
            if (scopeSumModule > config.signalDetectionThreshold) 1.0 else 0.0
        if (scopeDetectionStatus.average() > 0.5) {
            onSignalOccurred()
        } else {
            isSignal = false
            detected = false
        }
    }

    open fun onSignalOccurred() {
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
        }
    }

    open fun onSignalDetection(delta: Double) {
        isSignal = true
        previousDetectionTime = currentDetectionTime
    }

    fun forEverySample(sampleValue: Short) {
        scopeSumModule = calculateSampleComplexValueAndGetScopeModule(sampleValue)
        processScopeModule()
    }
}