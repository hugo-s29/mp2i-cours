import 'package:tipe/src/rendering/renderable.dart';
import 'package:vector_math/vector_math.dart';

class Place extends Renderable {
  Vector2 location;
  double size;

  Place({required this.location, required this.size});
}
