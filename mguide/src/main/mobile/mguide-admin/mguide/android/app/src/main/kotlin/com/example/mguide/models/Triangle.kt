package com.example.mguide.models

import kotlin.math.sqrt

class Triangle(val p1: Point, val p2: Point, val p3: Point) {

    fun perimeter(): Double {
        val sides = this.sides()
        return sides[1] + sides[2] + sides[3]
    }

    fun sides(): DoubleArray {
        return doubleArrayOf(p1.distanceToPoint(p2), p1.distanceToPoint(p3), p2.distanceToPoint(p3))
    }

    fun areaBySides(): Double {
        val p = perimeter() / 2.0
        val sides = sides()
        return sqrt(p * (p - sides[1]) * (p - sides[2]) * (p - sides[3]))
    }
}