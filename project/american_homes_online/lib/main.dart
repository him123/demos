import 'package:american_homes_online/constants/constants.dart';
import 'package:american_homes_online/screens/agent_finder_screen.dart';
import 'package:american_homes_online/screens/agentlist_screen.dart';
import 'package:american_homes_online/screens/dashboard_screen.dart';
import 'package:american_homes_online/screens/favorite_screen.dart';
import 'package:american_homes_online/screens/forget_password_screen.dart';
import 'package:american_homes_online/screens/login_screen.dart';
import 'package:american_homes_online/screens/mapsearch_screen.dart';
import 'package:american_homes_online/screens/register_screen.dart';
import 'package:american_homes_online/screens/saved_search_screen.dart';
import 'package:american_homes_online/screens/search_screen.dart';
import 'package:american_homes_online/screens/validate_screen.dart';
import 'package:american_homes_online/widget/custom_radio_buttons.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());


//void main() {
//  runApp(new MaterialApp(
//    home: new CustomRadio(),
//  ));
//}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        accentColor: kAccentColor,
        canvasColor: Colors.white,
//        fontFamily: 'Raleway',
//        textTheme: ThemeData.light().textTheme.copyWith(
//            body1: TextStyle(
//              color: Color.fromRGBO(20, 51, 51, 1),
//            ),
//            body2: TextStyle(
//              color: Color.fromRGBO(20, 51, 51, 1),
//            ),
//            title: TextStyle(
//              fontSize: 20,
//              fontFamily: 'RobotoCondensed',
//              fontWeight: FontWeight.bold,
//            )),
      ),
      debugShowCheckedModeBanner: false,
      // initialRoute: LoginScreen.id,
      home: LoginScreen(),
      routes: {
        LoginScreen.id: (context) => LoginScreen(),
        RegisterScreen.id: (context) => RegisterScreen(),
        ForgetPasswordScreen.id: (context) => ForgetPasswordScreen(),
        ValidateScreen.id: (context) => ValidateScreen(),
        DashBoardScreen.id: (context) => DashBoardScreen(),
        MapSearchScreen.id: (context) => MapSearchScreen(),
        MyFavorite.id: (context) => MyFavorite(),
        SavedSearch.id: (context) => SavedSearch(),
        AgentFinderScreen.id: (context) => AgentFinderScreen(),
        SearchScreen.id: (context) => SearchScreen(),
        AgentListScreen.id: (context) => AgentListScreen(),

      },
    );
  }
}