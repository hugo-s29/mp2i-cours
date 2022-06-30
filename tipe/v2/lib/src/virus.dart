import 'dart:math';

import 'package:tipe/src/city.dart';
import 'package:tipe/src/util/math.dart';

enum ViralState { susceptible, infectious, recovered, removed, asymptomatic }

class Virus {
  static final infectionProbabilityScale = 1 / 50;
  static final recoverProbability = 97 / 100;
  static final infectionTimeMean = 20.0;
  static final infectionTimeStandardDeviation = 3.0;
  static final recoveredTimeMean = 30.0;
  static final recoveredTimeStandardDeviation = 3.0;
  static final asymptomaticProbability = 2 / 3;

  static double infectionProbability(double distance, double infectionTime) =>
      exp(-5 * distance) * infectionProbabilityScale;

  static double infectionTime() =>
      infectionTimeStandardDeviation * normalRandom(City.random) +
      infectionTimeMean;

  static double recoveredTime() =>
      recoveredTimeStandardDeviation * normalRandom(City.random) +
      recoveredTimeMean;
}
