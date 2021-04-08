import 'dart:math';
import 'dart:ui';
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';
import './punch-marker.dart';
import '../widgets/sfx.dart';
import '../Screens/shadow_training.dart';

class Boxer {
  final ShadowTraining game;
  final double punchDuration = .2;
  bool initialized;
  BoxerStatus status;
  double backToIdle;
  Rect rect;
  double idleIndex;
  double dizzyIndex;
  List<Sprite> idleSprite;
  List<Sprite> dizzySprite;
  Sprite punchLeftSprite;
  Sprite punchRightSprite;
  Sprite punchUpSprite;

  Boxer(this.game) {
    initialized = false;
    status = BoxerStatus.idle;
    backToIdle = 0;
    rect = Rect.fromLTWH(2, -8, 4, 4);
    idleIndex = 0;
    dizzyIndex = 0;
    idleSprite = List<Sprite>();
    dizzySprite = List<Sprite>();
    loadSprites();
  }

  void loadSprites() async {
    // idle
    Image idleImage = await Flame.images.load('boxer/idle.png');
    int idleFrames = idleImage.width ~/ idleImage.height;
    for (int f = 0; f < idleFrames; f++) {
      idleSprite.add(
        Sprite.fromImage(
          idleImage,
          x: idleImage.height.toDouble() * f,
          width: idleImage.height.toDouble(),
        ),
      );
    }

    // dizzy
    Image dizzyImage = await Flame.images.load('boxer/dizzy.png');
    int dizzyFrames = dizzyImage.width ~/ dizzyImage.height;
    for (int f = 0; f < dizzyFrames; f++) {
      dizzySprite.add(
        Sprite.fromImage(
          dizzyImage,
          x: dizzyImage.height.toDouble() * f,
          width: idleImage.height.toDouble(),
        ),
      );
    }

    // punches
    punchLeftSprite = Sprite('boxer/punch-left.png');
    punchRightSprite = Sprite('boxer/punch-right.png');
    punchUpSprite = Sprite('boxer/punch-up.png');

    initialized = true;
  }

  void setStatus(BoxerStatus toWhat, {double howLong}) {
    howLong ??= 0;
    status = toWhat;
    backToIdle = max(0, howLong);
  }

  void punch(BoxerStatus withWhat) {
    if (status == BoxerStatus.dizzy) return;
    if (game.ui.isSFXEnabled) SFX.playRandomPunch();
    setStatus(withWhat, howLong: punchDuration);
  }

  void punchLeft() {
    punch(BoxerStatus.punchLeft);
    game.calculatePunch(PunchMarkerType.left);
  }

  void punchRight() {
    punch(BoxerStatus.punchRight);
    game.calculatePunch(PunchMarkerType.right);
  }

  void upperCut() {
    punch(BoxerStatus.punchUp);
    game.calculatePunch(PunchMarkerType.up);
  }

  void randomPunch() {
    int punch = game.rnd.nextInt(3);
    if (punch == 0) punchLeft();
    if (punch == 1) punchRight();
    if (punch == 2) upperCut();
  }

  void render(Canvas c) {
    if (!initialized) return;

    switch (status) {
      case BoxerStatus.idle:
        idleSprite[idleIndex.toInt()].renderRect(c, rect);
        break;
      case BoxerStatus.dizzy:
        dizzySprite[dizzyIndex.toInt()].renderRect(c, rect);
        break;
      case BoxerStatus.punchLeft:
        punchLeftSprite.renderRect(c, rect);
        break;
      case BoxerStatus.punchRight:
        punchRightSprite.renderRect(c, rect);
        break;
      case BoxerStatus.punchUp:
        punchUpSprite.renderRect(c, rect);
        break;
    }
  }

  void update(double t) {
    if (!initialized) return;

    if (status == BoxerStatus.idle) {
      idleIndex += idleSprite.length * t * 2;
      while (idleIndex > idleSprite.length) {
        idleIndex -= idleSprite.length;
      }
    }

    if (status == BoxerStatus.dizzy) {
      dizzyIndex += dizzySprite.length * t * 5;
      while (dizzyIndex > dizzySprite.length) {
        dizzyIndex -= dizzySprite.length;
      }
    }

    if (status != BoxerStatus.idle) {
      backToIdle = max(0, backToIdle - t);
      if (backToIdle == 0) {
        status = BoxerStatus.idle;
      }
    }
  }
}

enum BoxerStatus {
  idle,
  dizzy,
  punchLeft,
  punchRight,
  punchUp,
}
