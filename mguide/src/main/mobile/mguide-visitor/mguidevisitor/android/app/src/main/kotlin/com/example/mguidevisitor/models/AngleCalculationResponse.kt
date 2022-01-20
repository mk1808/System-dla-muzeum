package com.example.mguidevisitor.models

class AngleCalculationResponse(
    val success: Boolean = false,
    val includes: Boolean = false,
    val notConnected: Boolean = false,
    val cosine: Double = 0.0,
    val sine: Double = 0.0
) {

    override fun toString(): String {
        return "success: $success; includes: $includes; notConnected: $notConnected; cosine: $cosine; sine: $sine"
    }
}