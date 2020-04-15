import 'package:flutter/material.dart';

class CustomPage extends StatelessWidget {
  CustomPage(this.title);
  final title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
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
