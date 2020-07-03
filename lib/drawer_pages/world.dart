import 'package:flutter/material.dart';
import 'package:talenthunt/widgets/CustomAppBar.dart';
import './notification.dart' as localNotificationPage;

class World extends StatefulWidget {
  @override
  _WorldState createState() => _WorldState();
}

class _WorldState extends State<World> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,      (here you  can set the background color of your choice)
      appBar: customAppBar(
        title: "Home",
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notification_important),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => localNotificationPage.Notification(),
              ),
            ),
          ),
        ],
      ),

      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
      ),
    );
  }
}
