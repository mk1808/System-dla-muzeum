package com.example.mguide.audio_processor

import android.annotation.TargetApi
import android.media.AudioFormat
import android.os.Build
import com.example.mguide.signal_detector.MonoSignalDetector


@TargetApi(Build.VERSION_CODES.N)
class AudioProcessorMonoChannel: AbstractAudioProcessor(AudioFormat.CHANNEL_IN_MONO) {
    private val TAG: String = "AudioProcessorMono"
    private var signalDetector = MonoSignalDetector()

    override fun getPosition(): List<Double> {
        return signalDetector.positionEstimator.lastKnownPosition.getAsArray()
    }

    override fun processSamples(samples: ShortArray) {
        signalDetector.processSamples(samples)
    }

    override fun reset() {
        stopRecord()
        signalDetector.reset()
        startRecord()
    }
}