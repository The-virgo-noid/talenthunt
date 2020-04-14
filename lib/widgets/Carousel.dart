import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:talenthunt/widgets/CarouselContainer.dart';
import 'package:talenthunt/Constants/CarouselItems.dart';
import 'package:talenthunt/drawer_pages/CustomPage.dart';

Widget carousel() {
  String title = imagesTitle[0];
  return CarouselSlider(
    onPageChanged: (i) {
      title = imagesTitle[i];
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
                      builder: (BuildContext context) => CustomPage(title)),
                );
              },
              child: carouselContainer(context, i));
        },
      );
    }).toList(),
  );
}
