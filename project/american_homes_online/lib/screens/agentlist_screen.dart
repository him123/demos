import 'package:american_homes_online/constants/constants.dart';
import 'package:american_homes_online/model/agent.dart';
import 'package:american_homes_online/widget/agent_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'dart:convert';

class AgentListScreen extends StatefulWidget {
  static String id = 'AgentListScreen';

  @override
  _AgentListScreenState createState() => _AgentListScreenState();
}

class _AgentListScreenState extends State<AgentListScreen> {
  bool showSpinner = false;
  List<Agent> list = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    showSpinner=true;
    getAgents();
  }
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Agents'),
        ),
        body: ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              return AgentItem(
                title: list[index].title,
                agent_id: list[index].agent_id.toString(),
                mobile: list[index].mobile,
                profile_img: list[index].profile_img,
                total: list[index].total.toString(),
              );
            }),
      ),
    );
  }

  Future<String> getAgents() async {
    print('========= getData called ===========');
    var response = await http.get(
        'https://americanhomesonline.com/wp-json/api/v1/Agent_Filter/?secret_key=yQTTspWXd530xNAEnBKkMFNFuBbKG6kd&location=&agent_name=');

    this.setState(() {
      dynamic data = json.decode(response.body)['data'];

      if (response.statusCode == 200) {
        list = (data as List).map((data) => new Agent.fromJson(data)).toList();

        String firstname = list[0].title;
        print('All Shops: $firstname');

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
