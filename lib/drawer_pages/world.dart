import 'package:flutter/material.dart';
import 'package:talenthunt/widgets/Carousel.dart';

class World extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,      (here you  can set the background color of your choice)
      appBar: AppBar(
        title: Text('World'),
        centerTitle: true,
        backgroundColor: Colors.black54,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,

        child: carousel(),
      ),
    );
  }
}
