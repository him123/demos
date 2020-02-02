import 'dart:async';

import 'package:american_homes_online/model/property_model.dart';
import 'package:american_homes_online/screens/get_current_location.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddPropertyLocation extends StatefulWidget {
  const AddPropertyLocation({
    @required this.data,
    @required this.str,
    @required this.propertyModel,
    @required this.onDataChange,
    Key key,
  }) : super(key: key);

  final int data;
  final String str;
  final PropertyModel propertyModel;
  final Function(int, String, PropertyModel) onDataChange;

  @override
  _AddPropertyLocationState createState() => _AddPropertyLocationState();
}

class _AddPropertyLocationState extends State<AddPropertyLocation> {
  Completer<GoogleMapController> _controller = Completer();
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  final formKey = GlobalKey<FormState>();
  static CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(42.2814681, -71.09566540000003),
    zoom: 5.0,
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print('I got from first ${widget.propertyModel.property_title}');
    print('I got from first ${widget.propertyModel.attached}');
  }

  String property_address = '',
      property_county = '',
      property_city = '',
      property_area = '',
      property_zip = '',
      property_country = '',
      google_camera_angle = '',
      property_google_view = '',
      property_latitude = '',
      property_longitude = '';

  bool isEnable = false;

  LatLng selectedLatLng = LatLng(
    0.0,
    0.0,
  );
  List<Marker> allMarker = [];
  GoogleMapController mapController;
  TextEditingController latitudeController= TextEditingController();
  TextEditingController longitudeController= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      key: formKey,
      children: <Widget>[
        /*Listing Location*/ Padding(
          padding: EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              border:
                  Border.all(width: 2.0, color: Theme.of(context).primaryColor),
            ),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Listing Location',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Use the button to save your property location on the map as well.',
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                /*FIRST NAME*/ Container(
                    width: 300.0,
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: 350.0,
                          height: 40.0,
                          child: TextFormField(
                            onChanged: (val) {
                              property_address = val;
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                filled: true,
                                labelText: '*Address',
                                fillColor: Colors.white),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              width: 140.0,
                              height: 40.0,
                              child: TextFormField(
                                onChanged: (val) {
                                  property_county = val;
                                },
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    filled: true,
                                    labelText: 'County / State',
                                    fillColor: Colors.white),
                              ),
                            ),
                            Container(
                              width: 140.0,
                              height: 40.0,
                              child: TextFormField(
                                onChanged: (val) {
                                  property_city = val;
                                },
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    filled: true,
                                    labelText: 'City',
                                    fillColor: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          width: 350.0,
                          height: 40.0,
                          child: TextFormField(
//                      controller: titleController,
                            onChanged: (val) {
                              property_area = val;
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                filled: true,
                                labelText: 'Neighborhood',
                                fillColor: Colors.white),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          width: 350.0,
                          height: 40.0,
                          child: TextFormField(
//                      controller: titleController,
                            onChanged: (val) {
                              property_zip = val;
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                filled: true,
                                labelText: 'Zip',
                                fillColor: Colors.white),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          width: 350.0,
                          height: 40.0,
                          child: TextFormField(
                            onChanged: (val) {
                              property_country = val;
                            },
//                      controller: titleController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                filled: true,
                                labelText: 'Country',
                                fillColor: Colors.white),
                          ),
                        ),
                      ],
                    )),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  height: 200.0,
                  child: Hero(
                    tag: 'gmap',
                    child: GoogleMap(
                      onTap: (val) async {
                        final result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => GetCurrentLocation(),
                            ));

                        setState(() {
                          if (result != null) {
                            print('coming: $result');
                            selectedLatLng = result;

                            latitudeController.text = selectedLatLng.latitude.toString();
                            longitudeController.text=selectedLatLng.longitude.toString();

                            print('position should change');
                            mapController
                                .animateCamera(CameraUpdate.newCameraPosition(
                              CameraPosition(
                                  target: LatLng(
                                    selectedLatLng.latitude,
                                    selectedLatLng.longitude,
                                  ),
                                  zoom: 12,
                                  bearing: 45.0,
                                  tilt: 45.0),
                            ));

                            allMarker.add(Marker(
                                markerId: MarkerId('MyMarker'),
                                onDragEnd: (latLang) {
                                  print(latLang);
                                  selectedLatLng = latLang;
                                },
                                draggable: true,
                                position: LatLng(
                                  selectedLatLng.latitude,
                                  selectedLatLng.longitude,
                                )));
                          }
                        });
                      },
                      scrollGesturesEnabled: true,
                      mapType: MapType.normal,
                      initialCameraPosition: _kGooglePlex,
                      onMapCreated: (GoogleMapController controller) {
                        _controller.complete(controller);
                        mapController = controller;
                      },
                      markers: Set.from(allMarker),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text('Please tap on map to select Location', style: TextStyle(fontWeight: FontWeight.w900, color: Colors.red),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Flexible(
                        child: Container(
                          width: 350.0,
                          height: 40.0,
                          child: TextFormField(
                            onChanged: (val) {
                              property_latitude = val;
                            },
                            controller: latitudeController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                filled: true,
                                labelText: 'Latitude',
                                fillColor: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5.3,
                      ),
                      Flexible(
                        child: Container(
                          width: 350.0,
                          height: 40.0,
                          child: TextFormField(
                            controller: longitudeController,
                            onChanged: (val) {
                              property_longitude = val;
                            },
//                      controller: titleController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                filled: true,
                                labelText: 'Longitude',
                                fillColor: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: 10.0, left: 8.0, right: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Flexible(
                        child: Container(
                          width: 350.0,
                          height: 40.0,
                          child: Row(
                            children: <Widget>[
                              Checkbox(
                                onChanged: (val) {
                                  isEnable = val;
                                },
                                value: isEnable,
                              ),
                              Text(
                                'Google Street View',
                                style: TextStyle(fontSize: 11.0),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5.3,
                      ),
                      Flexible(
                        child: Container(
                          width: 350.0,
                          height: 40.0,
                          child: TextFormField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                filled: true,
                                labelText: 'Camera Angle (value from 0 to 360)',
                                fillColor: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                )
              ],
            ),
          ),
        ),
        /*NEXT*/ Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            InkWell(
              onTap: () {
                widget.onDataChange(
                    1, 'This is title of property', widget.propertyModel);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.center,
                  width: 150.0,
                  height: 40.0,
                  color: Colors.red,
                  child: Text('Previous',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 16.0)),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                widget.propertyModel.property_address = property_address;
                widget.propertyModel.property_county = property_county;
                widget.propertyModel.property_city = property_city;
                widget.propertyModel.property_area = property_area;
                widget.propertyModel.property_zip = property_zip;
                widget.propertyModel.property_country = property_country;
                widget.propertyModel.google_camera_angle = google_camera_angle;
                widget.propertyModel.property_google_view =
                    property_google_view;
                widget.propertyModel.property_latitude = latitudeController.text;
                widget.propertyModel.property_longitude = longitudeController.text;

                print('latitude: ${longitudeController.text}');

                widget.onDataChange(
                    3, 'This is title of property', widget.propertyModel);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.center,
                  width: 150.0,
                  height: 40.0,
                  color: Colors.red,
                  child: Text('Next',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 16.0)),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
