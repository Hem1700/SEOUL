import 'package:flutter/material.dart';
import '../globals.dart' as global;

class HeroType {
  String title;
  //String subTitle;
  String image;
  MaterialColor materialColor;
  int id;

  HeroType({
    this.title,
    this.image,
    // this.subTitle,
    this.materialColor,
    this.id,
  });

  List<HeroType> createSampleList() {
    // ignore: deprecated_member_use
    List _heroType = List<HeroType>();
    return _heroType
      ..add(HeroType(
        title: 'City',
        image: 'assets/images/city.jpeg',
        //subTitle: ''
        materialColor: Colors.pink,
        id: 1,
      ))
      ..add(HeroType(
        title: 'Mountains',
        image: 'assets/images/background.png',
        //subTitle: '',
        materialColor: Colors.lightGreen,
        id: 2,
      ))
      ..add(HeroType(
        title: 'Temple',
        image: 'assets/images/temple.png',
        //subTitle: '',
        materialColor: Colors.yellow,
        id: 3,
      ));
  }
}
