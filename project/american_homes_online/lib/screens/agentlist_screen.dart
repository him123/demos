import 'package:american_homes_online/constants/constants.dart';
import 'package:american_homes_online/model/agent.dart';
import 'package:american_homes_online/widget/agent_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'dart:convert';
import 'package:shimmer/shimmer.dart';

class AgentListScreen extends StatefulWidget {
  static String id = 'AgentListScreen';
  final String location;
  final String name;

  AgentListScreen({this.location, this.name});

  @override
  _AgentListScreenState createState() =>
      _AgentListScreenState(name: name, location: location);
}

class _AgentListScreenState extends State<AgentListScreen> {
  final String location;
  final String name;
  bool showSpinner = false;
  List<Agent> list = List();
  bool isFail = false;
  String total='0';

  _AgentListScreenState({this.location, this.name});

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    showSpinner=true;
    getAgents(name, location);
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Agents'),
        ),
        body: list.length == 0
            ? ShimmerList(
                isFail: isFail,
              )
            : ListView.builder(
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

  Future<String> getAgents(String name, String location) async {
    print('========= getData called ===========');
    var response = await http.get(
        'https://americanhomesonline.com/wp-json/api/v1/Agent_Filter/?secret_key=yQTTspWXd530xNAEnBKkMFNFuBbKG6kd&location=$location&agent_name=$name');

    this.setState(() {
      dynamic data = json.decode(response.body)['data'];

      print('Check Data: $data');
      if (data != null) {
        if (response.statusCode == 200) {
          list =
              (data as List).map((data) => new Agent.fromJson(data)).toList();

          String firstname = list[0].title;
          print('All Shops: $firstname');

          setState(() {
            showSpinner = false;
          });
        } else {
          setState(() {
            showSpinner = false;
            isFail = true;
          });
          throw Exception('Failed to load photos');
        }
      } else {
        setState(() {
          showSpinner = false;
          isFail = true;
        });
      }
    });

//    print(data[1]["name"]);

    showSpinner = false;
    return "Success!";
  }
}

class ShimmerList extends StatelessWidget {
  final isFail;

  ShimmerList({this.isFail});

  @override
  Widget build(BuildContext context) {
    int offset = 0;
    int time = 800;

    return SafeArea(
      child: isFail == true
          ? Center(child: Text('No Agent Found', style: TextStyle(fontSize: 25.0),))
          : ListView.builder(
              itemCount: 6,
              itemBuilder: (BuildContext context, int index) {
                offset += 5;
                time = 800 + offset;

                print(time);

                return Shimmer.fromColors(
                  highlightColor: Colors.white,
                  baseColor: Colors.grey[300],
                  child: ShimmerLayout(),
                  period: Duration(milliseconds: time),
                );
              },
            ),
    );
  }
}

class ShimmerLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double containerWidth = 200;
    double containerHeight = 15;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CircleAvatar(
            radius: 50.0,
            backgroundColor: Colors.grey,
          ),
          SizedBox(
            width: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: containerHeight,
                  width: containerWidth,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 15.0,
                ),
                Container(
                  height: containerHeight,
                  width: containerWidth,
                  color: Colors.grey,
                ),
                Container(
                  height: containerHeight,
                  width: containerWidth,
                  color: Colors.grey,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
