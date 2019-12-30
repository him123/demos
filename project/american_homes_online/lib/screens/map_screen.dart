import 'dart:async';

import 'package:american_homes_online/model/property.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'dart:convert';

class MapScreen extends StatefulWidget {
  static const LatLng _center = const LatLng(23.0225, 72.5714);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  bool showSpinner = false;
  List<Property> list = List();
  final Set<Marker> _markers = {};
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{}; // CLASS MEMBER, MAP OF MARKS
  Completer<GoogleMapController> _controller = Completer();


  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  void _add() {
    var markerIdVal = '65465';
    final MarkerId markerId = MarkerId(markerIdVal);

    // creating a new MARKER
    final Marker marker = Marker(
      markerId: markerId,
      position: LatLng(23.0225, 72.5714),
      infoWindow: InfoWindow(title: markerIdVal, snippet: '*'),
      onTap: () {
//        _onMarkerTapped(markerId);
      },
    );

    setState(() {
      // adding a new marker to map
      markers[markerId] = marker;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _add();
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.normal,
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(
        target: MapScreen._center,
        zoom: 11.0,

      ),
      markers: Set<Marker>.of(markers.values),
    );
  }

  Future<String> getAgents() async {
    print('========= Property called ===========');
    var response = await http.get(
        'https://americanhomesonline.com/wp-json/api/v1/All_Property/?secret_key=yQTTspWXd530xNAEnBKkMFNFuBbKG6kd');

    this.setState(() {
      dynamic data = json.decode(response.body)['data'];

      if (response.statusCode == 200) {
        list = (data as List).map((data) => new Property.fromJson(data)).toList();

        String firstname = list[0].property_latitude;
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
