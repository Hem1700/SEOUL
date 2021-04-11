import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:flutter/cupertino.dart';
import '../Screens/shadow_training.dart';
import '../globals.dart' as global;

Sprite _backgroundimage(int id, String image) {
  if (id == 1) {
    image = 'city.jpeg';
  } else if (id == 2) {
    image = 'background.png';
  } else {
    image = 'temple.png';
  }
  return Sprite(image);
}

class Background {
  final ShadowTraining game;
  Rect rect;
  Sprite sprite;

  Background(this.game) {
    rect = Rect.fromLTWH(0, -22, 9, 22);
    sprite = _backgroundimage(global.background_id, '');
  }

  void render(Canvas c) {
    sprite.renderRect(c, rect);
  }
}
