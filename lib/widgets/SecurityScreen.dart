import 'package:flutter/material.dart';

class SecurityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Security"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 10.0, // soften the shadow
                spreadRadius: 1.0, //extend the shadow
                offset: Offset(
                  0.0, // Move to right 10  horizontally
                  5.0, // Move to bottom 10 Vertically
                ),
              )
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              listButtons(Icons.security, 'Password'),
              listButtons(Icons.access_time, 'Login Activity'),
              listButtons(Icons.info, 'Saved Login Info'),
              listButtons(Icons.account_circle, 'Two Factor Authentication'),
            ],
          ),
        ),
      ),
    );
  }

  Widget listButtons(IconData icon, String title) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 0.6),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(
                icon,
                size: 23,
              ),
              SizedBox(
                width: 20.0,
              ),
              Text(
                title,
                style: TextStyle(fontSize: 15.0),
              ),
            ],
          ),
          Icon(
            Icons.keyboard_arrow_right,
            size: 28,
          ),
        ],
      ),
    );
  }
}
