import 'dart:async';

import 'package:american_homes_online/components/database_util.dart';
import 'package:american_homes_online/constants/constants.dart';
import 'package:american_homes_online/model/property.dart';
import 'package:american_homes_online/model/saved_search.dart';
import 'package:american_homes_online/screens/property_list_screen.dart';
import 'package:american_homes_online/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'dart:convert';

import 'package:rflutter_alert/rflutter_alert.dart';

class MapSearchScreen extends StatefulWidget {
  static String id = 'MapSearchScreen';
  final String url;
  final int filters;

  MapSearchScreen({this.url, this.filters});

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
  Completer<GoogleMapController> _controller = Completer();

  CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(42.2814681, -71.09566540000003),
    zoom: 5.0,
  );

  Map<MarkerId, Marker> markers =
      <MarkerId, Marker>{}; // CLASS MEMBER, MAP OF MARKS
  String savedSearchName = '';

  void _add(List<Property> list) {
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProperties();
    print('Check filter: ${widget.filters}');
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
                          child: list.length == 0
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
                    GoogleMap(
                      mapType: MapType.normal,
                      initialCameraPosition: _kGooglePlex,
                      onMapCreated: (GoogleMapController controller) {
                        _controller.complete(controller);
                      },
                      markers: Set<Marker>.of(markers.values),
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

//                    await DBProvider.db.insertSearch('https://americanhomesonline.com/wp-json/api/v1/All_Property/?secret_key=yQTTspWXd530xNAEnBKkMFNFuBbKG6kd',
//                    '1', '12/21/2020','1');
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

  Future<String> getProperties() async {
    print('========= Property called ===========${widget.url}');
    var response = await http.get(widget.url);

    if (mounted) {
      setState(() {
        dynamic data = json.decode(response.body)['data'];

        if (response.statusCode == 200 && data!=null) {
          list = (data as List)
              .map((data) => new Property.fromJson(data))
              .toList();

          String firstname = list[0].property_latitude;
          print('All Shops: $firstname');

          _add(list);

          setState(() {
//            showSpinner = false;

            _kGooglePlex = CameraPosition(
              target: LatLng(double.parse(list[0].property_latitude),
                  double.parse(list[0].property_longitude)),
              zoom: 14.4746,
            );
          });
        } else {
          Alert(
            context: context,
//      type: AlertType.info,
            title: 'No Data Found on this filter',
//      desc: msg,
            buttons: [
              DialogButton(
                child: Text(
                  "OK",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () => Navigator.pop(context),
                width: 120,
              )
            ],
          ).show();
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
