package com.example.mguide.position_estimator.utils

import com.example.mguide.models.AngleCalculationResponse
import com.example.mguide.models.Segment
import kotlin.math.abs
import kotlin.math.pow
import kotlin.math.sqrt

class AngleCalculator(val segment: Segment, val delta1: Double, val delta2: Double) {
    private val TAG: String = "AngleCalculator"

    var x: Double = 0.0
    //            (|AB|*|AB| + d1*d1 - d2*d2) + 2*d1*x - 2*d2*x       _const1 + 2*d1*x - 2*d2*x
    // cos(a) === -------------------------------------------- === ----------------------------
    //                       2*|AB|*d1 + 2*|AB|*x                      _const2 + 2*|AB|*x

    val _const1 = segment.length.pow(2.0) + delta1.pow(2.0) - delta2.pow(2.0)
    val _const2 = 2.0 * segment.length * delta1

    fun calc(): AngleCalculationResponse {
        val includes = abs(delta1 - delta2) > segment.length
        val notConnected = segment.length > (delta1 + delta2 + 2.0 * x)
        if (includes || notConnected) {
            return AngleCalculationResponse(
                success = false,
                includes = includes,
                notConnected = notConnected
            )
        }
        val cosine =
            (_const1 + 2.0 * delta1 * x - 2.0 * delta2 * x) / (_const2 + 2.0 * segment.length * x)
        val sinus = sqrt(1.0 - cosine * cosine)
        return AngleCalculationResponse(
            success = true,
            cosine = cosine,
            sine = sinus
        )
    }
}