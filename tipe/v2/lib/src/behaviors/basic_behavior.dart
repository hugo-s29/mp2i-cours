import 'dart:math';

import 'package:tipe/src/behavior.dart';
import 'package:tipe/src/city.dart';
import 'package:tipe/src/virus.dart';
import 'package:vector_math/vector_math.dart';

class BasicBehavior extends Behavior {
  static final double pullIntensity = 3;
  static final double sightRadius = 10;

  BasicBehavior(super.person);

  @override
  Target process(double dt) {
    // apply an inverted gravitational pull from the infected people to the susceptible
    if (person.viralState == ViralState.infectious) {
      final force = [
        for (final p in City.city.citizens)
          if (p.viralState != ViralState.infectious)
            if ((p.position - person.position).length2 <
                sightRadius * sightRadius)
              (p.position - person.position).normalized() /
                  max((p.position - person.position).length2, 0.1),
        Vector2.zero()
      ].reduce((a, b) => a + b);

      if (force.length2 >= 0.1) {
        return Target(-force * pullIntensity + person.position, 4, this);
      } else {
        return Target.noTarget(this);
      }
    }

    final force = ([
      for (final p in City.city.infectedCitizens)
        if (p.viralState == ViralState.infectious)
          if ((p.position - person.position).length2 <
              sightRadius * sightRadius)
            (p.position - person.position).normalized() /
                max((p.position - person.position).length2, 0.1),
      Vector2.zero()
    ]).reduce((a, b) => a + b);

    if (force.length2 >= 0.1) {
      return Target(-force * pullIntensity + person.position, 4, this);
    } else {
      return Target.noTarget(this);
    }
  }

  @override
  double get intensity => 30;
}
