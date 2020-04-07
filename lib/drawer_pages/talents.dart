import 'package:flutter/material.dart';

class Talents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Talent Uploads'),
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
