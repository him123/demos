import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_screen.dart';

class MyProfileAgentScreen extends StatefulWidget {
  final String userId;
  final String userType;

  MyProfileAgentScreen({this.userId, this.userType});

  @override
  _MyProfileAgentScreenState createState() =>
      _MyProfileAgentScreenState(userId: userId, userType: userType);
}

class _MyProfileAgentScreenState extends State<MyProfileAgentScreen> {
  final String userId;
  final String userType;

  String user_id = '',
      title = '',
      description = '',
      email = '',
      phone = '',
      mobile = '',
      skype = '',
      facebook = '',
      twitter = '',
      linkedin = '',
      pinterest = '',
      instagram = '',
      address = '',
      languages = '',
      license = '',
      taxes = '',
      lat = '',
      long = '',
      website = '',
      city = '',
      area = '',
      county = '',
      user_custom_picture = '',
      first_name = "",
      last_name = "",
      agent_member = '',
      position = '',
      agency_opening_hours = '';

  _MyProfileAgentScreenState({this.userId, this.userType});

  var titleController = TextEditingController();
  var fnameController = TextEditingController();
  var lnameController = TextEditingController();
  var emailController = TextEditingController();
  var phnoController = TextEditingController();
  var mobileController = TextEditingController();
  var skypeController = TextEditingController();

  var addressController = TextEditingController();
  var stateController = TextEditingController();
  var cityController = TextEditingController();
  var areaController = TextEditingController();
  var neighbourController = TextEditingController();
  var zipController = TextEditingController();

  var facebookController = TextEditingController();
  var tweeterController = TextEditingController();
  var linkedinController = TextEditingController();
  var instagramController = TextEditingController();
  var pintrestController = TextEditingController();
  var websiteController = TextEditingController();

  bool showSpinner = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    showSpinner = true;

    getMyProfile(userId, userType);
  }

  List<String> spCategories = [
    'None',
    'Residencial',
  ];

  List<String> spActionCategories = [
    'None',
    'Commercial',
    'Residential',
  ];

  String spCatVal = 'None',
      selectedCate = '',
      spACatVal = 'None',
      selectedACate = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0F2F3),
      appBar: AppBar(
        title: Text('My Profile'),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              Alert(
                context: context,
                title: 'Want to Logout?',
                buttons: [
                  DialogButton(
                    child: Text(
                      "Yes",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    onPressed: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();

                      prefs.setString('login', '0');
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          LoginScreen.id, (Route<dynamic> route) => false);
                    },
                    width: 120,
                  ),
                  DialogButton(
                    child: Text(
                      "No",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    onPressed: () => Navigator.pop(context),
                    width: 120,
                  )
                ],
              ).show();
            },
            child: Container(
                margin: EdgeInsets.all(10.0),
                child: Icon(Icons.settings_power)),
          )
        ],
      ),
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: ListView(
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 10.0,
                  ),
                  user_custom_picture == ''
                      ? Image.asset(
                      'images/default_user.png')
                      : Image.network(user_custom_picture, width: 200.0, height: 150.0, fit: BoxFit.cover,),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 180.0,
                    height: 30.0,
                    color: Colors.red,
                    child: Text('UPLOAD PROFILE IMAGE',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 14.0)),
                  ),
                  Text('*minimum 500px x 500px'),
                  SizedBox(
                    height: 50.0,
                  ),
                  /*TITLE/POSITION*/ Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 2.0, color: Theme.of(context).primaryColor),
                      ),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Column(
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Agent Details',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 5.0,),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Add some information about yourself.',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          /*FIRST NAME*/ Container(
                            width: 300.0,
                            height: 40.0,
                            child: TextFormField(
                              controller: titleController,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  filled: true,
                                  labelText: 'Title/Position',
                                  fillColor: Colors.white),
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Container(
                            width: double.infinity,
                          )
                        ],
                      ),
                    ),
                  ),
                  /*ADD CONTACT INFO*/ Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 2.0, color: Theme.of(context).primaryColor),
                      ),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Column(
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Agent Details',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 5.0,),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Add your contact information.',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          /*FIRST NAME*/ Container(
                            width: 300.0,
                            height: 40.0,
                            child: TextFormField(
                              controller: fnameController,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  filled: true,
                                  labelText: 'Enter First name',
                                  fillColor: Colors.white),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          /*LAST NAME*/ Container(
                            width: 300.0,
                            height: 40.0,
                            child: TextFormField(
                              controller: lnameController,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  filled: true,
//                        hintStyle: TextStyle(color: Colors.grey[800]),
                                  labelText: 'Enter Last name',
                                  fillColor: Colors.white),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          /*EMAIL*/ Container(
                            width: 300.0,
                            height: 40.0,
                            child: TextFormField(
                              controller: emailController,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  filled: true,
//                        hintStyle: TextStyle(color: Colors.grey[800]),
                                  labelText: 'Enter email',
                                  fillColor: Colors.white),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          /*PHONE*/ Container(
                            width: 300.0,
                            height: 40.0,
                            child: TextFormField(
                              controller: phnoController,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  filled: true,
//                        hintStyle: TextStyle(color: Colors.grey[800]),
                                  labelText: 'Phone number',
                                  fillColor: Colors.white),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          /*MOBILE*/ Container(
                            width: 300.0,
                            height: 40.0,
                            child: TextFormField(
                              controller: mobileController,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  filled: true,
//                        hintStyle: TextStyle(color: Colors.grey[800]),
                                  labelText: 'Mobile number',
                                  fillColor: Colors.white),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          /*SKYPE*/ Container(
                            width: 300.0,
                            height: 40.0,
                            child: TextFormField(
                              controller: skypeController,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  filled: true,
//                        hintStyle: TextStyle(color: Colors.grey[800]),
                                  labelText: 'Skype',
                                  fillColor: Colors.white),
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Container(
                            width: double.infinity,
                          )
                        ],
                      ),
                    ),
                  ),
                  /*IN WHAT AREA ARE YOUR PROPERTY*/ Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 2.0, color: Theme.of(context).primaryColor),
                      ),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Column(
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Agent Location',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 5.0,),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'In what area are your properties',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          /*ADDRESS*/ Container(
                            width: 300.0,
                            height: 40.0,
                            child: TextFormField(
                              controller: addressController,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  filled: true,
//                        hintStyle: TextStyle(color: Colors.grey[800]),
                                  labelText: 'Address',
                                  fillColor: Colors.white),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          /*STATE/COUNTY*/ Container(
                            width: 300.0,
                            height: 40.0,
                            child: TextFormField(
                              controller: stateController,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  filled: true,
//                        hintStyle: TextStyle(color: Colors.grey[800]),
                                  labelText: 'State/County',
                                  fillColor: Colors.white),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          /*CITY*/ Container(
                            width: 300.0,
                            height: 40.0,
                            child: TextFormField(
                              controller: cityController,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  filled: true,
//                        hintStyle: TextStyle(color: Colors.grey[800]),
                                  labelText: 'City',
                                  fillColor: Colors.white),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          /*NEIGHBORHOOD*/ Container(
                            width: 300.0,
                            height: 40.0,
                            child: TextFormField(
                              controller: neighbourController,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  filled: true,
//                        hintStyle: TextStyle(color: Colors.grey[800]),
                                  labelText: 'Neighborhood',
                                  fillColor: Colors.white),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          /*ZIP*/ Container(
                            width: 300.0,
                            height: 40.0,
                            child: TextFormField(
                              controller: zipController,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  filled: true,
//                        hintStyle: TextStyle(color: Colors.grey[800]),
                                  labelText: 'Zip',
                                  fillColor: Colors.white),
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Container(
                            width: double.infinity,
                          )
                        ],
                      ),
                    ),
                  ),
                  /*SOCIAL DETAILS*/ Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 2.0, color: Theme.of(context).primaryColor),
                      ),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Column(
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Agent Details',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 5.0,),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Add your social media information.',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          /*FIRST NAME*/ Container(
                            width: 300.0,
                            height: 40.0,
                            child: TextFormField(
                              controller: facebookController,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  filled: true,
                                  labelText: 'Facebook Url',
                                  fillColor: Colors.white),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          /*LAST NAME*/ Container(
                            width: 300.0,
                            height: 40.0,
                            child: TextFormField(
                              controller: tweeterController,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  filled: true,
//                        hintStyle: TextStyle(color: Colors.grey[800]),
                                  labelText: 'Tweeter Url',
                                  fillColor: Colors.white),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          /*EMAIL*/ Container(
                            width: 300.0,
                            height: 40.0,
                            child: TextFormField(
                              controller: linkedinController,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  filled: true,
//                        hintStyle: TextStyle(color: Colors.grey[800]),
                                  labelText: 'LinkedIn Url',
                                  fillColor: Colors.white),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          /*PHONE*/ Container(
                            width: 300.0,
                            height: 40.0,
                            child: TextFormField(
                              controller: instagramController,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  filled: true,
//                        hintStyle: TextStyle(color: Colors.grey[800]),
                                  labelText: 'Instagram Url',
                                  fillColor: Colors.white),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          /*MOBILE*/ Container(
                            width: 300.0,
                            height: 40.0,
                            child: TextFormField(
                              controller: pintrestController,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  filled: true,
//                        hintStyle: TextStyle(color: Colors.grey[800]),
                                  labelText: 'Pinterest Url',
                                  fillColor: Colors.white),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          /*WEBSITE*/ Container(
                            width: 300.0,
                            height: 40.0,
                            child: TextFormField(
                              controller: websiteController,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  filled: true,
//                        hintStyle: TextStyle(color: Colors.grey[800]),
                                  labelText: 'Website',
                                  fillColor: Colors.white),
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Container(
                            width: double.infinity,
                          ),
                        ],
                      ),
                    ),
                  ),
                  /*AGENT AREA/CATEGORIES*/ Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 2.0, color: Theme.of(context).primaryColor),
                      ),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Column(
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Agent Area/Categories',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 5.0,),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'What kind of listings do you handle?',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          /*Select Category*/ Container(
                            color: Colors.white,
                            width: 300.0,
                            height: 40.0,
                            child: Container(
                              alignment: Alignment.center,
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      width: 1.0, style: BorderStyle.solid),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                ),
                              ),
                              child: DropdownButton<String>(
                                value: spCatVal,
                                icon: Icon(Icons.arrow_drop_down),
                                iconSize: 24,
                                elevation: 16,
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 20,
                                    inherit: false,
                                    decorationColor: Colors.white),
//                  underline: Container(
//                    height: 2,
//                    color: Colors.deepPurpleAccent,
//                  ),

                                onChanged: (String data) {
                                  setState(() {
                                    spCatVal = data;
                                    selectedCate = spCatVal;
                                  });
                                },
                                items: spCategories
                                    .map<DropdownMenuItem<String>>(
                                        (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          /*Select Action Category*/ Container(
                            color: Colors.white,
                            width: 300.0,
                            height: 40.0,
                            child: Container(
                              alignment: Alignment.center,
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      width: 1.0, style: BorderStyle.solid),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                ),
                              ),
                              child: DropdownButton<String>(
                                value: spACatVal,
                                icon: Icon(Icons.arrow_drop_down),
                                iconSize: 24,
                                elevation: 16,
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 20,
                                    inherit: false,
                                    decorationColor: Colors.white),
//                  underline: Container(
//                    height: 2,
//                    color: Colors.deepPurpleAccent,
//                  ),

                                onChanged: (String data) {
                                  setState(() {
                                    spACatVal = data;
                                    selectedACate = spACatVal;
                                  });
                                },
                                items: spActionCategories
                                    .map<DropdownMenuItem<String>>(
                                        (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                  /*AGENT SOME INFORMATION ABOUT YOURSELF*/ Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 2.0, color: Theme.of(context).primaryColor),
                      ),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Add some information about yourself',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          /*FIRST NAME*/ Container(
                            width: 300.0,
                            height: 40.0,
                            child: TextFormField(
                              controller: fnameController,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  filled: true,
                                  labelText: '*Title/Position',
                                  fillColor: Colors.white),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          /*LAST NAME*/ Container(
                            width: 300.0,
                            child: TextFormField(
                              maxLines: 8,
                              controller: lnameController,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  filled: true,
//                        hintStyle: TextStyle(color: Colors.grey[800]),
                                  labelText: 'About Me',
                                  fillColor: Colors.white),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      alignment: Alignment.center,
                      width: 200.0,
                      height: 40.0,
                      color: Colors.red,
                      child: Text('UPDATE PROFILE',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 16.0)),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<String> getMyProfile(String id, String userType) async {
    print(
        '========= getMyProfile called ===========$id and usertype: $userType');
    var response = await http.get(
        'https://americanhomesonline.com/wp-json/api/v1/Profile/?secret_key=yQTTspWXd530xNAEnBKkMFNFuBbKG6kd&user_id=$id&user_type=$userType');

    print(response.body);

    if (response.statusCode == 200) {
      dynamic data = json.decode(response.body)['data'];

      if (data == null) {
        print('fail');
        setState(() {
          showSpinner = false;
        });
      } else {
        print('success');
        SharedPreferences prefs = await SharedPreferences.getInstance();

        title = data['title'];
        user_custom_picture = data['user_custom_picture'];
        first_name = data['first_name'];
        last_name = data['last_name'];
        email = data['email'];
        phone = data['phone'];
        mobile = data['mobile'];
        skype = data['skype'];

        facebook = data['facebook'];
        twitter = data['twitter'];
        linkedin = data['linkedin'];
        instagram = data['instagram'];
        pinterest = data['pinterest'];
        website = data['website'];

        titleController.text = title;
        fnameController.text = first_name;
        lnameController.text = last_name;
        emailController.text = email;
        phnoController.text = phone;
        mobileController.text = mobile;
        skypeController.text = skype;

        addressController.text = data['address'].toString();
        print('Address: ${data['address']}');
//        stateController = data['state'];
        cityController.text = data['city'];
//        neighbourController = data['neighbour'];
//        zipController = data['zip'];

        facebookController.text = facebook;
        tweeterController.text = twitter;
        linkedinController.text = linkedin;
        instagramController.text = instagram;
        pintrestController.text = pinterest;
        websiteController.text = website;

        print('username: $email');

        prefs.setString('profile_pic', user_custom_picture);
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
}
