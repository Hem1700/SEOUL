import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import './SelectPlayer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final pages = [
    Container(
      color: Colors.red[400],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Container(
                height: 400,
                child: Image.asset("assets/images/boxer/first page one.png")),
          ),
        ],
      ),
    ),
    /* Container(
      // height: 300,
      color: Color(0xFF8A7F7C),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Image.asset("assets/images/boxer/first page one.png"),
          )
        ],
      ),
    ),*/
    Container(
      color: Colors.blueAccent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Image.asset("assets/images/boxer/first page-2 two.png"),
          )
        ],
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          LiquidSwipe(
            pages: pages,
            enableLoop: true,
            fullTransitionValue: 600,
            enableSlideIcon: true,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              // height: 40,
              width: 380,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SelectPlayer()));
                },
                icon: Icon(Icons.arrow_right, size: 35),
                label: Text(
                  "LET\'S GO!",
                  style: TextStyle(fontSize: 25),
                ),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.black)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
