import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';

import 'drawer pages/profile.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _currentIndex = 0;
  PageController _pageController;
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _scrollController=ScrollController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Talent Hunt"),
        centerTitle: true,
      ),


      drawer: Drawer(

          child: Column(
              children: <Widget>[

                new UserAccountsDrawerHeader(accountName: new Text("User"), accountEmail: new Text("User mail")), //upper bar

                new ListTile(
                    title: new Text ("Profile"),
                    trailing: new Icon (Icons.account_circle),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.push(context, new MaterialPageRoute(builder: (context) => Profile()));

                    }
                ),
              ]
          )
      ),

      body: SizedBox.expand(
        child: PageView(

          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            Scaffold(                                                 //first page of bottom navigation

              appBar: AppBar(
                title: Text('Home Page'),
                centerTitle: true,
                backgroundColor: Colors.lightGreen,

              ),
              body: ListView(
                controller: _scrollController,
                children: <Widget>[

                ],
              ),
            ),
            Container(color: Colors.red,),                 //second page of bottom navigation

            Container(color: Colors.green,),               //third page of bottom navigation

            Container(color: Colors.blue,),                //fourth page of bottom navigation
          ],
        ),
      ),

      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
              title: Text('Home'),
              icon: Icon(Icons.home)
          ),
          BottomNavyBarItem(
              title: Text('Talents'),
              icon: Icon(Icons.add_to_photos)
          ),
          BottomNavyBarItem(
              title: Text('Followers'),
              icon: Icon(Icons.assignment_ind)
          ),
          BottomNavyBarItem(
              title: Text('Setting'),
              icon: Icon(Icons.settings)
          ),
        ],
      ),
    );
  }
}


