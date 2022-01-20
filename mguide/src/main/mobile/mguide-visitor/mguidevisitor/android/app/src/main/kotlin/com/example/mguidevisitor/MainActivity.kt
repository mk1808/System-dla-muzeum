package com.example.mguidevisitor

import androidx.annotation.NonNull
import com.example.mguidevisitor.audio_processor.AudioProcessorStereoChannel
import com.example.mguidevisitor.http_client.MyHttpClient
import com.example.mguidevisitor.loggers.FileLogger
import com.example.mguidevisitor.models.DetectorConfiguration
import com.example.mguidevisitor.signal_detector.SignalDetectionConfig
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import kotlin.coroutines.coroutineContext

class MainActivity : FlutterActivity() {
    private val CHANNEL = "samples.flutter.dev/soundProcessor"
    //private val audioProcessor = AudioProcessorMonoChannel()
    private val audioProcessor = AudioProcessorStereoChannel()

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            CHANNEL
        ).setMethodCallHandler { call, result ->
            when (call.method) {
                "startRecording" -> {
                    SignalDetectionConfig.fetchUpdate()
                    audioProcessor.reset()
                    audioProcessor.startRecord()
                    result.success(true)
                }
                "stopRecording" -> {
                    audioProcessor.stopRecord()
                    result.success(true)
                }
                "getLastKnownPosition" -> {
                    result.success(audioProcessor.getPosition())
                }
                "updateConfiguration" -> {
                    SignalDetectionConfig.fetchUpdate()
                    result.success(true)
                }
                "startPrintSignal" -> {
                    audioProcessor.printSignal = true
                    result.success(true)
                }
                "stopPrintSignal" -> {
                    audioProcessor.printSignal = false
                    result.success(true)
                }
                else -> {
                    result.notImplemented()
                }

            }
        }
    }
}
