import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import '../widgets/selectPlayer.dart';

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
            waveType: WaveType.circularReveal,
            
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 50.0,
                margin: EdgeInsets.all(10),
                child: RaisedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => SelectPlayer(),
                      ),
                    );
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80.0)),
                  padding: EdgeInsets.all(0.0),
                  child: Ink(
                    decoration: BoxDecoration(
                      // gradient: LinearGradient(
                      //   colors: [
                      //     const Color.fromRGBO(0, 0, 0, 1),
                      //     const Color.fromRGBO(255, 255, 255, 1),
                      //   ],
                      //  begin: Alignment.centerLeft,
                      //  end: Alignment.centerRight,
                      // ),
                      borderRadius: BorderRadius.circular(30.0),
                      color: Colors.black,
                    ),
                    child: Container(
                      constraints: BoxConstraints(
                        maxWidth: 250.0,
                        minHeight: 50.0,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "Let's Go",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              // Container(
              //   height: 60,
              //   width: 200,
              //   child: ElevatedButton.icon(
              //     onPressed: () {
              //       Navigator.of(context).push(
              //         MaterialPageRoute(
              //           builder: (context) => SelectPlayer(),
              //         ),
              //       );
              //     },
              //     icon: Icon(Icons.arrow_right, size: 35),
              //     label: Text(
              //       "LET\'S GO!",
              //       style: TextStyle(fontSize: 25),
              //     ),
              //     style: ButtonStyle(
              //         backgroundColor:
              //             MaterialStateProperty.all<Color>(Colors.black)),
              //   ),

              //   // Center(
              //   //   child: Dismissible(
              //   //     child: Container(
              //   //       height: 40,
              //   //       width: 100,
              //   //       decoration: BoxDecoration(
              //   //         color: Colors.black,
              //   //         shape: BoxShape.rectangle,
              //   //         borderRadius: BorderRadius.circular(10),
              //   //       ),
              //   //       child: Center(
              //   //         child: Text("Swipe >>>" , style: TextStyle(
              //   //           color:Colors.white,
              //   //         ),),
              //   //       ),
              //   //     ),
              //   //     secondaryBackground: Text(''),
              //   //     background: Text(''),
              //   //     key: key,
              //   //     onDismissed: (direction) {
              //   //       Navigator.of(context).push(
              //   //         MaterialPageRoute(
              //   //           builder: (context) => SelectPlayer(),
              //   //         ),
              //   //       );
              //   //     },
              //   //   ),
              //   // ),
              // ),
            ),
          ),
        ],
      ),
    );
  }
}
