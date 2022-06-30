import 'dart:math';

import 'package:vector_math/vector_math.dart';

double clamp(num x, num minVal, num maxVal) =>
    min(max(x, minVal), maxVal).toDouble();

double map(num value, num start1, num stop1, num start2, num stop2) =>
    (value - start1) / (stop1 - start1) * (stop2 - start2) + start2;

Vector2 lerp2(Vector2 a, Vector2 b, num t) =>
    b * t.toDouble() + a * (1 - t).toDouble();

double lerp(num a, num b, num t) => b * t.toDouble() + a * (1 - t).toDouble();

double normalRandom(Random rnd) {
  double u = 0, v = 0;

  while (u == 0) {
    u = rnd.nextDouble();
  }

  while (v == 0) {
    v = rnd.nextDouble();
  }

  return sqrt(-2.0 * log(u)) * cos(2.0 * pi * v);
}

final sqrt2pi = sqrt(2 * pi);

double gaussProbability(double mean, double standardDeviation, double value) {
  final scalingCoefficient = 1 / (sqrt2pi * standardDeviation);
  final expCoefficient = (value - mean) *
      (value - mean) /
      (2 * standardDeviation * standardDeviation);

  return scalingCoefficient * exp(-expCoefficient);
}
