import 'package:tipe/src/person.dart';
import 'package:tipe/src/place.dart';
import 'package:tipe/src/rendering/renderable.dart';

abstract class Renderer {
  static late Renderer _renderer;
  static void bindRenderer(Renderer r) => _renderer = r;

  static void render(Renderable renderable) {
    if (renderable is Person) _renderer.renderPerson(renderable);
    if (renderable is Place) _renderer.renderPlace(renderable);
  }

  void renderPerson(Person person);
  void renderPlace(Place place);

  Future<double> nextFrame();
  void clearBackground();
}
