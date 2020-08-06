//import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import './drawer_pages/profile.dart';
import './drawer_pages/world.dart';
import './drawer_pages/chat.dart';
import './drawer_pages/search.dart';
import 'drawer_pages/categories.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

// new nav bar....//

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool darkTheme = false;
  // int _currentIndex = 0;
  PageController _pageController;
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  // int _page = 0;
  // GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: darkTheme ? ThemeData.dark() : ThemeData.light(),
      child: Scaffold(
        drawer: Drawer(
            child: Column(children: <Widget>[
          new UserAccountsDrawerHeader(
              accountName: new Text("SETTINGS"),
              accountEmail: new Text("Personalised settings")), //upper bar

          ListTile(
            title: Text("Dark Theme"), //dark theme switch
            trailing: Switch(
              value: darkTheme,
              onChanged: (changed) {
                setState(() {
                  darkTheme = changed;
                });
              },
            ),
          )
        ])),
        body: SizedBox.expand(
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              // setState(() => _currentIndex = index);
            },
            children: <Widget>[
              World(),
              Search(),
              Categories(),
              Chat(),
              Profile(),
            ],
          ),
        ),
        bottomNavigationBar: CurvedNavigationBar(
          // key: _bottomNavigationKey,
          index: 0,
          height: 50,
          items: <Widget>[
            Icon(Icons.home, size: 30),
            Icon(Icons.search, size: 30),
            Icon(Icons.add_a_photo, size: 30),
            Icon(Icons.message, size: 30),
            Icon(Icons.perm_identity, size: 30),
          ],
          color: Colors.white,
          buttonBackgroundColor: Colors.white,
          backgroundColor: Colors.blueAccent,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 300),

          onTap: (index) {
            //setState(() => _currentIndex = index);
            _pageController.jumpToPage(index);
          },
        ),
      ),
    );
  }
}

// old nav bar......//

//  class MyHomePage extends StatefulWidget {
//    @override
//    _MyHomePageState createState() => _MyHomePageState();
//  }
//
//  class _MyHomePageState extends State<MyHomePage> {
//    bool darkTheme = false;
//    int _currentIndex = 0;
//    PageController _pageController;
//    ScrollController _scrollController;
//
//    @override
//    void initState() {
//      super.initState();
//      _pageController = PageController();
//      _scrollController = ScrollController();
//    }
//
//    @override
//    void dispose() {
//      _pageController.dispose();
//      _scrollController.dispose();
//      super.dispose();
//    }
//
//    @override
//    Widget build(BuildContext context) {
//      return Theme(
//        data: darkTheme ? ThemeData.dark() : ThemeData.light(),
//        child: Scaffold(
//          drawer: Drawer(
//              child: Column(children: <Widget>[
//            new UserAccountsDrawerHeader(
//                accountName: new Text("SETTINGS"),
//                accountEmail: new Text("Personalised settings")), //upper bar
//
//            ListTile(
//              title: Text("Dark Theme"), //dark theme switch
//              trailing: Switch(
//                value: darkTheme,
//                onChanged: (changed) {
//                  setState(() {
//                    darkTheme = changed;
//                  });
//                },
//              ),
//            )
//          ])),
//          body: SizedBox.expand(
//            child: PageView(
//              controller: _pageController,
//              onPageChanged: (index) {
//                setState(() => _currentIndex = index);
//              },
//              children: <Widget>[
//                World(),
//                Search(),
//                Categories(),
//                Chat(),
//                Profile(),
//              ],
//            ),
//          ),
//          bottomNavigationBar: BottomNavyBar(
//            selectedIndex: _currentIndex,
//            onItemSelected: (index) {
//              setState(() => _currentIndex = index);
//              _pageController.jumpToPage(index);
//            },
//            items: <BottomNavyBarItem>[
//              BottomNavyBarItem(title: Text('Home'), icon: Icon(Icons.home)),
//              BottomNavyBarItem(title: Text('Search'), icon: Icon(Icons.search)),
//              BottomNavyBarItem(title: Text('Uploads'), icon: Icon(Icons.add_to_photos)),
//              BottomNavyBarItem(title: Text('Chat'), icon: Icon(Icons.chat)),
//              BottomNavyBarItem(title: Text('Profile'), icon: Icon(Icons.assignment_ind)),
//
//            ],
//          ),
//        ),
//      );
//    }
//  }
