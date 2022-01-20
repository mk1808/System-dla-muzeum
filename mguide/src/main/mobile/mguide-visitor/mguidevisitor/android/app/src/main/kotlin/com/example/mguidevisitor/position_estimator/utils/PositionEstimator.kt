package com.example.mguidevisitor.position_estimator

import com.example.mguidevisitor.models.DistanceProvider
import com.example.mguidevisitor.models.Point
import com.example.mguidevisitor.position_estimator.utils.Utils
import com.example.mguidevisitor.providers.WaypointProvider
import com.example.mguidevisitor.signal_detector.SignalDetectionConfig.Companion.config

class PositionEstimator {
    private val TAG: String = "PositionEstimator"
    private val soundSpeed = 340.0

    private var detections = mutableListOf(0.0)
    private val utils = Utils()
    var lastKnownPosition = Point(0.0, 0.0)

    private var waypointProvider = WaypointProvider.get()

    fun reset() {
        waypointProvider = WaypointProvider.get()
    }

    fun addDetection(delta: Double) {
        if (delta < config.emittingWindowLength * 3 / 2) {
            addNewDetection(delta - config.emittingWindowLength)
        } else {
            if (detections.size == 3) {
                onNewCycle()
            } else {
                resetDetections()
            }
        }
    }

    fun addNewDetection(delta: Double) {
        detections.add(delta)
    }

    fun onNewCycle() {
        if (detections.size >= 3) {
            fixNegativeValues()
            estimatePosition()
        }
        resetDetections()
    }

    private fun fixNegativeValues() {
        val minTimeDetection = detections.minByOrNull { it }
        if (minTimeDetection != null && minTimeDetection < 0.0) {
            for (i in 0 until detections.size) {
                detections[i] -= minTimeDetection
            }
        }
    }

    private fun estimatePosition() {
        val currentPoint = utils.calculatePosition(getDistanceProviders())
        if (currentPoint != null) {
            lastKnownPosition = currentPoint
        }
    }

    private fun getDistanceProviders(): List<DistanceProvider> {
        val distanceProviders = mutableListOf<DistanceProvider>()
        val waypoints = waypointProvider.getWaypoints()
        //Log.v(TAG, "waypoints: ${waypoints}")
        for (i in 0 until waypoints.size) {
            distanceProviders.add(
                DistanceProvider(
                    waypoints[i].position,
                    detections[i] * soundSpeed
                )
            )
        }
        return distanceProviders
    }

    fun resetDetections() {
        detections = mutableListOf(0.0)
    }

}