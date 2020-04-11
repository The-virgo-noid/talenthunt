import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Talents extends StatefulWidget {
  @override
  _TalentsState createState() => _TalentsState();
}

class _TalentsState extends State<Talents> {

  File imageFile;

  _openGallery(BuildContext context) async{
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);    //syncs with gallery and app
    setState(() {
      imageFile = image;
      Navigator.of(context).pop();
    });

  }

  _openCamera(BuildContext context) async{
    var image = await ImagePicker.pickImage(source: ImageSource.camera);    //syncs with camera and app
    setState(() {
      imageFile = image;
      Navigator.of(context).pop();
    });

  }

  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(context: context,builder: (BuildContext context) {

      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        title: Text("Select Option"),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              GestureDetector(
                child: Text("Gallery"),
                onTap: () {
                  _openGallery(context);
                },
              ),
              Padding(padding: EdgeInsets.all(8.0)),
              GestureDetector(
                child: Text("Camera"),
                onTap: () {
                  _openCamera(context);
                },
              ),
            ],
          ),
        ),
      );

    });
  }

  Widget _decideImage() {
    if(imageFile == null) {
      return Text(
          "Nothing Selected !",
          style: TextStyle(
            fontSize: 30.0,
            color: Colors.white,
          )
      );
    } else {
      return Image.file(imageFile, width: 500,height: 500);
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Talent Uploads"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/purpbg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _decideImage(),
              RaisedButton(onPressed: () {
                _showChoiceDialog(context);
              },
                color: Colors.amber,
                child: Text(
                  "Select Image",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
                elevation: 6.0,
              ),
              //RaisedButton(onPressed: () {                 //another box for upload start
              //    _showChoiceDialog(context);
              //},
              //color: Colors.amber,
              //child: Text(
              //"Upload",
              //style: TextStyle(
              //color: Colors.white,
              //),
              //), elevation: 6.0,
              //),                                         // box upload ends here
            ],
          ),
        ),
      ),
    );

  }
}

