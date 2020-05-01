import 'package:flutter/material.dart';

class SingingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Singing"),
        centerTitle: true,
        backgroundColor: Colors.black54,
      ),
      body: GestureDetector(
        onDoubleTap: () {
          Navigator.pop(context);
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(horizontal: 5.0),
        ),
      ),
    );
  }
}
