import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import '../SelectPlayer.dart';

class FirstScreen extends StatefulWidget {
  Key key;
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
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
            child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 60,
                  width: 200,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => SelectPlayer(),
                        ),
                      );
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

                  // Center(
                  //   child: Dismissible(
                  //     child: Container(
                  //       height: 40,
                  //       width: 100,
                  //       decoration: BoxDecoration(
                  //         color: Colors.black,
                  //         shape: BoxShape.rectangle,
                  //         borderRadius: BorderRadius.circular(10),
                  //       ),
                  //       child: Center(
                  //         child: Text("Swipe >>>" , style: TextStyle(
                  //           color:Colors.white,
                  //         ),),
                  //       ),
                  //     ),
                  //     secondaryBackground: Text(''),
                  //     background: Text(''),
                  //     key: key,
                  //     onDismissed: (direction) {
                  //       Navigator.of(context).push(
                  //         MaterialPageRoute(
                  //           builder: (context) => SelectPlayer(),
                  //         ),
                  //       );
                  //     },
                  //   ),
                  // ),
                )),
          ),
        ],
      ),
    );
  }
}
