import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:talenthunt/widgets/CarouselContainer.dart';
import 'package:talenthunt/Constants/CarouselItems.dart';

Widget carousel() {
  int index = 0;
  return CarouselSlider(
    onPageChanged: (i) {
      index = i;
    },
    height: 400.0,
    autoPlay: true,
    items: carouselImages.map((i) {
      return Builder(
        builder: (BuildContext context) {
          return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => carouselPages[index]),
                );
              },
              child: carouselContainer(context, i));
        },
      );
    }).toList(),
  );
}
