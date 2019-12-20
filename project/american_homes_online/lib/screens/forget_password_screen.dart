import 'package:american_homes_online/components/rounded_buttons.dart';
import 'package:american_homes_online/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class ForgetPasswordScreen extends StatefulWidget {
  static String id = 'ForgetPasswordScreen';
  @override
  _ForgetPasswordScreenState createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {

  bool showSpinner = false;
  final _formKey = GlobalKey<FormState>();
  String email, pass;
  String _status = 'no-action';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('Forget Password'),),
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
                      height: 250.0,
                      child: Hero(
                          tag: 'logo',
                          child: Image.asset('images/aho_logo.jpg')),
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  TextFormField(
                    validator: validateEmail,
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

                  Row(
                    children: <Widget>[
                      Expanded(
                        child: RoundedButtons(
                          color: kAccentColor,
                          btnName: 'Submit',
                          onPress: () {
//                          Navigator.pushNamed(context, NavigationDashboard.id);
                            if (_formKey.currentState.validate()) {
                              // If the form is valid, display a Snackbar.
                              setState(() {
                                showSpinner = true;
                              });
//                              login(email, pass);
                            }
                          },
                        ),
                      ),
                    ],
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
}
