import 'dart:math';
import 'dart:ui';

abstract class ColorGenerator {
  ColorGenerator._();

  static final Random _random = Random();

  static Color getRandomColor({int alpha = 255}) {
    return Color.fromARGB(
      alpha,
      _random.nextInt(256),
      _random.nextInt(256),
      _random.nextInt(256),
    );
  }
}