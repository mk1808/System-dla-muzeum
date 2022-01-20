package com.example.mguide.models

import org.json.JSONObject
import kotlin.math.pow
import kotlin.math.sqrt

class Point(val x: Double, val y: Double) {
    companion object {
        fun fromJson(json: JSONObject): Point {
            return Point(
                x = json.getDouble("x"),
                y = json.getDouble("y"),
            )
        }
    }

    fun distanceToPoint(p2: Point): Double {
        return sqrt((p2.x - this.x).pow(2.0) + (p2.y - this.y).pow(2.0))
    }

    fun getAsArray(): List<Double> {
        return mutableListOf(x, y)
    }

    override fun toString(): String {
        return "(x: $x, y: $y)"
    }
}