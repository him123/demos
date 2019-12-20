import 'package:american_homes_online/constants/constants.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
  String email='', address='', description='', mobile='';


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    showSpinner=true;
    getAgentDetails();
  }


  _AgentDetailsState({this.agentId, this.agentName, this.img});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Scaffold(
          body: ,
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

        print('Agent Desc: ${data['agent_desc'].toString()}');
        email = data['agent_email'].toString();
        address= data['agent_address'].toString();
        description= data['agent_desc'].toString();

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
