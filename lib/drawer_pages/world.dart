import 'package:flutter/material.dart';
//import 'package:talenthunt/drawer_pages/notification.dart';

class World extends StatefulWidget {
  @override
  _WorldState createState() => _WorldState();
}

class _WorldState extends State<World> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,      (here you  can set the background color of your choice)
      appBar: AppBar(
        title: Text('HOME'),
        centerTitle: true,
        backgroundColor: Colors.cyan[300],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,

      ),
    );
  }
}

//class MyAppbar extends AppBar{
//  MyAppbar({Key key, Widget title}):
//      super(key: key, title:title, actions: <Widget>[new IconButton(icon: new Icon(Icons.notification_important), onPressed: () {
//      Navigator.push(
//      context,
//      new MaterialPageRoute(
//     builder: (context) => Notification()));
//      },)]);
//}