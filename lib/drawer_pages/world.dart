import 'package:flutter/material.dart';
import 'package:talenthunt/widgets/CustomAppBar.dart';
import './notification.dart' as localNotificationPage;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class World extends StatefulWidget {
  @override
  _WorldState createState() => _WorldState();
}

class _WorldState extends State<World> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white ,
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
                IconButton(
                  icon: Icon(
                    Icons.more_horiz,
                    size: 45.0,
                    color: Colors.cyan,
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: Text("Report User"),
                        content:
                            Text("Are you sure you want to block this user ?"),
                        actions: <Widget>[
                          FlatButton(
                            child: Text('Report'),
                            onPressed: () {
                              print("Add Report Code here");
                              Navigator.pop(context);
                            },
                          ),
                          FlatButton(
                            child: Text('Close'),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                Column(
                  children: <Widget>[
                    IconButton(
                        icon: Icon(
                          Icons.account_circle,
                          color: Colors.cyan,
                          size: 45.0,
                        ),
                        onPressed: () {}),
                    SizedBox(
                      height: 30.0,
                    ),
                    IconButton(
                        icon: Icon(
                          Icons.favorite,
                          size: 45.0,
                          color: Colors.cyan,
                        ),
                        onPressed: () {}),
                    SizedBox(
                      height: 30.0,
                    ),
                    IconButton(
                        icon: FaIcon(
                          FontAwesomeIcons.commentAlt,
                          size: 40.0,
                          color: Colors.cyan,
                        ),
                        onPressed: () {}),
                    SizedBox(
                      height: 30.0,
                    ),
                    IconButton(
                        icon: Icon(
                          Icons.share,
                          size: 45.0,
                          color: Colors.cyan,// share command here
                        ),
                        onPressed: () {}),
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
