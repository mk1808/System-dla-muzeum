package com.example.mguide.signal_detector

import android.util.Log
import com.example.mguide.http_client.MyHttpClient
import com.example.mguide.models.DetectorConfiguration

class SignalDetectionConfig {
    companion object {
        var config = DetectorConfiguration()

        private fun update(newConfig: DetectorConfiguration) {
            config = newConfig
            Log.v("SignalDetectionConfig", newConfig.toString())
        }

        fun fetchUpdate() {
            MyHttpClient().getObject("configuration/detector") {
                it?.let { it1 -> update(DetectorConfiguration.fromJson(it1)) }
            }
        }
    }
}