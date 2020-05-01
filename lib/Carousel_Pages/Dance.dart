import 'package:flutter/material.dart';

class DancePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dance"),
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
