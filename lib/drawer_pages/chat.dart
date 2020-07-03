import 'package:flutter/material.dart';
import 'package:talenthunt/widgets/CustomAppBar.dart';

class Chat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'Chats'),
    );
  }
}
