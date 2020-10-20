import 'package:flutter/material.dart';
import 'package:talenthunt/drawer_pages/firstscreen.dart';

class SignUpForm extends StatelessWidget{
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sign Up',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: SignUp(),);
  }
}

class SignUp extends StatefulWidget{
  SignUpState createState()=>SignUpState();
}

class SignUpState extends State{

  final emailcontroller = TextEditingController();
  final namecontroller = TextEditingController();
  final mobilecontroller = TextEditingController();
  final passcontroller = TextEditingController();

  Widget build(BuildContext context){
    final emailField = TextField(                                                     //email- textfield
      obscureText: false,
      controller: emailcontroller,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email Here",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(30.0))),
    );

    final name = TextField(                                                                //username- textfield
      obscureText: false,
      controller: namecontroller,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Username",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(30.0))),
    );

    final mobile = TextField(
      obscureText: false,
      controller: mobilecontroller,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Phone number",                                                       //phone no- textfield
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(30.0))),
    );

    final passwordField = TextField(
      obscureText: true,
      controller: passcontroller,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password ",                                                              //password- textfield
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(30.0))),
    );

    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(20.0),
      color: Colors.blueAccent,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(50.0, 15.0, 50.0, 15.0),

        onPressed: () {
          User user=User();
          user.email=emailcontroller.text;
          user.name=namecontroller.text;
          user.mobile=mobilecontroller.text;
          user.pass=passcontroller.text;

          showAlertDialog(context,user);

        },
        child: Text("Submit",textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white , fontSize: 18,), ),
      ),
    );

    return Scaffold(
      appBar: AppBar(title: Text("Sign-Up "), centerTitle: true,),
      body: Center(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Sign up Form",style: TextStyle(color:Colors.white)),
                SizedBox(height: 0.0),
                emailField,
                SizedBox(height: 20.0),
                name,
                SizedBox(height: 20.0),
                mobile,
                SizedBox(height: 20.0),
                passwordField,
                SizedBox(height: 30.0,),
                loginButon,
                SizedBox(height: 5.0,),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward , size: 40, color: Colors.white,),
        shape: CircleBorder(),
        backgroundColor: Colors.blueAccent,
        splashColor: Colors.green,
        onPressed: () {
          Navigator.push(
              context,
              new MaterialPageRoute(builder: (context) => Firstscreen()));
        },
      ),
    );

  }
}

showAlertDialog(BuildContext context,User user){                                              //alertdialoguebox
  Widget gotIt = FlatButton(
    child: Text("Got It"),
    onPressed: () {
      Navigator.of(context, rootNavigator: true).pop('alert');
    },
  );

  AlertDialog alert = AlertDialog(
    title: Text("Your Credentials"),
    content: Text(user.email+"\n"+user.name+"\n"+user.mobile+"\n"+user.pass),
    actions: [
      gotIt,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

//model class
class User{
  String email;
  String name;
  String mobile;
  String pass;
}