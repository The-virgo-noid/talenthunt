import 'package:flutter/material.dart';
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
      ),


    );
  }
}
