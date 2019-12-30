import 'dart:async';

import 'package:american_homes_online/constants/constants.dart';
import 'package:american_homes_online/model/property.dart';
import 'package:american_homes_online/screens/property_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'dart:convert';

class MapSearchScreen extends StatelessWidget {
  static String id = 'MapSearchScreen';

  List<String> _tabs = [
    "Map",
    "List",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: new AppBar(
            title: Row(
              children: <Widget>[
                Hero(
                  tag: 'map-img',
                  child: Image.asset(
                    'images/mappin.png',
                    height: 30.0,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text("Map Search"),
              ],
            ),
            // Creating Tabs
            bottom: PreferredSize(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TabBar(
                    labelStyle: TextStyle(fontSize: 19.0),
                    indicator: UnderlineTabIndicator(
                        borderSide: BorderSide(
                          width: 4,
                          color: Colors.redAccent,
                        ),
                        insets: EdgeInsets.only(left: 0, right: 8, bottom: 4)),
                    isScrollable: true,
                    tabs: _tabs
                        .map((label) => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  child: Tab(text: "$label"),
                                  width: 60.0,
                                ),
                              ],
                            ))
                        .toList(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: Text(
                      'Search result',
                      style: TextStyle(
                          fontSize: 17.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
              preferredSize: Size.fromHeight(50.0),
            ),
          ),
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              MapSample(),
//              MapSample(),
              PropertyListScreen(),
            ],
          ),
        ),
      ),
    );
  }
}

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  bool showSpinner = false;
  List<Property> list = List();
  Completer<GoogleMapController> _controller = Completer();
  Map<MarkerId, Marker> markers =
      <MarkerId, Marker>{}; // CLASS MEMBER, MAP OF MARKS

  static CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(42.2814681, -71.09566540000003),
    zoom: 5.0,
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProperties();
  }

  void _add(List<Property> list) {
    for (int i = 0; i < list.length; i++) {
      MarkerId markerId = MarkerId(list[i].property_id.toString());

      Marker marker = Marker(
        markerId: markerId,
        position: LatLng(double.parse(list[i].property_latitude),
            double.parse(list[i].property_longitude)),
        infoWindow: InfoWindow(
            title: list[i].property_title,
            snippet: list[i].property_action_category),
        onTap: () {
//        _onMarkerTapped(markerId);
        },
      );
      markers[markerId] = marker;
    }

//    });
  }

//  static CameraPosition _kLake = CameraPosition(
//      bearing: 192.8334901395799,
//      target: LatLng(37.43296265331129, -122.08832357078792),
//      tilt: 59.440717697143555,
//      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: Set<Marker>.of(markers.values),
      ),

//      floatingActionButton: FloatingActionButton.extended(
//        onPressed: _goToTheLake,
//        label: Text('To the lake!'),
//        icon: Icon(Icons.directions_boat),
//      ),
    );
  }

//  Future<void> _goToTheLake() async {
//    final GoogleMapController controller = await _controller.future;
//    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
//  }

  Future<String> getProperties() async {
    print('========= Property called ===========');
    var response = await http.get(
        'https://americanhomesonline.com/wp-json/api/v1/All_Property/?secret_key=yQTTspWXd530xNAEnBKkMFNFuBbKG6kd');

    if (mounted) {
      this.setState(() {
        dynamic data = json.decode(response.body)['data'];

        if (response.statusCode == 200) {
          list = (data as List)
              .map((data) => new Property.fromJson(data))
              .toList();

          String firstname = list[0].property_latitude;
          print('All Shops: $firstname');

          _add(list);

          setState(() {
            showSpinner = false;

            _kGooglePlex = CameraPosition(
              target: LatLng(double.parse(list[0].property_latitude),
                  double.parse(list[0].property_longitude)),
              zoom: 14.4746,
            );
          });
        } else {
          throw Exception('Failed to load photos');
        }
      });
    }

//    print(data[1]["name"]);

    showSpinner = false;
    return "Success!";
  }
}
