import 'package:flutter/material.dart';
//import 'package:photo_manager/photo_manager.dart';

class Talents extends StatefulWidget {
  @override
  _TalentsState createState() => _TalentsState();
}

class _TalentsState extends State<Talents> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Talent Uploads'),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
      ),
    );
  }
}
