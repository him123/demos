import 'package:flutter/material.dart';


const kPrimaryColor = Color(0xFF42638C);
const kWebSiteBlueColor = Color(0xFF5081D6);
const kAccentColor = Color(0XFFDB303D);


const kBottomContainerHeight = 80.0;
const kActiveCardColor = Color(0xFF1D1E33);
const kInActiveCardColor = Color(0xFF111328);
const kBottomContainerColor = Color(0xFFEB1555);
const kAccentLightColor = Color(0xFFb73d2a);

const kDashboarIconsColor = kPrimaryColor;

const kLalbleTextStyle = TextStyle(
  fontSize: 18.0,
  color: Color(0xFF8D8E98),
);

const DashboarTexts = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);



const kDashBordIconText = TextStyle(
    fontSize: 14.0,
    fontFamily: 'Raleway',
    color: kPrimaryColor,
    fontWeight: FontWeight.bold
);


const kAgentDescTextStyle = TextStyle(
    fontSize: 16.0,
    fontFamily: 'Raleway',
    color: Colors.black,
    fontWeight: FontWeight.bold
);

const kDashTabTextStyle = TextStyle(
    fontSize: 17.0,
    fontFamily: 'Raleway',
    color: Colors.white,
    fontWeight: FontWeight.bold
);

const kMemberShipTextStyle = TextStyle(
    fontSize: 16.0,
    fontFamily: 'Cairo',
);

const kAgentDetailsTextTitleStyle = TextStyle(fontSize: 19.0, color: Colors.black);
const kAgentDetailsTextBelowStyle = TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400, color: Colors.black54);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kInputBoxDecoration= InputDecoration(
  hintText: 'Enter code',
  hintStyle: TextStyle(fontSize: 15.0),
  contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(5.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kAccentColor, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(5.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kAccentColor, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(5.0)),
  ),
);

const kCalTableTextKeyStyle = TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold);
const kCalTableTextValStyle = TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold);
