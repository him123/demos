import 'package:american_homes_online/screens/add_new_property.dart';
import 'package:american_homes_online/screens/dashboard_screen.dart';
import 'package:american_homes_online/screens/home_screen.dart';
import 'package:american_homes_online/screens/image_upload_demo.dart';
import 'package:american_homes_online/screens/login_screen.dart';
import 'package:american_homes_online/screens/mapsearch_screen.dart';
import 'package:american_homes_online/screens/my_profile_agency_screen.dart';
import 'package:american_homes_online/screens/my_profile_agent_screen.dart';
import 'package:american_homes_online/screens/my_profile_developer_screen.dart';
import 'package:american_homes_online/screens/my_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainDrawer extends StatelessWidget {
  final String name;
  final String image;
  final String email;
  final String phone;
  final String address;
  final String id;
  final String userType;

  MainDrawer(
      {this.name,
      this.phone,
      this.email,
      this.address,
      this.image,
      this.id,
      this.userType});

  Widget buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 24,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }

  Widget returnMyProfileWidget(String userType) {
    if (userType == '1') {
      print('go to User screen');
      return MyProfileScreen(
        userId: id,
        userType: userType,
      );
    } else if (userType == '2') {
      print('go to Agent screen');
      return MyProfileAgentScreen(
        userId: id,
        userType: userType,
      );
    } else if (userType == '3') {
      print('go to Agency screen');
      return MyProfileAgencyScreen(
        userId: id,
        userType: userType,
      );
    } else {
      print('go to Developer screen');
      return MyProfileDeveloperScreen(
        userId: id,
        userType: userType,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
//    getNameAndImage();

    return Drawer(
      child: ListView(
        children: <Widget>[
          new UserAccountsDrawerHeader(
            accountName: new Text(
              name == null ? '' : name,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 17.0),
            ),
            accountEmail: new Text(email == null ? '' : email,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.0)),
            decoration: new BoxDecoration(
              color: Theme.of(context).primaryColor,
//              image: new DecorationImage(
//                image: new ExactAssetImage('images/logo.jpg'),
//                fit: BoxFit.cover,
//              ),
            ),
            currentAccountPicture: ClipOval(
              child: Image.asset(
                'images/default_user.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          buildListTile('HOME', Icons.home, () {
            Navigator.of(context).pop();

            Navigator.of(context).push(
              PageRouteBuilder(pageBuilder: (BuildContext context, _, __) {
                return DashBoardScreen(userType: userType,);
              }, transitionsBuilder:
                  (_, Animation<double> animation, __, Widget child) {
                return new FadeTransition(opacity: animation, child: child);
              }),
            );
          }),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Divider(
              color: Colors.black,
              height: 1.0,
            ),
          ),
          buildListTile('MY PROFILE', FontAwesomeIcons.cog, () {
//            Navigator.of(context).pushReplacementNamed(Account.id);
            Navigator.of(context).pop();

            Navigator.of(context).push(
              PageRouteBuilder(pageBuilder: (BuildContext context, _, __) {
                return returnMyProfileWidget(userType);
              }, transitionsBuilder:
                  (_, Animation<double> animation, __, Widget child) {
                return new FadeTransition(opacity: animation, child: child);
              }),
            );
          }),

          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Divider(
              color: Colors.black,
              height: 1.0,
            ),
          ),

          buildListTile('MY PROPERIES LIST', FontAwesomeIcons.mapMarkerAlt, () {
//            Navigator.of(context).pushReplacementNamed(AboutUs.id);



            Navigator.of(context).pop();

            Navigator.push(
                context,
                PageRouteBuilder(
                    transitionDuration:
                    Duration(seconds: 1),
                    pageBuilder: (_, __, ___) =>
                        MapSearchScreen(url: 'https://americanhomesonline.com/wp-json/api/v1/Agent_Property/?secret_key=yQTTspWXd530xNAEnBKkMFNFuBbKG6kd&agent_id=$id',filters: 1,)));
          }),

          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Divider(
              color: Colors.black,
              height: 1.0,
            ),
          ),
          buildListTile('INBOX', FontAwesomeIcons.envelope, () {
//            Navigator.of(context).pushReplacementNamed(OrdersScreen.id);
            Navigator.of(context).pop();
//            Navigator.of(context).push(
//              PageRouteBuilder(pageBuilder: (BuildContext context, _, __) {
//                return OrdersScreen(
//                  custId: id,
//                );
//              }, transitionsBuilder:
//                  (_, Animation<double> animation, __, Widget child) {
//                return new FadeTransition(opacity: animation, child: child);
//              }),
//            );
          }),

          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Divider(
              color: Colors.black,
              height: 1.0,
            ),
          ),

          userType == '1' ? Text(''): buildListTile('ADD NEW PROPERTY', FontAwesomeIcons.plus, () {
//            Navigator.of(context).pushReplacementNamed(ContactUs.id);
            Navigator.of(context).pop();
            Navigator.of(context).push(
              PageRouteBuilder(pageBuilder: (BuildContext context, _, __) {
                return AddPropertyScreen(userId: id,);
              }, transitionsBuilder:
                  (_, Animation<double> animation, __, Widget child) {
                return new FadeTransition(opacity: animation, child: child);
              }),
            );
          }),

//          Padding(
//            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
//            child: Divider(
//              color: Colors.black,
//              height: 1.0,
//            ),
//          ),
//          buildListTile('LOGOUT', FontAwesomeIcons.powerOff, () {
////            Navigator.of(context).pushReplacementNamed(OrdersScreen.id);
//            Navigator.of(context).pop();
//
//
//            Alert(
//              context: context,
////      type: AlertType.info,
//              title: 'Want to Logout?',
////      desc: msg,
//              buttons: [
//                DialogButton(
//                  child: Text(
//                    "Yes",
//                    style: TextStyle(color: Colors.white, fontSize: 20),
//                  ),
//                  onPressed: () async {
//                    SharedPreferences prefs = await SharedPreferences.getInstance();
//
//                    prefs.setString('login', '0');
//
//                    Navigator.of(context)
//                        .pushNamedAndRemoveUntil(LoginScreen.id, (Route<dynamic> route) => false);
//                  },
//                  width: 120,
//                ),
//                DialogButton(
//                  child: Text(
//                    "No",
//                    style: TextStyle(color: Colors.white, fontSize: 20),
//                  ),
//                  onPressed: () => Navigator.pop(context),
//                  width: 120,
//                )
//              ],
//            ).show();
////            Navigator.of(context).push(
////              PageRouteBuilder(pageBuilder: (BuildContext context, _, __) {
////                return OrdersScreen(
////                  custId: id,
////                );
////              }, transitionsBuilder:
////                  (_, Animation<double> animation, __, Widget child) {
////                return new FadeTransition(opacity: animation, child: child);
////              }),
////            );
//          }
//          ),
        ],
      ),
    );
  }
}
