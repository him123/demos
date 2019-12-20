import 'package:american_homes_online/constants/constants.dart';
import 'package:american_homes_online/screens/agentlist_screen.dart';
import 'package:flutter/material.dart';

import 'dashboard_screen.dart';

class AgentFinderScreen extends StatelessWidget {
  static String id = 'AgentFinderScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Hero(
              tag: 'agent',
              child: Image.asset(
                'images/agent.png',
                height: 30.0,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Text("Agent Finder"),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 20.0,),
          Text('Find agents in your area.', style: TextStyle(fontSize: 30.0, ),),
          SizedBox(height: 10.0,),
          Text(
              'To get started, enter your location or search for a specific agent by name.',
          style: TextStyle(fontSize: 20.0), textAlign: TextAlign.center,),
          SizedBox(height: 30.0,),
          Padding(
            padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0,bottom: 5.0),
            child: TextField(
              decoration: kInputBoxDecoration.copyWith(hintText: 'Enter Location'),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0,bottom: 5.0),
            child: TextField(

              decoration: kInputBoxDecoration.copyWith(hintText: 'Enter Name'),
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
            child: InkWell(
              onTap: (){

                Navigator.pushNamed(context, AgentListScreen.id);
              },
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
                child: Text('SEARCH',
                    style:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
