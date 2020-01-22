import 'package:american_homes_online/constants/constants.dart';
import 'package:american_homes_online/screens/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ValidateScreen extends StatelessWidget {
  static String id = 'ValidateScreen';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(
                    height: 20.0,
                  ),
                  Hero(
                    tag: 'logo',
                    child: Image.asset(
                      'images/banner.jpg',
                      width: 350.0,
                    ),
                  ),
                  Text(
                    'Greetings!',
                    style: TextStyle(fontSize: 40.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                          'To access this app, please enter the code provided by your real estate agent.',
                          style: TextStyle(fontSize: 20.0), textAlign: TextAlign.center,),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextField(
                      decoration: kInputBoxDecoration,
                    ),
                  ),

                ],
              ),
            ),
            RaisedButton(
              elevation: 12.0,
              onPressed: () {
                Navigator.of(context).push(
                  PageRouteBuilder(
                      transitionDuration: Duration(seconds: 2),
                      pageBuilder: (BuildContext context, _, __) {
                        return DashBoardScreen();
                      }, transitionsBuilder:
                      (_, Animation<double> animation, __, Widget child) {
                    return new FadeTransition(
                        opacity: animation, child: child);
                  }),
                );
              },
              textColor: Colors.white,
              padding: const EdgeInsets.all(0.0),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: <Color>[
                      kPrimaryColor,
                      kPrimaryColor,
                    ],
                  ),
                ),
                padding: const EdgeInsets.only(
                    left: 100.0, right: 100.0, top: 10.0, bottom: 10.0),
                child: Text('Validate',
                    style:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 50.0),
              child: RaisedButton(
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(6.0),
                    side: BorderSide(color: Colors.white)),
                onPressed: () {
                  Alert(
                    context: context,
//      type: AlertType.info,
                    title: 'You have to have a code to accee the app. Please ask to your agent for code!',
                    buttons: [
                      DialogButton(
                        child: Text(
                          "Ok",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        onPressed: () => Navigator.pop(context),
                        width: 120,
                      )
                    ],
                  ).show();
                },
                color: Theme.of(context).accentColor,
                textColor: Colors.white,
                padding: const EdgeInsets.only(
                    left: 50.0, right: 50.0, top: 10.0, bottom: 10.0),
                child: Text("I don\'t have a code".toUpperCase(),
                    style: TextStyle(fontSize: 14)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
