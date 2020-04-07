import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import './drawer_pages/profile.dart';
import './drawer_pages/world.dart';
import './drawer_pages/talents.dart';




class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool darkTheme = false;
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
    return MaterialApp(
       theme: darkTheme ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(



        drawer: Drawer(

            child: Column(
                children: <Widget>[

                  new UserAccountsDrawerHeader(accountName: new Text("SETTINGS"), accountEmail: new Text("Personalised settings")), //upper bar


                  ListTile(
                    title: Text("Dark Theme"),                                        //dark theme switch
                    trailing: Switch(
                      value: darkTheme,
                      onChanged: (changed) {
                        setState(() {
                          darkTheme = changed;
                        });
                      },
                    ),
                  )              ]
            )
        ),

        body: SizedBox.expand(
          child: PageView(

            controller: _pageController,
            onPageChanged: (index) {
              setState(() => _currentIndex = index);
            },
            children: <Widget>[
              World(),
              Talents(),
              Profile(),
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
                title: Text('World'),
                icon: Icon(Icons.home)
            ),
            BottomNavyBarItem(
                title: Text('Talents'),
                icon: Icon(Icons.add_to_photos)
            ),
            BottomNavyBarItem(
                title: Text('User Profile'),
                icon: Icon(Icons.assignment_ind)
            ),

          ],
        ),
      ),
    );
  }
}


