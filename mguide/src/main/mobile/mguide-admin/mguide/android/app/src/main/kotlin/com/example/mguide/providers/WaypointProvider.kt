package com.example.mguide.providers

import android.util.Log
import com.example.mguide.http_client.MyHttpClient
import com.example.mguide.models.Point
import com.example.mguide.models.Waypoint

class WaypointProvider {

    companion object {
        fun get(): WaypointProvider{
            val waypointProvider = WaypointProvider()
            waypointProvider.fetchWaypoints()
            return waypointProvider
        }
    }

    private var wayPoints = mutableListOf<Waypoint>(
        Waypoint(1, 1, Point(0.17, 0.3)),
        Waypoint(2, 2, Point(1.9, 0.1)),
        Waypoint(3, 3, Point(2.8, 1.75))
    )

    fun fetchWaypoints() {
        MyHttpClient().getArray("waypoints/") {
            wayPoints = mutableListOf()
            for (i in 0 until it.length()) {
                wayPoints.add(Waypoint.fromJson(it.getJSONObject(i)))
            }
            wayPoints.sortBy { it.waypointNumber }
            Log.v("fetchWaypoints", wayPoints.toString())
        }
    }

    fun getWaypoints(): List<Waypoint> {
        return wayPoints
    }
}