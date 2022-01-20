package com.example.mguidevisitor.audio_processor

import android.annotation.TargetApi
import android.media.AudioFormat
import android.os.Build
import com.example.mguidevisitor.signal_detector.StereoSignalDetector


@TargetApi(Build.VERSION_CODES.N)
class AudioProcessorStereoChannel : AbstractAudioProcessor(AudioFormat.CHANNEL_IN_STEREO) {
    private val TAG: String = "AudioProcessorStereo"

    private var signalDetector = StereoSignalDetector()

    var printSignal = false

    override fun getPosition(): List<Double> {
        return signalDetector.positionEstimator.lastKnownPosition.getAsArray()
    }

    override fun processSamples(samples: ShortArray) {
        val leftChannelSamples = ShortArray(samples.size / 2)
        val rightChannelSamples = ShortArray(samples.size / 2)
        var index = 0;
        while (index < samples.size) {
            leftChannelSamples[index.div(2)] = samples[index]
            rightChannelSamples[index.div(2)] = samples[index + 1]
            index += 2
        }

        if (printSignal) {
            printAudio(leftChannelSamples, "left.txt")
            printAudio(rightChannelSamples, "right.txt")
        }
        signalDetector.processStereoSamples(leftChannelSamples, rightChannelSamples)
    }


    override fun reset() {
        stopRecord()
        signalDetector.reset()
        startRecord()
    }
}