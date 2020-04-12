import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:talenthunt/Constants/CarouselItems.dart';
import 'package:talenthunt/drawer_pages/CustomPage.dart';

class World extends StatefulWidget {
  @override
  _WorldState createState() => _WorldState();
}

class _WorldState extends State<World> {
  String title;
  @override
  void initState() {
    title = "Dance";
    super.initState();
  }

  void changePage(i) {
    setState(() {
      title = imagesTitle[i];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('World'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/purpbg.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: carousel(changePage),
          ),
          Positioned(
            bottom: 50.0,
            left: MediaQuery.of(context).size.width / 2 - 20,
            child: Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 30.0),
            ),
          )
        ],
      ),
    );
  }
}

Widget carousel(Function changePage) {
  return CarouselSlider(
    onPageChanged: (i) {
      changePage(i);
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
                      builder: (BuildContext context) => CustomPage(i)),
                );
              },
              child: carouselContainer(context, i));
        },
      );
    }).toList(),
  );
}
