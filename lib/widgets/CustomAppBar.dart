import 'package:flutter/material.dart';

Widget customAppBar({String title, List<Widget> actions = const []}) {
  return PreferredSize(
    preferredSize: Size.fromHeight(50.0),
    child: AppBar(
      title: Text(title),
      centerTitle: true,
      backgroundColor: Colors.cyan[300],
      actions: actions,
    ),
  );
}
