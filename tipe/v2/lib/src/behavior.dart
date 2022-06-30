import 'dart:math';

import 'package:tipe/src/city.dart';
import 'package:tipe/src/person.dart';
import 'package:tipe/src/util/math.dart';
import 'package:vector_math/vector_math.dart';

class Target {
  Vector2 direction;
  double intensity;
  Behavior behavior;

  Target(this.direction, this.intensity, this.behavior);

  Target.randomUniform(this.behavior)
      : direction = Vector2.random(City.random) * City.size,
        intensity = 1;

  factory Target.randomNear(
      Vector2 pos, double meanDistance, Behavior behavior) {
    // get a random target at a distance (plus some random variations)
    final distance = meanDistance * (1 + 0.5 * normalRandom(City.random));
    final angle = City.random.nextDouble() * 2 * pi;
    final direction = Vector2(cos(angle) * distance, sin(angle) * distance);

    return Target(direction + pos, 1, behavior);
  }

  Target.noTarget(this.behavior)
      : direction = Vector2.zero(),
        intensity = 0;
}

abstract class Behavior {
  Person person;

  Behavior(this.person);

  Target process(double dt);
  double get intensity;

  bool isPaused = false;

  void pause() => isPaused = true;
  void resume() => isPaused = false;
}
