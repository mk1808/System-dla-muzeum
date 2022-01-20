package com.example.mguidevisitor.audio_processor

import android.annotation.TargetApi
import android.media.AudioFormat
import android.media.AudioRecord
import android.media.MediaRecorder
import android.os.Build
import android.util.Log
import com.example.mguidevisitor.loggers.FileLogger
import java.text.SimpleDateFormat
import java.util.*


@TargetApi(Build.VERSION_CODES.N)
abstract class AbstractAudioProcessor(private val channel: Int) {
    private val TAG: String = "AudioProcessor"

    private val audioSource = MediaRecorder.AudioSource.UNPROCESSED
    private val sampleRate = 48000
    private val encodingType = AudioFormat.ENCODING_PCM_16BIT

    private var bufferSizeInByte: Int =
        AudioRecord.getMinBufferSize(sampleRate, channel, encodingType) * 4
    private var audioRecorder: AudioRecord? = getAudioRecord()

    private var isRecord = false

    fun startRecord(): Int {
        if (isRecord) {
            return -1
        }
        audioRecorder = getAudioRecord()

        audioRecorder?.startRecording()
        isRecord = true
        AudioRecordManager().start()

        val currentDate = SimpleDateFormat("hh:mm:ss.SSS").format(Date())
        Log.v(TAG, "startRecordTime: $currentDate")
        return 0
    }

    fun stopRecord() {
        if(isRecord){
            val currentDate = SimpleDateFormat("hh:mm:ss.SSS").format(Date())
            Log.v(TAG, "stopRecordTime: $currentDate")

            audioRecorder?.stop()
            audioRecorder?.release()
        }
        isRecord = false
    }

    abstract fun getPosition(): List<Double>
    abstract fun processSamples(samples: ShortArray)
    abstract fun reset()

    private fun processAudio() {
        val audioData = ShortArray(bufferSizeInByte)
        var length = 0
        while (isRecord && audioRecorder != null) {
            length = audioRecorder!!.read(audioData, 0, bufferSizeInByte)
            if (AudioRecord.ERROR_INVALID_OPERATION != length) {
                processSamples(audioData)
            } else {
                //błąd pobierania
            }
        }
    }

    private inner class AudioRecordManager : Thread() {
        override fun run() {
            super.run()
            processAudio()
        }
    }

    fun printAudio(audioData: ShortArray, filename: String = "samples.txt") {
        Thread(Runnable {
            Log.v(
                TAG,
                "start saving ${SimpleDateFormat(" hh:mm:ss.SSS").format(Date())} length: ${audioData.size}"
            )
            FileLogger.log(filename, audioData.joinToString(separator = "\n"))
            Log.v(TAG, "end saving  ${SimpleDateFormat(" hh:mm:ss.SSS").format(Date())}")
        }).start()
    }


    private fun getAudioRecord(): AudioRecord? {
        return try {
            AudioRecord(
                audioSource, sampleRate, channel,
                encodingType, bufferSizeInByte
            )
        } catch (e: SecurityException) {
            null
        }
    }

    /*fun findAudioRecord(): AudioRecord? {
        val mSampleRates = intArrayOf(48000, 44100, 22050, 11025, 8000)
        for (rate in mSampleRates) {
            for (audioFormat in shortArrayOf(
                AudioFormat.ENCODING_PCM_16BIT.toShort(),
                AudioFormat.ENCODING_PCM_8BIT.toShort()
            )) {
                for (channelConfig in shortArrayOf(
                    AudioFormat.CHANNEL_IN_MONO.toShort(),
                    AudioFormat.CHANNEL_IN_STEREO.toShort(),
                    AudioFormat.CHANNEL_IN_MONO.toShort()
                )) {
                    try {

                        val bufferSize = AudioRecord.getMinBufferSize(
                            rate,
                            channelConfig.toInt(),
                            audioFormat.toInt()
                        )
                        if (bufferSize != AudioRecord.ERROR_BAD_VALUE) {
                            // check if we can instantiate and have a success
                            val recorder = AudioRecord(
                                MediaRecorder.AudioSource.DEFAULT, rate,
                                channelConfig.toInt(), audioFormat.toInt(), bufferSize
                            )
                            if (recorder.state == AudioRecord.STATE_INITIALIZED) return recorder
                        }
                    } catch (e: Exception) {

                    }
                }
            }
        }
        return null
    }*/
}