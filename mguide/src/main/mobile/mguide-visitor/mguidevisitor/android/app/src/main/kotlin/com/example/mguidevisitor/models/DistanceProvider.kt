package com.example.mguidevisitor.models

class DistanceProvider(val point: Point, val delta: Double) {

    override fun toString(): String {
        return "to point ${point.toString()} distance is $delta"
    }

}