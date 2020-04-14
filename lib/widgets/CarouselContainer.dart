import 'package:flutter/material.dart';

Widget carouselContainer(context, i) {
  return Container(
    width: MediaQuery.of(context).size.width,
    margin: EdgeInsets.symmetric(horizontal: 5.0),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20.0),
      image: DecorationImage(
        image: AssetImage(i),
        fit: BoxFit.cover,
      ),
    ),
  );
}
