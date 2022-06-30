import 'dart:math';

import 'package:tipe/src/behavior.dart';
import 'package:tipe/src/behaviors/default_behavior.dart';
import 'package:tipe/src/city.dart';
import 'package:tipe/src/rendering/renderable.dart';
import 'package:tipe/src/util/math.dart';
import 'package:tipe/src/virus.dart';
import 'package:vector_math/vector_math.dart';

const double targetAmplifier = 10000;
const double velocityAmplifier = 1 / 10;
const double maxVelocity = 10;
const double minVelocity = 0;

class Person extends Renderable {
  List<Behavior> behaviors = [];
  Vector2 position = Vector2.random() * City.size;
  Vector2 velocity = Vector2.zero();
  ViralState viralState = ViralState.susceptible;
  double infectionTime = 0;
  double recoveredTime = 0;

  Person() {
    behaviors.add(DefaultBehavior(this));
  }

  void update(double dt) {
    final targets = [
      for (final behavior in behaviors)
        if (!behavior.isPaused) behavior.process(dt)
    ];

    // add directions scaled by their intensity
    final acceleration = [
      for (final target in targets)
        (target.direction - position) *
            targetAmplifier *
            target.behavior.intensity *
            target.intensity /
            pow((target.direction - position).length2, 2).toDouble()
    ].reduce((a, b) => a + b);

    // move the person and make sure it's not outside the city
    velocity += acceleration * dt;

    // checks if velocity is too high or too low
    if (velocity.length2 > maxVelocity * maxVelocity) {
      velocity = velocity.normalized() * maxVelocity;
    } else if (velocity.length2 < minVelocity * minVelocity) {
      velocity = velocity.normalized() * minVelocity;
    }

    position += velocity * velocityAmplifier * dt;
    // TODO continuous colisions

    position.x = clamp(position.x, 0, City.size);
    position.y = clamp(position.y, 0, City.size);

    // update this person's viral state

    if (viralState == ViralState.susceptible) {
      for (final p in City.city.infectedCitizens) {
        final distance = (p.position - position).length2;
        final probability = Virus.infectionProbability(
          distance,
          p.infectionTime,
        );

        if (City.random.nextDouble() < probability) {
          viralState = City.random.nextDouble() < Virus.asymptomaticProbability
              ? ViralState.asymptomatic
              : ViralState.infectious;
          infectionTime = Virus.infectionTime();
          City.city.infectedCitizens.add(this);
          return;
        }
      }
    } else if (viralState == ViralState.infectious ||
        viralState == ViralState.asymptomatic) {
      infectionTime -= dt;

      if (infectionTime <= 0) {
        if (City.random.nextDouble() < Virus.recoverProbability ||
            viralState == ViralState.asymptomatic) {
          viralState = ViralState.recovered;
          recoveredTime = Virus.recoveredTime();
        } else {
          viralState = ViralState.removed;
        }
        City.city.infectedCitizens.remove(this);
      }
    } else if (viralState == ViralState.recovered) {
      recoveredTime -= dt;

      if (recoveredTime <= 0) {
        viralState = ViralState.susceptible;
      }
    }
  }

  B getBehavior<B extends Behavior>() => behaviors.whereType<B>().first;
}
