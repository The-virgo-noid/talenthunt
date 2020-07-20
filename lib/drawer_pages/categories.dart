import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
//import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:talenthunt/drawer_pages/talents.dart';

class Categories extends StatefulWidget {
  Categories({Key key, this.title}) : super(key: key);

  final String title;

  bool isDeleted = true;
  bool isSelected  = false;

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {

  int _value0 = 1;
  int _value1 = 1;
  int _value2 = 1;
  int _value3 = 1;
  int _value4 = 1;
  int _value5 = 1;
  int _value6 = 1;
  int _value7 = 1;
  int _value8 = 1;
  int _value9 = 1;
  int _value10 = 1;
  int _value11= 1;
  int _value12 = 1;
  //int _value13 = 1;

  var textStyle = TextStyle(fontSize: 33);
  var textStyle1 = TextStyle(fontSize: 33);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Categories"),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 5.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              FilterChip(
                pressElevation: 0.0,
                selectedColor: Colors.lightBlueAccent,
                backgroundColor: Colors.grey[100],
                label: Text("Comedy",style: textStyle,),
                selected: _value0 == 0,
                onSelected: (bool selected) {
                  setState(() {
                    _value0 = selected ? 0 : null;
                  });
                },
              ),
              FilterChip(
                pressElevation: 0.0,
                selectedColor: Colors.greenAccent,
                backgroundColor: Colors.grey[100],
                label: Text("Singing",style: textStyle,),
                selected: _value1 == 0,
                onSelected: (bool selected) {
                  setState(() {
                    _value1 = selected ? 0 : null;
                  });
                },
              ),
            ],),
          SizedBox(height: 10.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              FilterChip(
                pressElevation: 0.0,
                selectedColor: Colors.yellowAccent,
                backgroundColor: Colors.grey[100],
                label: Text("Flute",style: textStyle,),
                selected: _value2 == 0,
                onSelected: (bool selected) {
                  setState(() {
                    _value2 = selected ? 0 : null;
                  });
                },
              ),
              FilterChip(
                pressElevation: 0.0,
                selectedColor: Colors.pinkAccent,
                backgroundColor: Colors.grey[100],
                label: Text("Photography",style: textStyle,),
                selected: _value3 == 0,
                onSelected: (bool selected) {
                  setState(() {
                    _value3 = selected ? 0 : null;
                  });
                },
              ),
            ],),
          SizedBox(height: 10.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              FilterChip(
                pressElevation: 0.0,
                selectedColor: Colors.orangeAccent,
                backgroundColor: Colors.grey[100],
                label: Text("Drawing/Artist",style: textStyle1,),
                selected: _value4 == 0,
                onSelected: (bool selected) {
                  setState(() {
                    _value4 = selected ? 0 : null;
                  });
                },
              ),
            ],),
          SizedBox(height: 10.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              FilterChip(
                pressElevation: 0.0,
                selectedColor: Colors.lightGreen,
                backgroundColor: Colors.grey[100],
                label: Text("Cube Solving",style: textStyle1,),
                selected: _value5 == 0,
                onSelected: (bool selected) {
                  setState(() {
                    _value5 = selected ? 0 : null;
                  });
                },
              ),
            ],),
          SizedBox(height: 10.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              FilterChip(
                pressElevation: 0.0,
                selectedColor: Colors.purpleAccent,
                backgroundColor: Colors.grey[100],
                label: Text("Handwriting",style: textStyle,),
                selected: _value6 == 0,
                onSelected: (bool selected) {
                  setState(() {
                    _value6 = selected ? 0 : null;
                  });
                },
              ),
              FilterChip(
                pressElevation: 0.0,
                selectedColor: Colors.deepPurpleAccent,
                backgroundColor: Colors.grey[100],
                label: Text("Band",style: textStyle,),
                selected: _value7 == 0,
                onSelected: (bool selected) {
                  setState(() {
                    _value7 = selected ? 0 : null;
                  });
                },
              ),
            ],),
          SizedBox(height: 10.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              FilterChip(
                pressElevation: 0.0,
                selectedColor: Colors.cyanAccent,
                backgroundColor: Colors.grey[100],
                label: Text("Piano",style: textStyle,),
                selected: _value8 == 0,
                onSelected: (bool selected) {
                  setState(() {
                    _value8 = selected ? 0 : null;
                  });
                },
              ),
              FilterChip(
                pressElevation: 0.0,
                selectedColor: Colors.redAccent,
                backgroundColor: Colors.grey[100],
                label: Text("Acting",style: textStyle,),
                selected: _value9 == 0,
                onSelected: (bool selected) {
                  setState(() {
                    _value9 = selected ? 0 : null;
                  });
                },
              ),
            ],),
          SizedBox(height: 10.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              FilterChip(
                pressElevation: 0.0,
                selectedColor: Colors.lightGreenAccent,
                backgroundColor: Colors.grey[100],
                label: Text("Dance",style: textStyle,),
                selected: _value10 == 0,
                onSelected: (bool selected) {
                  setState(() {
                    _value10 = selected ? 0 : null;
                  });
                },
              ),
              FilterChip(
                pressElevation: 0.0,
                selectedColor: Colors.grey,
                backgroundColor: Colors.grey[100],
                label: Text("Crafting",style: textStyle,),
                selected: _value11 == 0,
                onSelected: (bool selected) {
                  setState(() {
                    _value11 = selected ? 0 : null;
                  });
                },
              ),
            ],),
          SizedBox(height: 10.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              FilterChip(
                pressElevation: 0.0,
                selectedColor: Colors.deepOrange,
                backgroundColor: Colors.grey[100],
                label: Text("Others..",style: textStyle,),
                selected: _value12 == 0,
                onSelected: (bool selected) {
                  setState(() {
                    _value12 = selected ? 0 : null;
                  });
                },
              ),
              Divider(height: 20.0,
                  color: Colors.white),
              RaisedButton(child: Text("Next"),
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => Talents()));
                  },
                  padding: EdgeInsets.all(10),

                  elevation:10 ,),
            ],),
        ],),
    );
  }
}
