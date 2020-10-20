import 'package:flutter/material.dart';
import 'package:talenthunt/widgets/CustomAppBar.dart';

class Notification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[100] ,
      appBar: customAppBar(title: 'Notification'),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 20.0,
          ),
          Center(
            child: Container(
              height: 50.0,
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextField(
                style: TextStyle(fontSize: 20.0),
                decoration: new InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 8),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  hintText: "Search",
                  fillColor: Colors.grey[300],
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
