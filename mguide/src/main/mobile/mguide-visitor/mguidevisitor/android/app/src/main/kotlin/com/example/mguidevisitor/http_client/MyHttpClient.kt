package com.example.mguidevisitor.http_client

import android.util.Log
import com.example.mguidevisitor.signal_detector.SignalDetectionConfig
import org.json.JSONArray
import org.json.JSONObject
import java.net.HttpURLConnection
import java.net.URL
import java.text.SimpleDateFormat
import java.util.*
import java.util.function.Function

class MyHttpClient {
    val baseAddress = "http://192.168.33.6:8080/api/"


    fun get(path: String, callback: (result: String) -> Unit) {
        val url = URL(baseAddress + path)
        Thread(Runnable {
            with(url.openConnection() as HttpURLConnection) {
                requestMethod = "GET"
                val jsonBuilder: StringBuilder = StringBuilder()
                inputStream.bufferedReader().use {
                    it.lines().forEach { line ->
                        jsonBuilder.append(line)
                    }
                }
                callback(jsonBuilder.toString())
            }
        }).start()
    }

    fun getObject(path: String, callback: (result: JSONObject) -> Unit) {
        get(path) {
            callback(JSONObject(it))
        }
    }

    fun getArray(path: String, callback: (result: JSONArray) -> Unit) {
        get(path) {
            callback(JSONArray(it))
        }
    }

}