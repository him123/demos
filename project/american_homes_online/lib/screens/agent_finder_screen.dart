import 'package:american_homes_online/constants/constants.dart';
import 'package:american_homes_online/screens/agentlist_screen.dart';
import 'package:flutter/material.dart';

import 'dashboard_screen.dart';

class AgentFinderScreen extends StatelessWidget {
  static String id = 'AgentFinderScreen';
  final showAppBar;
  AgentFinderScreen({this.showAppBar});

  String location='',name='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: showAppBar==true?AppBar(
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
      ):null,
      body: ListView(

        children: <Widget>[
          SizedBox(height: 20.0,),
          Center(child: Text('Find agents in your area.', style: TextStyle(fontSize: 30.0, ),)),
          SizedBox(height: 10.0,),
          Center(
            child: Text(
                'To get started, enter your location or search for a specific agent by name.',
            style: TextStyle(fontSize: 20.0), textAlign: TextAlign.center,),
          ),
          SizedBox(height: 30.0,),
          Padding(
            padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0,bottom: 5.0),
            child: TextField(
              onChanged: (val){
                location=val;
              },
              decoration: kInputBoxDecoration.copyWith(hintText: 'Enter Location'),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0,bottom: 5.0),
            child: TextField(
              onChanged: (val){
                name=val;
              },
              decoration: kInputBoxDecoration.copyWith(hintText: 'Enter Name'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0,top: 10.0,left: 70.0,right: 70.0),
            child: InkWell(
              onTap: (){
                Navigator.of(context).push(
                  PageRouteBuilder(
                      transitionDuration: Duration(seconds: 2),
                      pageBuilder: (BuildContext context, _, __) {
                        return AgentListScreen(name: name,location: location,);
                      }, transitionsBuilder:
                      (_, Animation<double> animation, __, Widget child) {
                    return new FadeTransition(
                        opacity: animation, child: child);
                  }),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor
                ),
                padding: const EdgeInsets.only(
                    left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
                child: Center(
                  child: Text('SEARCH',
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
