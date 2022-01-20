package com.example.mguide.loggers

import java.io.File

class FileLogger {
    companion object {
        fun log(filename:String, data: String){
            val logFile = File("/data/data/com.example.mguide/app_flutter/$filename")
            logFile.appendText(data)
        }
    }
}