package com.example.mguidevisitor.loggers

import java.io.File

class FileLogger {
    companion object {
        fun log(filename:String, data: String){
            val logFile = File("/data/data/com.example.mguidevisitor/app_flutter/$filename")
            logFile.appendText(data)
        }
    }
}