import 'package:american_homes_online/components/rounded_buttons.dart';
import 'package:american_homes_online/constants/constants.dart';
import 'package:american_homes_online/screens/dashboard_screen.dart';
import 'package:american_homes_online/screens/forget_password_screen.dart';
import 'package:american_homes_online/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showSpinner = false;
  final _formKey = GlobalKey<FormState>();
  String email, pass;
  String _status = 'no-action';
  bool chk=true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFF7F7F7),
        body: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    child: Container(
                      height: 300.0,
                      child: Hero(
                          tag: 'logo',
                          child: Image.asset('images/aho_logo.jpg')),
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  TextFormField(
//                    validator: validateEmail,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      //Do something with the user input.
                      email = value;
                    },
                    decoration:
                        kInputBoxDecoration.copyWith(hintText: 'Enter Email'),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter password';
                      }
                      return null;
                    },
                    textAlign: TextAlign.center,
                    obscureText: true,
                    onChanged: (value) {
                      //Do something with the user input.
                      pass = value;
                    },
                    decoration: kInputBoxDecoration.copyWith(
                        hintText: 'Enter Password'),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: <Widget>[
                      Checkbox(
                        value: chk,
                        onChanged: (bool value){
                          setState(() {
                            chk = value;
                          });
                        },
                      ),
                      Container(width: 250.0,
                          child: Text('By clicking the checkbox you accept the Privacy Policy and Terms Of Use',style: TextStyle(color: Colors.red,),))
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: RoundedButtons(
                          color: kAccentColor,
                          btnName: 'Login',
                          onPress: () {
                            print('login button pressed --- ');
                            if (_formKey.currentState.validate()) {
                              // If the form is valid, display a Snackbar.
                              setState(() {
                                showSpinner = true;
                              });

                              if(chk==false){
                                showAlert(context, 'Please select privacy policy');
                                setState(() {
                                  showSpinner=false;
                                });
                              }else{
                                login(email, pass);
                              }

                            }
                          },
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: RoundedButtons(
                          color: kPrimaryColor,
                          btnName: 'Sign Up',
                          onPress: () {
                            Navigator.pushNamed(context, RegisterScreen.id);
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Center(
                    child: FlatButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                fullscreenDialog: true,
                                builder: (BuildContext context) =>
                                    ForgetPasswordScreen()));
                      },
                      child: Text(
                        'Forgot Password!',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: kAccentColor,
                            fontSize: 20.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }

  Future<String> login(String email, String password) async {

    print('========= getData called ===========');
    var response = await http.get(
        'https://americanhomesonline.com/wp-json/api/v1/Login/?secret_key=yQTTspWXd530xNAEnBKkMFNFuBbKG6kd&username=$email&password=$password');

    print(response.body);

    if (response.statusCode == 200) {
      dynamic data = json.decode(response.body)['data'];
      if (data['api_status'] == 0) {
        print('fail');
        showAlert(context, data['message']);
      } else {
        print('success');
        SharedPreferences prefs = await SharedPreferences.getInstance();

        String id = data['user_id'].toString();
        String nameUser = data['name'];
        String tookEmail = data['email'];
        String userType = data['user_type'];


        print('id: $id');
        print('username: $nameUser');
        print('email: $email');
        print('userType: $userType');

        prefs.setString('name', nameUser);
        prefs.setString('id', id);
        prefs.setString('email', tookEmail);
        prefs.setString('usertype', userType);
        prefs.setString('login', '1');

        Navigator.of(context).pop();
        Navigator.push(
            context,
            MaterialPageRoute(
                fullscreenDialog: true,
                builder: (BuildContext context) => DashBoardScreen()));
      }
    } else {
      setState(() {
        showSpinner = false;
      });
      throw Exception('Failed to load photos');
    }

    setState(() {
      showSpinner = false;
    });

    return "Success!";
  }

  void showAlert(BuildContext context, String msg) {
    Alert(
      context: context,
//      type: AlertType.info,
      title: msg,
//      desc: msg,
      buttons: [
        DialogButton(
          child: Text(
            "OK",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          width: 120,
        )
      ],
    ).show();
  }

//  Future<String> getLoginStatus() async {
////    SharedPreferences prefs = await SharedPreferences.getInstance();
//    return prefs.getString('login');
//  }
}
