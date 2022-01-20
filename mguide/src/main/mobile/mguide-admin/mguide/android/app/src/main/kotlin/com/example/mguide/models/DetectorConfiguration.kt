package com.example.mguide.models

import org.json.JSONObject

class DetectorConfiguration(
    val id: Long? = null,
    val samplingRate: Double = 4800.0,
    val signalFrequency: Double = 1600.0,
    val processingPeriodCount: Double = 5.0,
    val minSignalDuration: Double = 10.0,
    val signalDetectionThreshold: Double = 50.0,
    val emittingWindowLength: Double = 0.16
) {
    companion object{
        fun fromJson(json: JSONObject): DetectorConfiguration{
            return DetectorConfiguration(
                id = json.getLong("id"),
                samplingRate = json.getDouble("samplingRate"),
                signalFrequency = json.getDouble("signalFrequency"),
                processingPeriodCount = json.getDouble("processingPeriodCount"),
                minSignalDuration = json.getDouble("minSignalDuration"),
                signalDetectionThreshold = json.getDouble("signalDetectionThreshold"),
                emittingWindowLength = json.getDouble("emittingWindowLength"),
            )
        }
    }

    override fun toString(): String {
        return "{\"id\":$id,\n" +
                "   \"samplingRate\":$samplingRate,\n" +
                "   \"signalFrequency\":$signalFrequency,\n" +
                "   \"processingPeriodCount\":$processingPeriodCount,\n" +
                "   \"minSignalDuration\":$minSignalDuration,\n" +
                "   \"signalDetectionThreshold\":$signalDetectionThreshold,\n" +
                "   \"emittingWindowLength\":$emittingWindowLength" +
                "}"
    }
}