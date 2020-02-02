import 'dart:async';

import 'package:american_homes_online/components/database_util.dart';
import 'package:american_homes_online/model/property.dart';
import 'package:american_homes_online/model/saved_search.dart';
import 'package:american_homes_online/screens/property_list_screen.dart';
import 'package:american_homes_online/screens/search_screen.dart';
import 'package:android_intent/android_intent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:app_settings/app_settings.dart';

class MapSearchScreen extends StatefulWidget {
  static String id = 'MapSearchScreen';
  String url;
  final int filters;
  final String city;

  MapSearchScreen({this.url, this.filters, this.city});

  @override
  _MapSearchScreenState createState() => _MapSearchScreenState();
}

class _MapSearchScreenState extends State<MapSearchScreen> {
//  String url = 'https://americanhomesonline.com/wp-json/api/v1/All_Property/?secret_key=yQTTspWXd530xNAEnBKkMFNFuBbKG6kd';
  List<String> _tabs = [
    "Map",
    "List",
  ];
  TextEditingController _textFieldController = TextEditingController();

  List<Property> list = List();


  Map<MarkerId, Marker> markers =
      <MarkerId, Marker>{}; // CLASS MEMBER, MAP OF MARKS
  String savedSearchName = '';
  double newLat =  40.380720, newLong = -102.164004;
  bool showProgress = false;
  bool showNoDataFound = false;

  void _add(List<Property> list) {
    markers.clear();
    for (int i = 0; i < list.length; i++) {
      MarkerId markerId = MarkerId(list[i].property_id.toString());

      Marker marker = Marker(
        markerId: markerId,
        position: LatLng(
            double.parse(list[i].property_latitude == ""
                ? '0.0'
                : list[i].property_latitude),
            double.parse(list[i].property_longitude == ""
                ? '0.0'
                : list[i].property_longitude)),
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

  Completer<GoogleMapController> _controller = Completer();

  GoogleMapController mapController;

  LatLng latLng = LatLng(
    40.380720 ,-102.164004
  );

  @override
  void initState() {
    super.initState();
    showProgress = true;
    getProperties('');

    if (widget.city == 'Yes') {
      print('City name Found ${widget.city}');
    } else {
      print('City does not Found');
      _getCurrentLocation();
    }
  }

  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

  _getCurrentLocation() {
    _checkGps();

    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position _position) {
      if (_position != null) {
        setState(() {
          latLng = LatLng(
            _position.latitude,
            _position.longitude,
          );
          print('latitude: ${latLng.latitude} Longitude: ${latLng.longitude}');

          mapController.animateCamera(CameraUpdate.newCameraPosition(
            CameraPosition(
                target: LatLng(
                  latLng.latitude,
                  latLng.longitude,
                ),
                zoom: 12,
                bearing: 45.0,
                tilt: 45.0),
          ));
        });
      }
    }).catchError((e) {
      print(e);
    });
  }

  Future _checkGps() async {
    if (!(await Geolocator().isLocationServiceEnabled())) {
      if (Theme.of(context).platform == TargetPlatform.android) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Can't get current location"),
              content:
                  const Text('Please make sure you enable GPS and try again'),
              actions: <Widget>[
                FlatButton(
                  child: Text('Ok'),
                  onPressed: () {
                    final AndroidIntent intent = AndroidIntent(
                        action: 'android.settings.LOCATION_SOURCE_SETTINGS');

                    intent.launch();
                    Navigator.of(context, rootNavigator: true).pop();
                  },
                ),
              ],
            );
          },
        );
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Can't get current location"),
              content:
                  const Text('Please make sure you enable GPS and try again'),
              actions: <Widget>[
                FlatButton(
                  child: Text('Ok'),
                  onPressed: () async {
                    if (!(await Geolocator().isLocationServiceEnabled())) {
                      AppSettings.openLocationSettings();
                    } else {
                      setState(() {
                        int count = 0;
                        Navigator.of(context).popUntil((_) => count++ >= 2);
                      });
                    }
                  },
                ),
              ],
            );
          },
        );
      }
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            DefaultTabController(
              length: 2,
              child: Scaffold(
                appBar: new AppBar(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
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
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                PageRouteBuilder(
                                    transitionDuration: Duration(seconds: 1),
                                    pageBuilder: (_, __, ___) =>
                                        SearchScreen()));
                          },
                          child: Container(child: Text('Filter'))),
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
                              insets: EdgeInsets.only(
                                  left: 0, right: 8, bottom: 4)),
                          isScrollable: true,
                          tabs: _tabs
                              .map((label) => Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                          child: showProgress == true
                              ? Row(
                                  children: <Widget>[
                                    SizedBox(
                                      child: CircularProgressIndicator(
                                        backgroundColor: Colors.white,
                                      ),
                                      height: 20.0,
                                      width: 20.0,
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Text('Searching',
                                        style: TextStyle(
                                          fontSize: 17.0,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                        ))
                                  ],
                                )
                              : Text(
                                  '${list.length} Results',
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
                    Stack(
                      children: <Widget>[
                        Container(
                          child: GoogleMap(
                            onCameraIdle: () {
                              if(widget.city=='No'){
                              print('camera idel now ${widget.url}');
                              setState(() {
                                showProgress = true;
                                postFix = '';
                                postFix =
                                    '&latitude=$newLat&longitude=$newLong';
                                list.clear();
                                getProperties(postFix);
                              });
                              }
                            },
                            onCameraMove: (cPosition) {
                              if(widget.city=='No'){
                                LatLng newLatLong = cPosition.target;
                                newLat = newLatLong.latitude;
                                newLong = newLatLong.longitude;

                                print(
                                    'new lat ${newLatLong.latitude} long ${newLatLong.longitude}');
                              }
                              
                            },
                            onMapCreated: _onMapCreated,
                            initialCameraPosition: CameraPosition(
                              target: latLng,
                              zoom: 3.0,
                            ),
                            markers: Set<Marker>.of(markers.values),
                          ),
                        ),
                        showNoDataFound == true
                            ? Positioned(
                                child: Container(
                                  height: 60.0,
                                  width: MediaQuery.of(context).size.width,
                                  color: Theme.of(context).accentColor,
                                  child: Center(
                                      child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        'No Data found',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18.0),
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      Text(
                                        'Change location OR Set Filter',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15.0),
                                      ),
                                    ],
                                  )),
                                ),
                              )
                            : Text(''),
                      ],
                    ),
                    PropertyListScreen(
                      list: list,
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () async {
                    print('saved');
                    _displayDialog(context);
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: Colors.black,
                            width: 0,
                          )),
                      height: 40.0,
                      width: 100.0,
                      alignment: Alignment.center,
                      child: Text(
                        'Save',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 19.0,
                            fontWeight: FontWeight.bold),
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String postFix = '';

  Future<String> getProperties(String post) async {
    print('========= post fix ===========$post');
    String mainURL = widget.url + post;
    print('========= Main URL ===========$mainURL');
    var response = await http.get(mainURL);

    if (mounted) {
      setState(() {
        dynamic data = json.decode(response.body)['data'];

        if (response.statusCode == 200 && data != null) {
          showNoDataFound = false;
          list = (data as List)
              .map((data) => new Property.fromJson(data))
              .toList();

          String firstname = list[0].property_latitude;
          print('All Shops: $firstname');

          _add(list);

          if (list[0].property_latitude != '' && widget.city=='Yes' && mapController!=null) {
            mapController.animateCamera(CameraUpdate.newCameraPosition(
              CameraPosition(
                  target: LatLng(
                    double.parse(list[0].property_latitude),
                    double.parse(list[0].property_longitude),
                  ),
                  zoom: 12,
                  bearing: 45.0,
                  tilt: 45.0),
            ));
          }

          showProgress = false;
          //showNoDataFound = false;
        } else {
          list.clear();
          showNoDataFound = true;
          showProgress = false;
          markers.clear();

          // print('Moving map to: LAT 37.0902');
          // if (mapController!=null) {
          //   mapController.animateCamera(CameraUpdate.newCameraPosition(
          //     CameraPosition(
          //         target: LatLng(
          //           40.380720,
          //           -102.164004,
          //         ),
          //         zoom: 3,
          //        ),
          //   ));
          // }


        }
      });
    }

//    print(data[1]["name"]);

//    showSpinner = false;
    return "Success!";
  }

  _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Name Your Search'),
            content: TextField(
              onChanged: (val) {
                savedSearchName = val;
              },
              controller: _textFieldController,
              decoration: InputDecoration(hintText: "Enter a name"),
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text('Ok'),
                onPressed: () async {
                  var now = new DateTime.now();
                  String formattedDate = DateFormat('dd/MM/yyyy').format(now);
                  print('Entred name: ${formattedDate}');

                  var savedSearchModel = SavedSearchModel();

                  savedSearchModel.url = widget.url;
                  savedSearchModel.name = savedSearchName;
                  savedSearchModel.date = formattedDate;
                  savedSearchModel.filters =
                      widget.filters == 0 ? 'No Filters' : 'Filter Included';
                  savedSearchModel.is_map_included = '1';
//
                  await DBProvider.db.insertSearch(savedSearchModel);
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
}
