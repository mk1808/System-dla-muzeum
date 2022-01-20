package com.example.mguidevisitor.position_estimator.utils

import com.example.mguidevisitor.models.AngleCalculationResponse
import com.example.mguidevisitor.models.DistanceProvider
import com.example.mguidevisitor.models.Point
import com.example.mguidevisitor.models.Segment
import kotlin.math.abs

class Utils {
    private val TAG: String = "positionEstimatorUtils"

    private val maxCalculationDistance = 4.0;
    private val calculationStep = 0.1;

    fun scaleVector(vector: Point, value: Double): Point {
        return Point(vector.x * value, vector.y * value)
    }

    //Zakładam, że szukana pozycja będzie liczona względem punktu segment.p1, a (delta2 + x) to odległość od punktu segment.p1 do szukanej pozycji
    fun calculateCrossPoints(
        segment: Segment,
        delta: Double,
        x: Double,
        angle: AngleCalculationResponse
    ): List<Point> {
        val vectorResizeFactor = (delta + x) / segment.length;
        val tempVector = scaleVector(segment.vector, vectorResizeFactor);
        val Xp1 = tempVector.x * angle.cosine - tempVector.y * angle.sine + segment.p1.x;
        val Yp1 = tempVector.x * angle.sine + tempVector.y * angle.cosine + segment.p1.y;
        val Xp2 = tempVector.x * angle.cosine + tempVector.y * angle.sine + segment.p1.x;
        val Yp2 = tempVector.y * angle.cosine - tempVector.x * angle.sine + segment.p1.y;
        return arrayListOf(Point(Xp1, Yp1), Point(Xp2, Yp2))
    }


    fun calculatePosition(distances: List<DistanceProvider>): Point? {
        val sortedDistances = distances.sortedBy { it.delta }
        val refPosition = sortedDistances[0]

        val segment = Segment(sortedDistances[1].point, sortedDistances[2].point)
        
        val angleCalculator = AngleCalculator(
            segment,
            sortedDistances[1].delta,
            sortedDistances[2].delta
        )

        var x = 0.0
        var minDistance = maxCalculationDistance
        var bestPoint: Point? = null
        while (x < maxCalculationDistance) {
            val angle = angleCalculator.calc();
            angleCalculator.x = x
            if (angle.success) {
                val crossPoints = calculateCrossPoints(segment, distances[1].delta, x, angle);
                val d1 = crossPoints[0].distanceToPoint(refPosition.point)
                val d2 = crossPoints[1].distanceToPoint(refPosition.point)

                var isCloser = true
                if (crossPoints[0].x > 0 && crossPoints[0].y > 0 &&  abs(x - d1) < minDistance) {
                    minDistance = abs(x - d1)
                    bestPoint = crossPoints[0]
                    isCloser = true
                } else if (crossPoints[1].x > 0 && crossPoints[1].y > 0 && abs(x - d2) < minDistance) {
                    minDistance = abs(x - d2)
                    bestPoint = crossPoints[1]
                    isCloser = true
                }

                if(!isCloser){
                    return bestPoint
                }
            }

            x += calculationStep
        }

        return bestPoint
    }

}