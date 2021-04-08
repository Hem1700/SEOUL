import 'package:flutter/material.dart';

class Slide {
  final String image;
  final String title;
  final String description;

  Slide({
    @required this.image,
    @required this.description,
    @required this.title,
  });
}

final slideList = [
  Slide(
      image: 'assets/images/boxer/firstpageone.png',
      title: 'Da Xia',
      description: 'The Biggest Hero'),
  Slide(
      image: 'assets/images/boxer/firstpage-2.png',
      title: 'Dionysius',
      description: 'The God Of Drinking'),
];
