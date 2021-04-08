import 'package:flutter/material.dart';

import '../model/hero.dart';
import './startgame.dart';

class Details extends StatefulWidget {
  final HeroType heroType;

  const Details({Key key, this.heroType}) : super(key: key);
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  HeroType _heroType;
  double _screenWidth;

  @override
  void initState() {
    super.initState();
    _heroType = widget.heroType;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _screenWidth = MediaQuery.of(context).size.width;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${_heroType.title}'),
        backgroundColor: _heroType.materialColor,
      ),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Hero(
              tag: 'background' + _heroType.title,
              child: Container(
                color: _heroType.materialColor,
              ),
            ),
            Positioned(
              top: 0.0,
              left: 0.0,
              width: _screenWidth,
              height: 700,
              child: Hero(
                tag: 'image' + _heroType.title,
                child: Image.asset(
                  _heroType.image,
                  fit: BoxFit.fitWidth,
                  height: 80.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  FlatButton(
                    onPressed: startgame,
                    color: Colors.black,
                    child: Text(
                      'Start Game',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: EdgeInsets.all(15),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
