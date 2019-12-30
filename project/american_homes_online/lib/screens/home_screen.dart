import 'package:american_homes_online/constants/constants.dart';
import 'package:american_homes_online/screens/agent_finder_screen.dart';
import 'package:american_homes_online/screens/calculator_screen.dart';
import 'package:american_homes_online/screens/favorite_screen.dart';
import 'package:american_homes_online/screens/saved_search_screen.dart';
import 'package:american_homes_online/screens/search_screen.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'mapsearch_screen.dart';

class HomeScreen extends StatefulWidget {
  final String userType;

  HomeScreen({this.userType});

  @override
  _HomeScreenState createState() => _HomeScreenState(userType: userType);
}

class _HomeScreenState extends State<HomeScreen> {

  final String userType;

  _HomeScreenState({this.userType});

  String name;
  String userId;
  String email;
//  String userType;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getDataFromPref();
    print('usertype come in HOME: $userType');

  }

  void getDataFromPref() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      name = prefs.get('name');
      userId = prefs.get('id');
      email = prefs.get('email');
//      userType = prefs.get('usertype');
    });

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 20.0,
              ),
              Hero(
                tag: 'logo',
                child: Image.asset(
                  'images/banner.jpg',
                  height: 70.0,
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              /*GRIDVIEW*/ Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: RadialGradient(colors: [
                      Colors.black26,
                      Colors.white10,
                    ], radius: 0.85, focal: Alignment.center),
                  ),
                  child: GridView(
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 2,
                      crossAxisCount: 3,
                    ),
                    children: <Widget>[
                      /*MAP SEARCH*/ Container(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Material(
                            color: Colors.white,
                            child: InkWell(
                              onTap: () {
//                                    Navigator.push(
//                                      context,
//                                      MaterialPageRoute(builder: (context) => MapSearchScreen()),
//                                    );

                                Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                        transitionDuration:
                                        Duration(seconds: 1),
                                        pageBuilder: (_, __, ___) =>
                                            MapSearchScreen()));
                              },
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Hero(
                                    tag: 'map-img',
                                    child: Image.asset(
                                      'images/mappin.png',
                                      height: 60.0,
                                      color: kDashboarIconsColor,
                                    ),
                                  ),
                                  Hero(
                                    tag: 'map',
                                    child: Text(
                                      'Map Search',
                                      style: kDashBordIconText,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      /*SEARCH*/ Container(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Material(
                            color: Colors.white,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                        transitionDuration:
                                        Duration(seconds: 1),
                                        pageBuilder: (_, __, ___) =>
                                            SearchScreen()));
                              },
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Hero(
                                    tag: 'search',
                                    child: Image.asset(
                                      'images/search.png',
                                      height: 60.0,
                                      color: kDashboarIconsColor,
                                    ),
                                  ),
                                  Text(
                                    'Search',
                                    style: kDashBordIconText,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      /*RECENT SEARCH*/ Container(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Material(
                            color: Colors.white,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                        transitionDuration:
                                        Duration(seconds: 1),
                                        pageBuilder: (_, __, ___) =>
                                            SavedSearch()));
                              },
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Hero(
                                    tag: 'saved',
                                    child: Image.asset(
                                      'images/recent_search.png',
                                      height: 50.0,
                                      color: kDashboarIconsColor,
                                    ),
                                  ),
                                  Text(
                                    'Saved Search',
                                    style: kDashBordIconText,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      /*FAVORITE*/ Container(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Material(
                            color: Colors.white,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                        transitionDuration:
                                        Duration(seconds: 1),
                                        pageBuilder: (_, __, ___) =>
                                            MyFavorite()));
                              },
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Hero(
                                    tag: 'fav',
                                    child: Image.asset(
                                      'images/favorite.png',
                                      height: 60.0,
                                      color: kDashboarIconsColor,
                                    ),
                                  ),
                                  Text(
                                    'Favorite',
                                    style: kDashBordIconText,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      /*MY AGENT*/ Container(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Material(
                            color: Colors.white,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                        transitionDuration:
                                        Duration(seconds: 1),
                                        pageBuilder: (_, __, ___) =>
                                            AgentFinderScreen(showAppBar: true,)));
                              },
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Hero(
                                    tag: 'agent',
                                    child: Image.asset(
                                      'images/agent.png',
                                      height: 60.0,
                                      color: kDashboarIconsColor,
                                    ),
                                  ),
                                  AutoSizeText(
                                    'Agent Finder',
                                    style: kDashBordIconText,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      /*CALCULATOR*/ Container(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Material(
                            color: Colors.white,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                        transitionDuration:
                                        Duration(seconds: 1),
                                        pageBuilder: (_, __, ___) =>
                                            Calculator(showAppBar: true,)));
                              },
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Hero(
                                    tag: 'cal',
                                    child: Image.asset(
                                      'images/cal.png',
                                      height: 60.0,
                                      color: kDashboarIconsColor,
                                    ),
                                  ),
                                  Column(
                                    children: <Widget>[
                                      Text('Calclulator',
                                          style: kDashBordIconText),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        userType=='1' ? Text('') :Padding(
          padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
          child: Container(
            decoration: BoxDecoration(
                color: Color(0xFFd3dce8),
                borderRadius: new BorderRadius.only(
                    topLeft: const Radius.circular(20.0),
                    topRight: const Radius.circular(20.0))),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Your Current package',
                    style: TextStyle(
                        fontSize: 18.0,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w900,
                        color: Theme.of(context).primaryColor),
                  ),
                ),
                Text(
                  'Free  Membership',
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Theme.of(context).accentColor,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Raleway',
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text('1',
                              style: kMemberShipTextStyle.copyWith(
                                  fontWeight: FontWeight.bold)),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            'Listings Included',
                            style: kMemberShipTextStyle,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '1',
                            style: kMemberShipTextStyle.copyWith(
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            'Listings Remaining',
                            style: kMemberShipTextStyle,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text('1',
                              style: kMemberShipTextStyle.copyWith(
                                  fontWeight: FontWeight.bold)),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            'Featured Included',
                            style: kMemberShipTextStyle,
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text('1',
                              style: kMemberShipTextStyle.copyWith(
                                  fontWeight: FontWeight.bold)),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text('Featured Remaining',
                              style: kMemberShipTextStyle),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            '10',
                            style: kMemberShipTextStyle.copyWith(
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            'Images / listing',
                            style: kMemberShipTextStyle,
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            'Ends On: -',
                            style: kMemberShipTextStyle.copyWith(
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            '10 Fab 2020',
                            style: kMemberShipTextStyle,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
