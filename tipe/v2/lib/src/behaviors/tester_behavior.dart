import 'package:tipe/tipe.dart';

class TesterBehavior extends Behavior {
  TesterBehavior(super.person);

  static final double testingTimeMean = 30;
  static final double testingTimeStandardDeviation = 4;

  double testingTime = 0;

  @override
  double get intensity => 0;

  @override
  Target process(double dt) {
    if (testingTime <= 0) {
      if (person.viralState == ViralState.asymptomatic) {
        person.viralState = ViralState.infectious;
      }

      testingTime = testingTimeMean +
          testingTimeStandardDeviation * normalRandom(City.random);
    }

    testingTime -= dt;

    return Target.noTarget(this);
  }
}
