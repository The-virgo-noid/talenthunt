import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Talents extends StatefulWidget {
  Talents({Key key}) : super(key: key);

  @override
  _TalentsState createState() => _TalentsState();
}

class _TalentsState extends State<Talents> {
  File imageFile;

  _openGallery(BuildContext context) async {
    var image = await ImagePicker.pickImage(
        source: ImageSource.gallery); //syncs with gallery and app
    setState(() {
      imageFile = image;
    });
  }

  _openCamera(BuildContext context) async {
    var image = await ImagePicker.pickImage(
        source: ImageSource.camera); //syncs with camera and app
    setState(() {
      imageFile = image;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  Widget _decideImage() {
    if (imageFile == null) {
      return Text("Nothing Selected !",
          style: TextStyle(
            fontSize: 30.0,
            color: Colors.white,
          ));
    } else {
      return Image.file(imageFile, width: 500, height: 500);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Talent Uploads"),
        centerTitle: true,
        backgroundColor: Colors.black54,
      ),
      //backgroundColor: Colors.white, (same here you add the color of your choice)
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _decideImage(),
            ],
          ),
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,

      ),
      floatingActionButton: SpeedDial(
        curve: Curves.easeOutExpo,
        animatedIcon: AnimatedIcons.view_list,
        overlayColor: Colors.black87,
        backgroundColor: Colors.blueAccent,
        animatedIconTheme: IconThemeData.fallback(),
        shape: CircleBorder(),
        children: [
          SpeedDialChild(
            child: Icon(Icons.photo),
            backgroundColor: Colors.deepPurple,
            label: "Upload from Gallery",
            onTap: () {
              _openGallery(context);
            },
          ),
          SpeedDialChild(
            child: Icon(Icons.camera),
            backgroundColor: Colors.deepPurple,
            label: "Upload from Camera",
            onTap: () {
              _openCamera(context);
            },
          ),
        ],
      ),
    );
  }
}
