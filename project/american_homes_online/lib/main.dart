import 'package:american_homes_online/constants/constants.dart';
import 'package:american_homes_online/screens/agent_finder_screen.dart';
import 'package:american_homes_online/screens/agentlist_screen.dart';
import 'package:american_homes_online/screens/dashboard_screen.dart';
import 'package:american_homes_online/screens/favorite_screen.dart';
import 'package:american_homes_online/screens/forget_password_screen.dart';
import 'package:american_homes_online/screens/login_screen.dart';
import 'package:american_homes_online/screens/mapsearch_screen.dart';
import 'package:american_homes_online/screens/property_details_screen.dart';
import 'package:american_homes_online/screens/register_screen.dart';
import 'package:american_homes_online/screens/saved_search_screen.dart';
import 'package:american_homes_online/screens/search_screen.dart';
import 'package:american_homes_online/screens/validate_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

//void main() => runApp(MyApp());
//
//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return new MaterialApp(
//      debugShowCheckedModeBanner: false,
//      title: 'Flutter Code Snippets',
//      theme: new ThemeData(primarySwatch: Colors.red),
//      home: new GetCurrentLocation(),
//    );
//  }
//}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();

  String login = prefs.getString('login');
  String name = prefs.getString('name');
  String userType = prefs.getString('usertype');
  String email = prefs.getString('email');
  String id = prefs.getString('id');

  print('mail usertype: $userType');

  Widget _defaultHome;



  if (login == '1') {
    _defaultHome = new DashBoardScreen(userType: userType,);
  } else {
    _defaultHome = new LoginScreen();
  }

  runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: kPrimaryColor,
      accentColor: kAccentColor,
      canvasColor: Colors.white,
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            body1: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            body2: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            title: TextStyle(
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
            )),
    ),
    debugShowCheckedModeBanner: false,
    // initialRoute: LoginScreen.id,
    home: _defaultHome,
    routes: {
      LoginScreen.id: (context) => LoginScreen(),
      RegisterScreen.id: (context) => RegisterScreen(),
      ForgetPasswordScreen.id: (context) => ForgetPasswordScreen(),
      ValidateScreen.id: (context) => ValidateScreen(),
      DashBoardScreen.id: (context) => DashBoardScreen(userType: userType,),
      MapSearchScreen.id: (context) => MapSearchScreen(url: 'https://americanhomesonline.com/wp-json/api/v1/All_Property/?secret_key=yQTTspWXd530xNAEnBKkMFNFuBbKG6kd&bedrooms=&min_price=&max_price=&bathrooms=&home_type=&community=&zip=&listing_type=&building=&features=&size=&pet_allowed=&utility&floor_type=',filters: 0,),
      MyFavorite.id: (context) => MyFavorite(userId: id,),
      SavedSearch.id: (context) => SavedSearch(),
      AgentFinderScreen.id: (context) => AgentFinderScreen(),
      SearchScreen.id: (context) => SearchScreen(),
      AgentListScreen.id: (context) => AgentListScreen(),
      PropertyDetailsScreen.id: (context) => PropertyDetailsScreen(),
    },
  ));
}
