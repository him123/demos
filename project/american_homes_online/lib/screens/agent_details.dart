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
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

import 'package:shimmer/shimmer.dart';

class AgentDetails extends StatefulWidget {
  static String id = 'AgentDetails';
  final String agentName;
  final String agentId;
  final String img;
  final String total;

  AgentDetails({this.agentId, this.agentName, this.img,this.total});

  @override
  _AgentDetailsState createState() =>
      _AgentDetailsState(agentId: agentId, agentName: agentName, img: img);
}

class _AgentDetailsState extends State<AgentDetails> {
  final String agentName;
  final String agentId;
  final String img;
  bool showSpinner = false;
  String email = 'NA',
      address = 'NA',
      description = '',
      mobile = 'NA',
      phone = 'NA',
      facebook = 'NA',
      twitter = 'NA',
      linkedin = 'NA',
      website = 'NA';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    showSpinner = true;

    getAgentDetails(agentId);
  }

  _AgentDetailsState({this.agentId, this.agentName, this.img});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(agentName),
              background: Image.network(
                img,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                          transitionDuration:
                          Duration(seconds: 1),
                          pageBuilder: (_, __, ___) =>
                              MapSearchScreen(url: 'https://americanhomesonline.com/wp-json/api/v1/Agent_Property/?secret_key=yQTTspWXd530xNAEnBKkMFNFuBbKG6kd&agent_id=$agentId',filters: 1,city: 'No',)));
                },
                /*MY LISTING*/ child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'My Listing',
                            style: kAgentDetailsTextTitleStyle,
                          ),
                          Text('${widget.total} Listing', style: kAgentDetailsTextBelowStyle),
                        ],
                      ),
                      new Spacer(), // I just added one line
                      Icon(Icons.navigate_next, color: Colors.black)
                    ],
                  ),
                ),
              ),
              Divider(
                color: Colors.black,
              ),
              /*CONTACTS*/ Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Icon(FontAwesomeIcons.phone),
                    SizedBox(
                      width: 10.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        phone=='NA'?getShimmer(30.0):InkWell(
                          onTap: (){
                            print(phone);
                            if(phone!='') {
                              UrlLauncher.launch('tel:+${phone.toString()}');
                            }
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(phone==''?'NA':phone,
                                  style: kAgentDetailsTextTitleStyle),
                              Text('Off Phone',
                                  style: kAgentDetailsTextBelowStyle),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        mobile=='NA'?getShimmer(30.0):InkWell(
                          onTap: (){
                            if(mobile!='') {
                              UrlLauncher.launch('tel:+${mobile.toString()}');
                            }
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(mobile==''?'NA':mobile,
                                  style: kAgentDetailsTextTitleStyle),
                              Text('Off Mobile',
                                  style: kAgentDetailsTextBelowStyle),
                            ],
                          ),
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
                    SizedBox(
                      width: 10.0,
                    ),
                    InkWell(
                      onTap: (){
                        if(email!='') {
                          UrlLauncher.launch('mailto:+${email.toString()}');
                        }
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          email == 'NA'
                              ? getShimmer(30.0)
                              : Text(email, style: kAgentDetailsTextTitleStyle),
                          Text('Email', style: kAgentDetailsTextBelowStyle),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.black,
              ),
              /*FACEBOOK*/ facebook == 'NA'
                  ? getShimmer(60.0)
                  : Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10.0),
                      child: InkWell(
                        onTap: (){
                          if(facebook!='') {
                            UrlLauncher.launch('http:+${facebook.toString()}');
                          }
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Icon(FontAwesomeIcons.facebook),
                            SizedBox(
                              width: 10.0,
                            ),
                            Container(
                              width: 280.0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  facebook == 'NA'
                                      ? getShimmer(20.0)
                                      : Text(
                                          facebook==''?'NA':facebook,
                                          style: kAgentDetailsTextTitleStyle,
                                          overflow: TextOverflow.ellipsis,
                                          softWrap: false,
                                        ),
                                  Text('Facebook',
                                      style: kAgentDetailsTextBelowStyle),
                                ],
                              ),
                            ),
                            new Spacer(), // I just added one line
                            Icon(Icons.navigate_next, color: Colors.black)
                          ],
                        ),
                      ),
                    ),
              Divider(
                color: Colors.black,
              ),
              /*TWITTER*/ twitter == 'NA'
                  ? getShimmer(60.0)
                  : Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10.0),
                      child: InkWell(
                        onTap: (){
                          if(twitter!='') {
                            UrlLauncher.launch('http:+${twitter.toString()}');
                          }
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Icon(FontAwesomeIcons.twitter),
                            SizedBox(
                              width: 10.0,
                            ),
                            Container(
                              width: 280.0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(twitter==''?'NA':twitter,
                                      style: kAgentDetailsTextTitleStyle),
                                  Text('Twitter',
                                      style: kAgentDetailsTextBelowStyle),
                                ],
                              ),
                            ),
                            new Spacer(), // I just added one line
                            Icon(Icons.navigate_next, color: Colors.black)
                          ],
                        ),
                      ),
                    ),
              Divider(
                color: Colors.black,
              ),
              /*LINKEDIN*/ linkedin == 'NA'
                  ? getShimmer(60.0)
                  : Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10.0),
                      child: InkWell(
                        onTap: (){
                          if(linkedin!='') {
                            UrlLauncher.launch('http:+${linkedin.toString()}');
                          }
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Icon(FontAwesomeIcons.linkedin),
                            SizedBox(
                              width: 10.0,
                            ),
                            Container(
                              width: 280.0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(linkedin==''?'NA':linkedin,
                                      style: kAgentDetailsTextTitleStyle),
                                  Text('LinkedIn',
                                      style: kAgentDetailsTextBelowStyle),
                                ],
                              ),
                            ),
                            new Spacer(), // I just added one line
                            Icon(Icons.navigate_next, color: Colors.black)
                          ],
                        ),
                      ),
                    ),
              Divider(
                color: Colors.black,
              ),
              /*WEBSITE*/ website == 'NA'
                  ? getShimmer(60.0)
                  : Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10.0),
                      child: InkWell(
                        onTap: (){
                          if(website!='') {
                            UrlLauncher.launch('http:+${website.toString()}');
                          }
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Icon(FontAwesomeIcons.internetExplorer),
                            SizedBox(
                              width: 10.0,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(website==''?'NA':website, style: kAgentDetailsTextTitleStyle),
                                Text('Website',
                                    style: kAgentDetailsTextBelowStyle),
                              ],
                            ),
                            new Spacer(), // I just added one line
                            Icon(Icons.navigate_next, color: Colors.black)
                          ],
                        ),
                      ),
                    ),
              DescriptionTextWidget(
                text: description,
              ),
            ]),
          )
        ],
      ),
    );
  }

  Future<String> getAgentDetails(String id) async {
    print('========= get Agent called ===========$id');
    var response = await http.get(
        'https://americanhomesonline.com/wp-json/api/v1/Agent_Details/?secret_key=yQTTspWXd530xNAEnBKkMFNFuBbKG6kd&agent_id=$id');

    print(response.body);
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
        mobile = data['agency_mobile'].toString();

        phone = data['agency_phone'].toString();

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

  Shimmer getShimmer(double height) {
    return Shimmer.fromColors(
      highlightColor: Colors.white,
      baseColor: Colors.grey[300],
      child: Container(
        width: 300.0,
        height: height,
        color: Colors.red,
      ),
      period: Duration(milliseconds: 800),
    );
  }
}
