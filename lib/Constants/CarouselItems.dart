import 'package:flutter/widgets.dart';
import 'package:talenthunt/Carousel_Pages/Dance.dart';
import 'package:talenthunt/Carousel_Pages/Others.dart';
import 'package:talenthunt/Carousel_Pages/Singing.dart';
import 'package:talenthunt/Carousel_Pages/Sports.dart';

List<dynamic> carouselImages = [
  "assets/catimages/dance.jpg",
  "assets/catimages/others.png",
  "assets/catimages/singing.jpg",
  "assets/catimages/sports.png",
];

List<String> imagesTitle = [
  "Dance",
  "Others",
  "Singing",
  "Sports",
];

List<Widget> carouselPages = [
  DancePage(),
  OthersPage(),
  SingingPage(),
  SportsPage(),
];
