import 'dart:async';

import 'package:android_intent/android_intent.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class GetCurrentLocation extends StatefulWidget {
  @override
  _GetCurrentLocationState createState() => _GetCurrentLocationState();
}

class _GetCurrentLocationState extends State<GetCurrentLocation> {
  Completer<GoogleMapController> _controller = Completer();

  static LatLng latLng = LatLng(
    0.0,
    0.0,
  );

  LatLng selectedLatLng = LatLng(
    0.0,
    0.0,
  );

  @override
  void initState() {
    super.initState();
//    getLocation();
    _getCurrentLocation();

  }

  List<Marker> allMarker = [];
  GoogleMapController mapController;

  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

  _getCurrentLocation() {
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

          mapController.animateCamera(
              CameraUpdate.newCameraPosition(
                CameraPosition(
                    target: LatLng(
                      latLng.latitude,
                      latLng.longitude,
                    ),
                    zoom: 12,
                    bearing: 45.0,
                    tilt: 45.0
                ),
              ));

          allMarker.add(Marker(
              markerId: MarkerId('MyMarker'),
              onDragEnd: (latLang) {
                print(latLang);
                selectedLatLng = latLang;
              },
              draggable: true,
              position: latLng = LatLng(
                _position.latitude,
                _position.longitude,
              )));

        });
      }

    }).catchError((e) {
      print(e);
    });
  }

  Future<void> getLocation() async {
    PermissionStatus permission = await PermissionHandler()
        .checkPermissionStatus(PermissionGroup.location);
    if (permission == PermissionStatus.denied) {
      await PermissionHandler()
          .requestPermissions([PermissionGroup.locationAlways]);
    }

    var geolocator = Geolocator();
    GeolocationStatus geolocationStatus =
        await geolocator.checkGeolocationPermissionStatus();
    switch (geolocationStatus) {
      case GeolocationStatus.denied:
        print('denied');
        break;
      case GeolocationStatus.disabled:
      case GeolocationStatus.restricted:
        print('restricted');
        break;
      case GeolocationStatus.unknown:
        print('unknown');
        break;
      case GeolocationStatus.granted:
        _checkGps();
        await Geolocator()
            .getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
            .then((Position _position) {
          if (_position != null) {
            setState(() {
              latLng = LatLng(
                _position.latitude,
                _position.longitude,
              );
            });

            mapController.animateCamera(
                CameraUpdate.newCameraPosition(
              CameraPosition(
                  target: LatLng(
                    latLng.latitude,
                    latLng.longitude,
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
                position: latLng = LatLng(
                  _position.latitude,
                  _position.longitude,
                )));
          }
        });
        break;
    }
  }


  Future _checkGps() async {
    if (!(await Geolocator().isLocationServiceEnabled())) {
      if (Theme.of(context).platform == TargetPlatform.android) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Can't get gurrent location"),
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
      }
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          FlatButton(
              onPressed: () {
                print(selectedLatLng);
                Navigator.pop(context, selectedLatLng);
              },
              child: Text(
                'Apply',
                style: TextStyle(color: Colors.white, fontSize: 19.0),
              ))
        ],
        title: Text('Select Current Location'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Hero(
        tag: 'gmap',
        child: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: latLng,
            zoom: 11.0,
          ),
          markers: Set.from(allMarker),
        ),
      ),
    );
  }
}
