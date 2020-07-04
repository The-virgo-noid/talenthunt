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
      body: Stack(
        children: <Widget>[
          Positioned(
            height: MediaQuery.of(context).size.height,
            right: 10.0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(
                  Icons.more_horiz,
                  size: 45.0,
                ),
                Column(
                  children: <Widget>[
                    Icon(
                      Icons.account_circle,
                      size: 45.0,
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Icon(
                      Icons.favorite,
                      size: 45.0,
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Icon(
                      Icons.message,
                      size: 45.0,
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Icon(
                      Icons.share,
                      size: 45.0,
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.0,
                ),
              ],
            ),
          ),
          Positioned.directional(
            textDirection: TextDirection.ltr,
            bottom: 10.0,
            start: 20.0,
            child: Text(
              '@name',
              style: TextStyle(fontSize: 20.0),
            ),
          ),
        ],
      ),
    );
  }
}
