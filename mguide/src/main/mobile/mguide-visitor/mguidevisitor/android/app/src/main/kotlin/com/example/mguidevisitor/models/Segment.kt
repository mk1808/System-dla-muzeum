package com.example.mguidevisitor.models

import kotlin.math.pow
import kotlin.math.sqrt

class Segment(val p1: Point, val p2: Point) {
    val length = _length()
    val vector = _vector()

    private fun _length(): Double {
        return sqrt((p2.x - p1.x).pow(2.0) + (p2.y - p1.y).pow(2.0))
    }

    fun _vector(): Point {
        val x = p2.x - p1.x;
        val y = p2.y - p1.y;
        return Point(x, y);
    }

    override fun toString(): String {
        return "From ${p1.toString()} to ${p2.toString()}, length: $length"
    }
}