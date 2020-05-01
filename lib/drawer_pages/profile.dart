import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/EditScreen.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Map<String, dynamic> profileData = {};

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    var snapRef =
        await Firestore.instance.collection('profile').document('123').get();

    var proData = snapRef.data;
    profileData = {
      "name": proData['name'],
      "city": proData['city'],
      "aboutme": proData['aboutme'],
      "points": proData['points'],
      "url": proData['avatarId']
    };
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (profileData.isEmpty) {
      return Center(child: CircularProgressIndicator());
    }
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 25.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: FaIcon(
                      FontAwesomeIcons.atom,
                      size: 35.0,
                    ),
                  ),
                  Text(
                    "PROFILE",
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: InkWell(
                      onTap: () {
                        print("ButtonTapped");
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => EditScreen(profileData)));
                      },
                      child: FaIcon(
                        FontAwesomeIcons.cog,
                        size: 35.0,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30.0,
              ),
              CircleAvatar(
                radius: 70,
                backgroundImage: NetworkImage(profileData["url"]),
              ),
              SizedBox(
                height: 15.0,
              ),
              Text(
                profileData['name'],
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w300),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                profileData['city'],
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 25.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  followCards("Followers", "10M"),
                  followCards("Following", "10"),
                ],
              ),
              SizedBox(
                height: 50.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  customButtons("Message", () {}),
                  customButtons("Follow", () {}),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              InkWell(
                onTap: () {},
                child: customContainer(
                    context, "About Me", profileData['aboutme']),
              ),
              customContainer(
                  context, "Points to be collected", profileData['points'])
            ],
          ),
        ),
      ),
    );
  }
}

Widget followCards(String title, String number) {
  return Column(children: <Widget>[
    Text(
      number,
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
    ),
    SizedBox(
      height: 5,
    ),
    Text(
      title,
      style: TextStyle(fontSize: 16),
    ),
  ]);
}

Widget customButtons(String title, Function onTap) {
  return InkWell(
    borderRadius: BorderRadius.circular(10.0),
    onTap: onTap,
    child: Container(
      decoration: BoxDecoration(
        color: Colors.black45,
        borderRadius: BorderRadius.circular(10.0),
      ),
      width: 140.0,
      height: 45.0,
      child: Center(
        child: Text(
          title,
          style: TextStyle(fontSize: 18),
        ),
      ),
    ),
  );
}

Widget customContainer(BuildContext context, String title, String description) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.8,
    padding: EdgeInsets.symmetric(vertical: 20.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          description,
          style: TextStyle(fontSize: 19, fontWeight: FontWeight.w300),
        )
      ],
    ),
  );
}
