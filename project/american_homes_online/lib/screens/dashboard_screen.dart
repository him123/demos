import 'package:american_homes_online/constants/constants.dart';
import 'package:american_homes_online/screens/agent_finder_screen.dart';
import 'package:american_homes_online/screens/calculator_screen.dart';
import 'package:american_homes_online/screens/favorite_screen.dart';
import 'package:american_homes_online/screens/home_screen.dart';
import 'package:american_homes_online/screens/mapsearch_screen.dart';
import 'package:american_homes_online/screens/more_screen.dart';
import 'package:american_homes_online/screens/saved_search_screen.dart';
import 'package:american_homes_online/screens/search_screen.dart';
import 'package:american_homes_online/widget/main_drawer.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashBoardScreen extends StatefulWidget {
  final String userType;
  static String id = 'DashBoardScreen';

  DashBoardScreen({this.userType});

  @override
  _DashBoardScreenState createState() =>
      _DashBoardScreenState(userType: userType);
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  final String userType;

  _DashBoardScreenState({this.userType});

  int _selectedPageIndex = 0;

  String name;
  String userId;
  String email;

//  String userType;
  String title = 'Home';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print('dashboard usertype $userType');

    getDataFromPref();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
      if (_selectedPageIndex == 0) {
        title = 'Home';
      } else if (_selectedPageIndex == 1) {
        title = 'Agent Finder';
      } else if (_selectedPageIndex == 2) {
        title = 'Calculator';
      } else {
        title = 'More';
      }
    });
  }

  void getDataFromPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      name = prefs.get('name');
      userId = prefs.get('id');
      email = prefs.get('email');
//      userType = prefs.get('usertype');
    });
  }

  Widget getScreen(int index) {
    if (index == 0) {
      return HomeScreen(userType: userType,);
    } else if (index == 1) {
      return AgentFinderScreen(
        showAppBar: false,
      );
    } else if (index == 2) {
      return Calculator(
        showAppBar: false,
      );
    } else {
      return MoreScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        drawer: MainDrawer(
          name: name,
          address: 'adress',
          phone: '454564654',
          email: email,
          id: userId,
          image: '',
          userType: userType,
        ),
        body: getScreen(_selectedPageIndex),
        bottomNavigationBar: BottomNavigationBar(
          iconSize: 30.0,
          onTap: _selectPage,
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.white70,
          currentIndex: _selectedPageIndex,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.home),
              title: Text('Home', style: kDashTabTextStyle),
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.perm_identity),
              title: Text('Agent', style: kDashTabTextStyle),
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.keyboard),
              title: Text(
                'Calculator',
                style: kDashTabTextStyle,
              ),
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.storage),
              title: Text('More', style: kDashTabTextStyle),
            ),
          ],
        ),
      ),
    );
  }
}
