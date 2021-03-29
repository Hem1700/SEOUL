import 'dart:ui';
import 'package:flame/sprite.dart';
import '../Screens/shadow_training.dart';

class Background {
  final ShadowTraining game;
  Rect rect;
  Sprite sprite;

  Background(this.game) {
    rect = Rect.fromLTWH(0, -22, 9, 22);
    sprite = Sprite('background.png');
  }

  void render(Canvas c) {
    sprite.renderRect(c, rect);
  }
}
