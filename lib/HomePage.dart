import 'package:flutter/material.dart';
import './drawer_pages/profile.dart';
import './drawer_pages/world.dart';
import './drawer_pages/chat.dart';
import './drawer_pages/search.dart';
import 'drawer_pages/categories.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

// new nav bar....//

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key : key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool darkTheme = false;
  int _selected = 0;
  PageController _pageController;



  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
   // _scrollController.dispose();
    super.dispose();
  }

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
              setState(() {
                _selected = index;
              });
            },
            children: <Widget>[
              World(),
              Search(),
              Categories(),
              Chat(),
              Profile(),
            ],
          ),
        ), //body closed
        bottomNavigationBar: CurvedNavigationBar(
          index: _selected,
          height: 45,
          items: <Widget>[
            Icon(Icons.home, size: 30, color: Colors.blue,),
            Icon(Icons.search, size: 30, color: Colors.blue,),
            Icon(Icons.add_a_photo, size: 30, color: Colors.blue,),
            Icon(Icons.message, size: 30, color: Colors.blue,),
            Icon(Icons.perm_identity, size: 30, color: Colors.blue,),
          ],
          color: Colors.cyanAccent,
          buttonBackgroundColor: Colors.cyanAccent,
          backgroundColor: Colors.blueGrey[100] ,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 300),

          onTap: (index) {
            //setState(() => _pageController = _pageController);
            _pageController.jumpToPage(index);
          },

        ),
      ),
    );
  }
}

