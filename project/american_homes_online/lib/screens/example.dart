import 'package:american_homes_online/constants/constants.dart';
import 'package:american_homes_online/screens/mapsearch_screen.dart';
import 'package:american_homes_online/screens/search_screen.dart';
import 'package:american_homes_online/widget/description_more.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'dart:convert';

class AgentDetails extends StatefulWidget {
  static String id = 'AgentDetails';
  final String agentName;
  final String agentId;
  final String img;

  AgentDetails({this.agentId, this.agentName, this.img});

  @override
  _AgentDetailsState createState() =>
      _AgentDetailsState(agentId: agentId, agentName: agentName, img: img);
}

class _AgentDetailsState extends State<AgentDetails> {
  final String agentName;
  final String agentId;
  final String img;
  bool showSpinner = false;
  String email = '', address = '', description = '', mobile = '', facebook='',twitter='', linkedin='',website='';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    showSpinner = true;
    getAgentDetails();
  }

  _AgentDetailsState({this.agentId, this.agentName, this.img});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Scaffold(
          body: Column(
            children: <Widget>[
              /*IMAGE AND NAME*/ Container(
                color: kWebSiteBlueColor,
                child: Container(
                  height: 150.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Image.network(img, fit: BoxFit.fill,),
                          SizedBox(
                            width: 10.0,
                          ),
                          Expanded(
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(agentName,
                                      style: TextStyle(
                                          fontSize: 26.0,
                                          fontWeight: FontWeight.w900,
                                          color: Colors.white)),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    address,
                                    maxLines: 2,
                                    style:  TextStyle(
                                        fontFamily: 'Raleway',
                                        fontSize: 17.0,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.white),
                                  ),
                                  SizedBox(height: 5.0,),
                                  Text(email,
                                      style: TextStyle(
                                          fontFamily: 'Raleway',
                                          fontSize: 17.0,
                                          fontWeight: FontWeight.w900,
                                          color: Colors.white)),
                                  Text(mobile,
                                      style: TextStyle(
                                          fontFamily: 'Raleway',
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w900,
                                          color: Colors.white)),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      /*KEEP LAST*/ Container(
                        width: double.infinity,
                      )
                    ],
                  ),
                ),
              ),
              /*MY LISTING*/     InkWell(
                onTap: (){
                  Navigator.pushNamed(context, MapSearchScreen.id);
                },
                /*MY LISTING*/  child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('My Listing', style: kAgentDetailsTextTitleStyle,),
                        Text('8 Listing', style: kAgentDetailsTextBelowStyle),
                      ],
                    ),
                    new Spacer(), // I just added one line
                    Icon(Icons.navigate_next, color: Colors.black)
                  ],
                ),
              ),
              ),
              Divider(color: Colors.black,),
              /*CONTACTS*/ Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Icon(FontAwesomeIcons.phone),
                    SizedBox(width: 10.0,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('(079 25475695)', style: kAgentDetailsTextTitleStyle),
                        Text('Off Phone', style: kAgentDetailsTextBelowStyle),
                        SizedBox(height: 10.0,),
                        Text('(079 25475695)', style: kAgentDetailsTextTitleStyle),
                        Text('Off Phone', style: kAgentDetailsTextBelowStyle),
                        SizedBox(height: 10.0,),
                        Text('(079 25475695)', style: kAgentDetailsTextTitleStyle),
                        Text('Off Phone', style: kAgentDetailsTextBelowStyle),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Divider(color: Colors.red, ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              /*EMAIL*/ Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Icon(FontAwesomeIcons.envelope),
                    SizedBox(width: 10.0,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(email, style: kAgentDetailsTextTitleStyle),
                        Text('Email', style: kAgentDetailsTextBelowStyle),
                      ],
                    ),
                  ],
                ),
              ),
              Divider(color: Colors.black,),
              /*FACEBOOK*/ facebook==''? Container():Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Icon(FontAwesomeIcons.facebook),
                    SizedBox(width: 10.0,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(facebook, style: kAgentDetailsTextTitleStyle, overflow: TextOverflow.ellipsis,
                          softWrap: false,),
                        Text('Facebook', style: kAgentDetailsTextBelowStyle),
                      ],
                    ),
                    new Spacer(), // I just added one line
                    Icon(Icons.navigate_next, color: Colors.black)
                  ],
                ),
              ),
              Divider(color: Colors.black,),
              /*TWITTER*/ twitter==''? Container():Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Icon(FontAwesomeIcons.twitter),
                    SizedBox(width: 10.0,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(twitter, style: kAgentDetailsTextTitleStyle),
                        Text('Twitter', style: kAgentDetailsTextBelowStyle),
                      ],
                    ),
                    new Spacer(), // I just added one line
                    Icon(Icons.navigate_next, color: Colors.black)
                  ],
                ),
              ),
              Divider(color: Colors.black,),
              /*LINKEDIN*/ linkedin==''? Container():Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Icon(FontAwesomeIcons.linkedin),
                    SizedBox(width: 10.0,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(linkedin, style: kAgentDetailsTextTitleStyle),
                        Text('LinkedIn', style: kAgentDetailsTextBelowStyle),
                      ],
                    ),
                    new Spacer(), // I just added one line
                    Icon(Icons.navigate_next, color: Colors.black)
                  ],
                ),
              ),
              Divider(color: Colors.black,),
              /*WEBSITE*/ website==''? Container():Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Icon(FontAwesomeIcons.internetExplorer),
                    SizedBox(width: 10.0,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(website, style: kAgentDetailsTextTitleStyle),
                        Text('Website', style: kAgentDetailsTextBelowStyle),
                      ],
                    ),
                    new Spacer(), // I just added one line
                    Icon(Icons.navigate_next, color: Colors.black)
                  ],
                ),
              ),
              DescriptionTextWidget(
                text: description,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<String> getAgentDetails() async {
    print('========= getData called ===========');
    var response = await http.get(
        'https://americanhomesonline.com/wp-json/api/v1/Agent_Details/?secret_key=yQTTspWXd530xNAEnBKkMFNFuBbKG6kd&agent_id=19647');

    this.setState(() {
      dynamic data = json.decode(response.body)['data'];

      if (response.statusCode == 200) {
        print('Agent Desc: ${data['agency_description'].toString()}');
        email = data['agency_email'].toString();
        address = data['agency_address'].toString();
        description = data['agency_description'].toString();

        facebook = data['agency_facebook'].toString();
        twitter = data['agency_twitter'].toString();
        linkedin = data['agency_linkedin'].toString();
        website = data['agency_website'].toString();

        setState(() {
          showSpinner = false;
        });
      } else {
        throw Exception('Failed to load photos');
      }
    });

//    print(data[1]["name"]);

    showSpinner = false;
    return "Success!";
  }
}
