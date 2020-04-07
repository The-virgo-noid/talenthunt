import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:talenthunt/Animations/FadeAnimation.dart';
import 'package:talenthunt/SignUpForm.dart';
import 'HomePage.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Color.fromRGBO(3, 9, 23, 1),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/purple.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FadeAnimation(1.2, Text("LOGIN",
              style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),)),
            SizedBox(height: 30,),
            FadeAnimation(1.5, Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      border: Border(bottom:  BorderSide(color: Colors.grey[300]))
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        icon: Icon(Icons.email),
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.grey.withOpacity(.8)),
                        hintText: "Email or Phone Number"
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border(bottom:  BorderSide(color: Colors.grey[300]))
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                          icon: Icon(Icons.fiber_manual_record),
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: Colors.grey.withOpacity(.8)),
                          hintText: "Password"
                      ),
                    ),
                  ),
                ],
              ),
            )),
            SizedBox(height: 40,),
            FadeAnimation(1.8, Center(

                child: Center(
                    child: RaisedButton.icon(
                      onPressed: () {Navigator.push(context, new MaterialPageRoute(builder: (context) =>MyHomePage()));},
                      icon: Icon(Icons.arrow_forward_ios),
                      label: Text("Login"),
                      color: Colors.blueAccent,
                      splashColor: Colors.indigoAccent,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                    )
                ),
            )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FadeAnimation(1.8, Center(

                child: Center(
                    child: RaisedButton.icon(
                      onPressed: () {Navigator.push(context, new MaterialPageRoute(builder: (context) =>SignUpForm()));},
                      icon: Icon(Icons.arrow_forward_ios),
                      label: Text("Sign Up"),
                      color: Colors.blueAccent,
                      splashColor: Colors.indigoAccent,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                    )
                ),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
