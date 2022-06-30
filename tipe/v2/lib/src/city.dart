import 'dart:math';

import 'package:tipe/src/person.dart';
import 'package:tipe/src/place.dart';
import 'package:vector_math/vector_math.dart';

class City {
  List<Person> citizens = [];
  List<Place> places = [];

  static double size = 100;
  static Vector2 center = Vector2(size / 2, size / 2);
  static Random random = Random();
  static City city = City();

  List<Person> infectedCitizens = [];
}
