import 'package:flutter/material.dart';
import '../model/slide.dart';

class SlideItem extends StatelessWidget {
  final int index;
  SlideItem({this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          slideList[index].title,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          slideList[index].description,
          style: TextStyle(
            fontSize: 20,
            color: Colors.black54,
            //fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          width: 350,
          height: 450,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(slideList[index].image), fit: BoxFit.cover),
          ),
        ),
      ],
    );
  }
}
