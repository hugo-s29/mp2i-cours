import 'dart:math';

import 'package:tipe/src/behavior.dart';
import 'package:tipe/src/city.dart';
import 'package:tipe/src/util/math.dart';

class DefaultBehavior extends Behavior {
  // time between new targets
  static final changeTargetTime = 1.5;

  // distance between person and its target
  static final distance = 10 * changeTargetTime;

  static final edgePaddingMean = 20;
  static final edgePaddingStandardDeviation = 10;

  static final reachedDistance = 20;

  double targetTime = 0;

  late Target target;
  late Target newTarget;

  DefaultBehavior(super.person) {
    target = Target.randomNear(person.position, distance, this);
    newTarget = Target.randomNear(target.direction, distance, this);
  }

  @override
  Target process(double dt) {
    // if has reached target, choose the next one

    if (targetTime > changeTargetTime ||
        (newTarget.direction - target.direction).length2 < reachedDistance) {
      targetTime = 0;
      newTarget = Target.randomNear(person.position, distance, this);
      return target;
    }

    target.direction = lerp2(target.direction, newTarget.direction, 0.01);
    target.intensity = lerp(target.intensity, newTarget.intensity, 0.01);

    final edgePadding = max(
          normalRandom(City.random) * edgePaddingStandardDeviation +
              edgePaddingMean,
          0,
        ) /
        10;

    // if too close to the edges, it will target the center of the city
    if (person.position.x < edgePadding ||
        person.position.x > City.size - edgePadding ||
        person.position.y < edgePadding ||
        person.position.y > City.size - edgePadding) {
      newTarget.direction = City.center;
      newTarget.intensity = 10;
      target.direction = lerp2(person.position, City.center, 0.2);
    }

    targetTime += dt;

    return target;
  }

  @override
  double get intensity => 1;
}
