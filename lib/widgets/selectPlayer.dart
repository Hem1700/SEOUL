import 'package:flutter/material.dart';
import 'package:seoul/Screens/shadow_master_screen.dart';
import '../Screens/shadow_master_screen.dart';

class SelectPlayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
            child: RaisedButton(
          child: Text('Play Game'),
          onPressed: () {
          //  Navigator.of(context).pushNamed(ShadowMasterScreen.routeName);
          },
        )),
      ),
    );
  }
}
