import 'dart:math';
import 'dart:ui';
import 'package:flame/game.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/painting.dart';
import '../components/background.dart';
import '../components/boxer.dart';
import '../components/fatigue.dart';
import '../components/perfect-time.dart';
import '../components/punch-marker.dart';
import '../components/title.dart';
import './shadow_master_screen.dart';

class ShadowTraining extends Game {
  final ShadowTrainingUIState ui;
  Random rnd;
  Size screen;
  double screenScale;
  double screenHeight;
  // double fps;
  // TextPainter fpsT;
  // TextStyle fpsS;

  // constants
  final double minNextSpawn = .5;
  final double maxNextSpawn = 2;
  final double nextSpawnReductionFactor = .95;
  final double maxSpeed = 12;
  final double initialSpeed = 5;
  final double speedIncrement = .05;

  // game status
  double gameSpeed = 0;
  double nextSpawn = 0;
  double runningSpawn = 0;
  double fatigueValue = 0;

  // components
  Background background;
  Title title;
  Boxer boxer;
  List<PunchMarker> markers;
  PerfectTime perfectTime;
  Fatigue fatigueBar;

  ShadowTraining(this.ui) {
    // fpsS = TextStyle(
    //   fontSize: 25,
    //   color: Color(0xffff0000),
    // );
    // fpsT = TextPainter(
    //   textAlign: TextAlign.left,
    //   textDirection: TextDirection.ltr,
    // );

    rnd = Random();

    // components
    background = Background(this);
    title = Title(this);
    boxer = Boxer(this);
    markers = List<PunchMarker>();
    fatigueBar = Fatigue(this);
  }

  void start() {
    perfectTime ??= PerfectTime(this);
    gameSpeed = initialSpeed;
    nextSpawn = 4;
    runningSpawn = nextSpawn;
    fatigueValue = 0;
    boxer.setStatus(BoxerStatus.idle);
    ui.score = 0;
    markers.clear();
  }

  void spawnMarker() {
    PunchMarkerType type;
    int r = rnd.nextInt(3);
    if (r == 0) type = PunchMarkerType.left;
    if (r == 1) type = PunchMarkerType.right;
    if (r == 2) type = PunchMarkerType.up;
    markers.add(PunchMarker(this, type));
  }

  void addFatigue(double fat) {
    if (ui.currentScreen != UIScreen.playing) return;
    fatigueValue = max(0, fatigueValue + fat);
    if (fatigueValue >= 1) {
      ui.currentScreen = UIScreen.lost;
      ui.update();
      boxer.setStatus(BoxerStatus.dizzy, howLong: 2);
    }
  }

  void calculatePunch(PunchMarkerType type) {
    if (ui.currentScreen != UIScreen.playing) return;
    bool hasHit = false;
    markers.forEach((PunchMarker m) {
      if (hasHit) return;
      if (!m.isHit && perfectTime.rect.overlaps(m.rect) && m.type == type) {
        Rect intersection = perfectTime.rect.intersect(m.rect);
        double percentage = intersection.width * intersection.height;
        addFatigue(fatigueValue * -.3 * percentage);
        m.hit(percentage);
        hasHit = true;
        ui.score += 1;
        if (ui.score > ui.highScore && ui.score > 0) {
          ui.highScore = ui.score;
          ui.storage.setInt('high-score', ui.highScore);
        }
        ui.update();
      }
    });
    if (!hasHit) {
      addFatigue((1 - fatigueValue) * .45);
    }
  }

  void render(Canvas c) {
    if (screen == null) return;
    c.save();
    c.scale(screenScale);
    c.translate(0, screenHeight);

    background.render(c);
    if (ui.currentScreen != UIScreen.playing) {
      title.render(c);
    }
    boxer.render(c);
    if (ui.currentScreen == UIScreen.playing) {
      fatigueBar.render(c);
      markers.forEach((PunchMarker m) => m.render(c));
      perfectTime.render(c);
    }

    c.restore();

    // fpsT.paint(c, Offset.zero);
  }

  void update(double t) {
    boxer.update(t);
    markers.forEach((PunchMarker m) => m.update(t));
    markers.removeWhere((PunchMarker m) => m.isExpired);

    if (ui.currentScreen == UIScreen.playing) {
      runningSpawn -= t;
      if (runningSpawn <= 0) {
        nextSpawn = max(
          minNextSpawn,
          min(
            maxNextSpawn,
            nextSpawn * nextSpawnReductionFactor,
          ),
        );
        runningSpawn = nextSpawn;
        spawnMarker();
      }
      if (gameSpeed < maxSpeed) {
        gameSpeed += speedIncrement * t;
        if (gameSpeed > maxSpeed) {
          gameSpeed = maxSpeed;
        }
      }
      addFatigue(.01 * t);
      fatigueBar.update(t);
    }

    // fps = 1 / t;
    // fpsT.text = TextSpan(text: fps.toString(), style: fpsS);
    // fpsT.layout();
  }

  void resize(Size s) {
    screen = s;
    screenScale = screen.width / 9;
    screenHeight = screen.height / screenScale;
    title.layout();
  }

  void onTapDown(TapDownDetails d) {
    if (ui.currentScreen != UIScreen.playing) {
      boxer.randomPunch();
    }
  }
}
