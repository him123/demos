import 'package:american_homes_online/model/property.dart';
import 'package:american_homes_online/screens/property_details_screen.dart';
import 'package:american_homes_online/widget/property_item.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'dart:convert';

import 'package:shimmer/shimmer.dart';

class MyFavorite extends StatefulWidget {
  static String id='MyFavorite';
  final String userId;

  MyFavorite({this.userId});

  @override
  _MyFavoriteState createState() => _MyFavoriteState(userId: userId);
}

class _MyFavoriteState extends State<MyFavorite> {

  bool showSpinner = false;
  List<Property> list = List();

  final String userId;
  _MyFavoriteState({this.userId});

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    showSpinner = true;
    getProperties(userId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Row(
        children: <Widget>[
          Hero(
            tag: 'fav',
            child: Image.asset(
              'images/favorite.png',
              height: 30.0,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
          Text("Favorite"),
        ],
      ),),
      body: list.length == 0
          ? ShimmerList()
          : ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            return PropertyItem(
              price: list[index].price,
              property_action_category: list[index].property_action_category,
              property_address: list[index].property_address,
              property_id: list[index].property_id,
              property_image: list[index].property_image,
              property_rooms: list[index].property_rooms,
              property_size: list[index].property_size,
              property_title: list[index].property_title,
              property_bedrooms: list[index].property_bedrooms,
            );
          }),
    );
  }

  Future<String> getProperties(String userId) async {
    print('========= Property called ===========$userId');
    var response = await http.get(
        'https://americanhomesonline.com/wp-json/api/v1/List_Fav/?secret_key=yQTTspWXd530xNAEnBKkMFNFuBbKG6kd&user_id=$userId');

    this.setState(() {
      dynamic data = json.decode(response.body)['data'];

      if (response.statusCode == 200) {
        list =
            (data as List).map((data) => new Property.fromJson(data)).toList();

        String firstname = list[0].property_latitude;
        print('All Shops: $firstname');

        setState(() {
          showSpinner = false;
        });
      } else {
        showSpinner = false;
        throw Exception('Failed to load photos');
      }
    });

    return "Success!";
  }
}

class ShimmerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int offset = 0;
    int time = 800;

    return SafeArea(
      child: ListView.builder(
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

    return Column(
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 150.0,
              height: 115.0,
              color: Colors.grey,
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
            ),

          ],
        ),
        Divider(
          color: Colors.black,
          height: 10.0,
        ),
      ],
    );
  }
}
