import 'package:flutter/material.dart';
import 'package:talenthunt/widgets/Carousel.dart';

class World extends StatelessWidget {
  String title;
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
