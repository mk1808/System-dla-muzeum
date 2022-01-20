package com.example.mguide.models

import org.json.JSONObject

class Waypoint(
    val id: Long = 1,
    val waypointNumber: Long = 1,
    val position: Point = Point(0.0, 0.0),
) {
    companion object {
        fun fromJson(json: JSONObject): Waypoint {
            return Waypoint(
                id = json.getLong("id"),
                waypointNumber = json.getLong("waypointNumber"),
                position = Point.fromJson(json.getJSONObject("position")),
            )
        }
    }

    override fun toString(): String {
        return "{ no: $waypointNumber, position: ${position.toString()}}"
    }
}