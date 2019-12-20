import 'package:american_homes_online/constants/constants.dart';
import 'package:american_homes_online/screens/agent_finder_screen.dart';
import 'package:american_homes_online/screens/calculator_screen.dart';
import 'package:american_homes_online/screens/favorite_screen.dart';
import 'package:american_homes_online/screens/mapsearch_screen.dart';
import 'package:american_homes_online/screens/saved_search_screen.dart';
import 'package:american_homes_online/screens/search_screen.dart';
import 'package:american_homes_online/widget/main_drawer.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class DashBoardScreen extends StatefulWidget {
  static String id = 'DashBoardScreen';

  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        drawer: MainDrawer(
          name: 'Steave',
          address: 'adress',
          phone: '454564654',
          email: 'steave@gmail.com',
          id: '1',
          image: '',
        ),
        body: Column(
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
                                                AgentFinderScreen()));
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
                                                Calculator()));
                                  },
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Image.asset(
                                        'images/cal.png',
                                        height: 60.0,
                                        color: kDashboarIconsColor,
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
            Padding(
              padding: EdgeInsets.only(left:10.0,right: 10.0,top: 10.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xFFd3dce8),
                    borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(20.0),
                        topRight: const Radius.circular(20.0))),

                child: Column(children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Your Current package',
                      style:
                      TextStyle(fontSize: 18.0, fontFamily: 'Raleway',
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
                  SizedBox(height: 15.0,),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                                '1',
                                style:
                                kMemberShipTextStyle.copyWith(fontWeight: FontWeight.bold)
                            ),
                            SizedBox(width: 10.0,),
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
                              style:
                              kMemberShipTextStyle.copyWith(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 10.0,),
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
                            Text(
                                '1',
                                style:kMemberShipTextStyle.copyWith(fontWeight: FontWeight.bold)
                            ),
                            SizedBox(width: 10.0,),
                            Text(
                              'Featured Included',
                              style: kMemberShipTextStyle,
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                                '1',
                                style:kMemberShipTextStyle.copyWith(fontWeight: FontWeight.bold)
                            ),
                            SizedBox(width: 10.0,),
                            Text(
                                'Featured Remaining',
                                style:kMemberShipTextStyle
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
                            Text(
                              '10',
                              style:kMemberShipTextStyle.copyWith(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 10.0,),
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
                              style:
                              kMemberShipTextStyle.copyWith(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 10.0,),
                            Text(
                              '10 Fab 2020',
                              style: kMemberShipTextStyle,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],),
              ),
            ),
          ],
        ),
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
