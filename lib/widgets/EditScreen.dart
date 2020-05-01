import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';

pickImage(BuildContext context, Map profileData, ImageSource source) async {
  File image =
      await ImagePicker.pickImage(source: source); //syncs with gallery and app
  if (image == null) {
    Fluttertoast.showToast(msg: "No photo was selected");
  } else {
    Fluttertoast.showToast(msg: "Uploading Profile Photo");
    StorageReference reference =
        FirebaseStorage.instance.ref().child("profile/");
    StorageUploadTask uploadTask = reference.putFile(image);
    StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
    String uri = await taskSnapshot.ref.getDownloadURL();
    profileData['url'] = uri;
    Fluttertoast.showToast(msg: "Profile Photo Updated");
  }
}

showDialogBox(BuildContext context, Map profileData) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Center(child: Text("Choose Source")),
          content: Container(
            height: MediaQuery.of(context).size.height * 0.14,
            child: Column(
              children: <Widget>[
                FlatButton(
                  child: Text("Add image from Gallery"),
                  onPressed: () {
                    pickImage(context, profileData, ImageSource.gallery);
                    print("Button1 clicked");
                  },
                ),
                FlatButton(
                  child: Text("Add image from Camera"),
                  onPressed: () {
                    pickImage(context, profileData, ImageSource.camera);

                    print("Button2 clicked");
                  },
                )
              ],
            ),
          ),
        );
      });
}

addProfileDataToDatabase(Map data) async {
  await Firestore.instance.collection('profile').document('123').updateData({
    'avatarId': data['url'],
    'aboutme': data['aboutme'],
    'points': data['points'],
  });
}

class EditScreen extends StatelessWidget {
  final Map profileData;
  EditScreen(this.profileData);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          Fluttertoast.showToast(msg: "Saving Profile....");
          await addProfileDataToDatabase(profileData);
          Navigator.pop(context);
        },
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20.0,
              ),
              InkWell(
                onTap: () {
                  print("Change Avtar method");
                  showDialogBox(context, profileData);
                },
                child: CircleAvatar(
                  radius: 60.0,
                  child: Text("Change Avatar"),
                ),
              ),
              SizedBox(height: 30.0),
              Row(
                children: <Widget>[
                  Text("About Me"),
                  SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                      child: TextField(
                    onChanged: (val) {
                      profileData['aboutme'] = val;
                    },
                    style: TextStyle(fontSize: 20.0),
                  )),
                ],
              ),
              SizedBox(
                height: 25.0,
              ),
              Row(
                children: <Widget>[
                  Text("Points"),
                  SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                      child: TextField(
                    onChanged: (val) {
                      profileData['points'] = val;
                    },
                    style: TextStyle(fontSize: 20.0),
                  )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
