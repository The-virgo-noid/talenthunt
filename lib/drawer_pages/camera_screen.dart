import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:nice_button/nice_button.dart';
import 'package:talenthunt/drawer_pages/uploads.dart';

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
            color: Colors.black,
          ));
    } else {
      return Image.file(imageFile, width: 500, height: 500);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[100],
      appBar: AppBar(
        title: Text("Pick Images from.."),
        backgroundColor: Colors.cyan[300],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _decideImage(),
                // if(_image != null)
                //   Image.file(_image)
                // else(
                //     Text("Click to select an Image !", style: TextStyle(fontSize: 32.0,fontWeight: FontWeight.bold,color: Colors.purple),)),
                SizedBox(
                  height: 200.0,
                ),
                NiceButton(
                  width: 280,
                  elevation: 8.0,
                  radius: 52.0,
                  text: "GALLERY",
                  background: Colors.blueAccent,
                  onPressed: () {_openGallery(context);
                  },
                ),

                SizedBox(
                  height: 30.0,
                ),
                // if(_cameraImage != null)
                //   Image.file(_cameraImage)
                // else
                //Text("Click to select an Image", style: TextStyle(fontSize: 18.0),),
                  NiceButton(
                    width: 280,
                    elevation: 8.0,
                    radius: 52.0,
                    text: "CAMERA",
                    background: Colors.orangeAccent,
                    onPressed: () {_openCamera(context);
                    },
                  ),
                SizedBox(
                  height: 30.0,
                ),
                NiceButton(
                    width: 280,
                    elevation: 8.0,
                    radius: 52.0,
                    text: "NEXT",
                    background: Colors.green,
                    onPressed: () {Navigator.push(context ,MaterialPageRoute(builder: (context) => Uploads()));}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
