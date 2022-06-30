import 'package:tipe/src/behavior.dart';
import 'package:tipe/src/behaviors/basic_behavior.dart';
import 'package:tipe/src/city.dart';
import 'package:tipe/src/place.dart';
import 'package:tipe/src/util/math.dart';
import 'package:vector_math/vector_math.dart';

class WorkerBehavior extends Behavior {
  WorkerBehavior(super.person) {
    offset = Vector2(
          normalRandom(City.random),
          normalRandom(City.random),
        ) *
        workplace.size;

    if (goToWork) person.getBehavior<BasicBehavior>().pause();
  }

  @override
  double get intensity => 140;

  bool goToWork = City.random.nextBool();
  double timeSinceWorkChanged = 0;
  Place workplace =
      City.city.places[City.random.nextInt(City.city.places.length)];
  Vector2 offset = Vector2.zero();

  static final reachedDistance = 20;
  static final changeTime = 60;

  @override
  Target process(double dt) {
    if (goToWork) {
      if ((workplace.location + offset - person.position).length2 <
          reachedDistance * reachedDistance * workplace.size * workplace.size) {
        timeSinceWorkChanged += dt;
        if (timeSinceWorkChanged > changeTime) {
          goToWork = false;
          timeSinceWorkChanged = 0;

          person.getBehavior<BasicBehavior>().resume();

          return notWorkingTarget;
        }
      }

      return workTarget;
    } else {
      timeSinceWorkChanged += dt;

      if (timeSinceWorkChanged > changeTime) {
        goToWork = true;
        timeSinceWorkChanged = 0;

        person.getBehavior<BasicBehavior>().pause();

        return workTarget;
      } else {
        return notWorkingTarget;
      }
    }
  }

  Target get workTarget => Target(workplace.location + offset, 3, this);
  Target get notWorkingTarget {
    final direction = [
      for (final place in City.city.places)
        (person.position + place.location) * place.size
    ].reduce((a, b) => a + b);

    return Target(person.position + direction, 3, this);
  }
}
