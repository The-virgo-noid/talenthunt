import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:talenthunt/Constants/CarouselItems.dart';
import 'package:talenthunt/drawer_pages/CustomPage.dart';

class World extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('World'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/purpbg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: carousel(),
      ),
    );
  }
}

Widget carousel() {
  return CarouselSlider(
    height: 400.0,
    items: carouselImages.map((i) {
      return Builder(
        builder: (BuildContext context) {
          return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => CustomPage(i)),
                );
              },
              child: carouselContainer(context, i));
        },
      );
    }).toList(),
  );
}
