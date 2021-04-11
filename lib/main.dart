import 'dart:async'; //for timer
//import 'package:flame/time.dart';
import 'package:flutter/material.dart';
import 'package:seoul/Screens/bg.dart';
import './model/slide.dart';
//import './SelectPlayer.dart';
import './widgets/slideitems.dart';
//import './model/hero.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SEOUL',
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
      
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState
    extends State<MyHomePage> //with SingleTickerProviderStateMixin
{
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);
  // Timer _timer;
  @override
  void initState() {
    super.initState();
    //_timer =
    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  Widget build(BuildContext context) {
    // _animationController.forward();
    // print(_nextPage.value);
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 70,
              ),
              Expanded(
                child: PageView.builder(
                  scrollDirection: Axis.horizontal,
                  onPageChanged: _onPageChanged,
                  // onPageChanged: (value) {
                  //   _animationController.forward();
                  // },
                  controller: _pageController,
                  itemCount: slideList.length,
                  itemBuilder: (ctx, i) => SlideItem(
                    index: i,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  FlatButton(
                    child: Text(
                      'Let\'s Go!',
                      style: TextStyle(fontSize: 18),
                    ),
                    onPressed: () {
                      setState(() {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => BackgroundScreen()));
                      });
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: EdgeInsets.all(15),
                    color: Colors.black,
                    textColor: Colors.white,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}



// import 'package:flame/flame.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter/material.dart';
// import './widgets/sfx.dart';
// import './Screens/shadow_master_screen.dart';
// import './Screens/shadow_training.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Flame.util.fullScreen();
//   await Flame.util.setOrientation(DeviceOrientation.portraitUp);

//   await Flame.images.loadAll(<String>[
//     'background.png',
//     'boxer/dizzy.png',
//     'boxingpng/b-idle.png',
//     'boxingpng/b-left.png',
//     'boxingpng/b-right.png',
//     'boxingpng/b-uppercut.png',
//     'markers.png',
//     'perfect-time.png',
//     'title.png',
//   ]);
//   await SFX.preload();
//   // await BGM.preload();
//   // BGM.play();

//   SharedPreferences storage = await SharedPreferences.getInstance();
//   ShadowTrainingUI gameUI = ShadowTrainingUI();
//   ShadowTraining game = ShadowTraining(gameUI.state);
//   gameUI.state.storage = storage;
//   gameUI.state.game = game;

//   runApp(
//     MaterialApp(
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         fontFamily: 'HVD',
//       ),
//       home: Scaffold(
//         body: Stack(
//           fit: StackFit.expand,
//           children: <Widget>[
//             Positioned.fill(
//               child: GestureDetector(
//                 behavior: HitTestBehavior.opaque,
//                 onTapDown: game.onTapDown,
//                 child: game.widget,
//               ),
//             ),
//             Positioned.fill(
//               child: gameUI,
//             ),
//           ],
//         ),
//       ),
//       debugShowCheckedModeBanner: false,
//     ),
//   );
// }