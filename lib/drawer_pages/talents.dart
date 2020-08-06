import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';



class Talents extends StatefulWidget {
  @override
  _TalentsState createState() => _TalentsState();
}

class _TalentsState extends State<Talents> {
  File _image;

  getImageFile(ImageSource source) async {
    //
    var image = await ImagePicker.platform.pickImage(source: source);
    File cropppedFile = await ImageCropper.cropImage(
      sourcePath: image.path,
      aspectRatio: CropAspectRatio(ratioX: 1.0, ratioY: 1.0),
      maxHeight: 512,
      maxWidth: 512,
    );
    setState(() {
      _image = cropppedFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Crop"),
      ),
      body: SafeArea(
        child: Column(children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height / 2.2,
            child: Center(
              child: _image == null
                  ? Text("Image")
                  : Image.file(
                _image,
                height: 200,
                width: 200,
              ),
            ),
          ),
         // Expanded(child: BuildGrid()),
        ]),
      ),
      floatingActionButton: Row(
        children: <Widget>[
          FloatingActionButton.extended(
            label: Text("Photo"),
            heroTag: UniqueKey(),
            icon: Icon(Icons.camera),
            onPressed: () => getImageFile(ImageSource.camera),
          ),
          FloatingActionButton.extended(
            label: Text("Galery"),
            heroTag: UniqueKey(),
            icon: Icon(Icons.photo_library),
            onPressed: () => getImageFile(ImageSource.gallery),
          ),
        ],
      ),
    );
  }
}