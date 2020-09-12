import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:talenthunt/widgets/PrivacyScreen.dart';

import 'SecurityScreen.dart';

pickImage(BuildContext context, Map profileData, ImageSource source) async {
  File image =
      await ImagePicker.pickImage(source: source); //syncs with gallery and app
  if (image == null) {
    Fluttertoast.showToast(msg: "No photo was selected");
  } else {
    Fluttertoast.showToast(msg: "Uploading Profile Photo");

    profileData['url'] =
        "https://wpcdn.us-east-1.vip.tn-cloud.net/www.channel3000.com/content/uploads/2020/03/Baby-Yoda-1024x576.jpg";
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

class EditScreen extends StatelessWidget {
  final Map profileData;
  EditScreen({this.profileData});
  bool switch1 = false, switch2 = true, switch3 = false;

  final List<String> settings = ['Privacy', 'Security'];

  final textfieldDecoration = InputDecoration(
    contentPadding: EdgeInsets.symmetric(
      horizontal: 10,
      vertical: 0,
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.blueAccent,
      ),
      borderRadius: BorderRadius.circular(10.0),
    ),
    hintText: "Enter Your Text Here..",
  );

  void gotoScreen(BuildContext context, String name) {
    Widget screen;
    if (name == "Privacy") {
      screen = PrivacyScreen();
    } else {
      screen = SecurityScreen();
    }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (ctx) => screen),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, profileData);
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Edit Profile"),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(25, 10, 0, 0),
              child: FloatingActionButton(
                heroTag: "btn1",
                child: Icon(
                  FontAwesomeIcons.powerOff,
                  size: 20,
                ),
                onPressed: () async {
                  Fluttertoast.showToast(msg: "Log Out....");
                  // Navigator.pop(context, profileData);
                },
              ),
            ),
            FloatingActionButton(
              heroTag: "btn2",
              child: Icon(Icons.add),
              onPressed: () async {
                Fluttertoast.showToast(msg: "Saving Profile....");
                Navigator.pop(context, profileData);
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Center(
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "About Me",
                        style: TextStyle(fontSize: 18),
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.65,
                          child: TextField(
                            decoration: textfieldDecoration,
                            onChanged: (val) {
                              profileData['aboutme'] = val;
                            },
                            style: TextStyle(fontSize: 18.0),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Points",
                        style: TextStyle(fontSize: 18),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.65,
                        child: TextField(
                          decoration: textfieldDecoration,
                          onChanged: (val) {
                            profileData['points'] = val;
                          },
                          style: TextStyle(fontSize: 18.0),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Divider(
                    color: Colors.grey,
                    thickness: 1.0,
                  ),
                  ListTile(
                    onTap: () {
                      gotoScreen(context, settings[0]);
                    },
                    title: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.grey, width: 1),
                        ),
                      ),
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                      child: Text(
                        settings[0],
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      gotoScreen(context, settings[1]);
                    },
                    title: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.grey, width: 1),
                        ),
                      ),
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                      child: Text(
                        settings[1],
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  NotificationSetting(),
                  SizedBox(
                    height: 5.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class NotificationSetting extends StatefulWidget {
  @override
  _NotificationSettingState createState() => _NotificationSettingState();
}

class _NotificationSettingState extends State<NotificationSetting> {
  bool switch1 = true, switch2 = false, switch3 = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Notification Settings',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SwitchListTile(
          value: switch1,
          title: Text("Received Notification"),
          onChanged: (val) {
            setState(() {
              switch1 = val;
            });
          },
        ),
        SwitchListTile(
          value: switch2,
          title: Text("Received Notification"),
          onChanged: (val) {
            setState(() {
              switch2 = val;
            });
          },
        ),
        SwitchListTile(
          value: switch3,
          title: Text("Received Notification"),
          onChanged: (val) {
            setState(() {
              switch3 = val;
            });
          },
        ),
      ],
    );
  }
}
