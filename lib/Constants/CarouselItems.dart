import 'package:flutter/material.dart';

List<dynamic> carouselImages = [
  "assets/catimages/dance.jpg",
  "assets/catimages/others.png",
  "assets/catimages/singing.jpg",
  "assets/catimages/sports.png",
];

Widget carouselContainer(context, i) {
  return Container(
    width: MediaQuery.of(context).size.width,
    margin: EdgeInsets.symmetric(horizontal: 5.0),
    decoration: BoxDecoration(
      color: Colors.white,
      image: DecorationImage(
        image: AssetImage(i),
        fit: BoxFit.cover,
      ),
    ),
  );
}
