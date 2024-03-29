import 'package:flame/flame.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import './sfx.dart';
import '../Screens/shadow_master_screen.dart';
import '../Screens/shadow_training.dart';
import 'package:shared_preferences/shared_preferences.dart';

void startgame() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.util.fullScreen();
  await Flame.util.setOrientation(DeviceOrientation.portraitUp);

  await Flame.images.loadAll(<String>[
    'background.png',
    'boxer/dizzy.png',
    'boxingpng/b-idle.png',
    'boxingpng/b-left.png',
    'boxingpng/b-right.png',
    'boxingpng/b-uppercut.png',
    'markers.png',
    'perfect-time.png',
    'title.png',
  ]);
  await SFX.preload();
  // await BGM.preload();
  // BGM.play();

  SharedPreferences storage = await SharedPreferences.getInstance();
  ShadowTrainingUI gameUI = ShadowTrainingUI();
  ShadowTraining game = ShadowTraining(gameUI.state);
  gameUI.state.storage = storage;
  gameUI.state.game = game;

  runApp(
    MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'HVD',
      ),
      home: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Positioned.fill(
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTapDown: game.onTapDown,
                child: game.widget,
              ),
            ),
            Positioned.fill(
              child: gameUI,
            ),
          ],
        ),
      ),
      debugShowCheckedModeBanner: false,
    ),
  );
}
