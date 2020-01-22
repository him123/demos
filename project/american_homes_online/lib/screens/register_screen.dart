import 'dart:io';

import 'package:american_homes_online/components/rounded_buttons.dart';
import 'package:american_homes_online/constants/constants.dart';
import 'package:american_homes_online/screens/dashboard_screen.dart';
import 'package:american_homes_online/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class RegisterScreen extends StatefulWidget {
  static String id = 'RegisterScreen';

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool showSpinner = false;

//  Future<File> imageFile;
  String username, email, mobile, pass, userType;
  File _imageFile;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;

  TextEditingController nameCntrlr = TextEditingController();
  TextEditingController emailCntrlr = TextEditingController();
  TextEditingController addressCntrlr = TextEditingController();
  TextEditingController phoneCntrlr = TextEditingController();
  TextEditingController passwordCntrlr = TextEditingController();
  List<String> spinnerItems = [
    'User',
    'Single Agent',
    'Agency',
    'Developer',
  ];

  String dropdownValue = 'User';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Register'),
      ),
      backgroundColor: Color(0xFFF7F7F7),
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            autovalidate: _autoValidate,
            child: ListView(
              children: <Widget>[
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter Username';
                    }
                    return null;
                  },
                  controller: nameCntrlr,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    //Do something with the user input.
                    username = value;
                  },
                  decoration:
                      kInputBoxDecoration.copyWith(hintText: 'Enter Username'),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextFormField(
                  validator: validateEmail,
                  controller: emailCntrlr,
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
                      return 'Please enter mobile number';
                    }
                    return null;
                  },
                  controller: addressCntrlr,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    //Do something with the user input.
                    mobile = value;
                  },
                  decoration: kInputBoxDecoration.copyWith(
                      hintText: 'Enter mobile number'),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Container(
                  alignment: Alignment.center,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1.0, style: BorderStyle.solid),
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                  ),
                  child: DropdownButton<String>(
                    value: dropdownValue,
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(color: Colors.red, fontSize: 20, inherit: false, decorationColor: Colors.white),
//                  underline: Container(
//                    height: 2,
//                    color: Colors.deepPurpleAccent,
//                  ),

                    onChanged: (String data) {
                      setState(() {
                        dropdownValue = data;
                        userType = dropdownValue;
                      });
                    },
                    items: spinnerItems
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
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
                  controller: passwordCntrlr,
                  textAlign: TextAlign.center,
                  obscureText: true,
                  onChanged: (value) {
                    //Do something with the user input.
                    pass = value;
                  },
                  decoration:
                      kInputBoxDecoration.copyWith(hintText: 'Enter Password'),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Center(
                  child: RoundedButtons(
                    color: kPrimaryColor,
                    btnName: 'Sign Up',
                    onPress: () {
                      if (_formKey.currentState.validate()) {
                        setState(() {
                          showSpinner = true;
                        });
                        String userTypeNo='0';
                        if(userType=='User'){
                          userTypeNo= '1';
                        }else if(userType=='Single Agent'){
                          userTypeNo= '2';
                        }else if(userType=='Agency'){
                          userTypeNo= '3';
                        }else{
                          userTypeNo= '4';
                        }

                        register(userTypeNo, email, username, pass, mobile);
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Already have an Account?',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 15.0),
                      ),
                      FlatButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  fullscreenDialog: true,
                                  builder: (BuildContext context) =>
                                      LoginScreen()));
                        },
                        child: Text(
                          'Login here',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: kAccentColor,
                              fontSize: 17.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<String> register(
    String userType,
    String email,
    String userName,
    String password,
    String mobile,
  ) async {
    print('========= getData called ===========');
    var response = await http.get(
        'https://americanhomesonline.com/wp-json/api/v1/Register/?secret_key=yQTTspWXd530xNAEnBKkMFNFuBbKG6kd&new_user_type=$userType&email=$email&user_name=$userName&password=$password&mobile=$mobile');

    print(response.body);

    if (response.statusCode == 200) {
      dynamic data = json.decode(response.body)['data'];
      if (data['api_status'] == 0) {
        print('fail');
        showAlert(context, data['message']);
      } else {
        print('success');

        String id = data['user_id'].toString();
        String nameUser = data['name'];
        String tookEmail = data['email'];
        String userType = data['user_type'];

        SharedPreferences prefs = await SharedPreferences.getInstance();

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

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
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
}
