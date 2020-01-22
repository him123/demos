import 'package:american_homes_online/constants/constants.dart';
import 'package:american_homes_online/screens/agent_details.dart';
import 'package:flutter/material.dart';

class AgentItem extends StatelessWidget {
  final String profile_img;
  final String title;
  final String mobile;
  final String total;
  final String agent_id;

  AgentItem({this.profile_img, this.title, this.mobile, this.total, this.agent_id});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      radius: 2.0,
      borderRadius: BorderRadius.all(Radius.circular(5.0)),
      splashColor: Colors.red,
      onTap: (){
        Navigator.push(
            context,
            MaterialPageRoute(
                fullscreenDialog: true,
                builder: (BuildContext context) =>
                    AgentDetails(agentId: agent_id,agentName: title,img: profile_img,total: total)));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CircleAvatar(
              radius: 50.0,
              backgroundImage: NetworkImage(profile_img),
            ),
            SizedBox(width: 20.0,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 20.0, fontFamily: 'Raleway'),
                  ),
                  SizedBox(height: 15.0,),
                  Text(mobile, style: kAgentDescTextStyle,),
                  Text('$total listing', style: kAgentDescTextStyle,)
                ],
              ),
            )
          ],
        ),
      ),

    );
  }
}
