import 'dart:convert';

import 'package:american_homes_online/model/property_model.dart';
import 'package:american_homes_online/screens/successfully_property_added.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

const String addPropertyURL =
    'https://americanhomesonline.com/wp-json/api/v1/Add_Property/?secret_key=yQTTspWXd530xNAEnBKkMFNFuBbKG6kd';

class AddPropertyAmenities extends StatefulWidget {
  const AddPropertyAmenities({
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
  _AddPropertyAmenitiesState createState() => _AddPropertyAmenitiesState();
}

class _AddPropertyAmenitiesState extends State<AddPropertyAmenities> {
  bool Attic = false,
      dishwasher = false,
      basketballCourt = false,
      loft = false,
      oceanView = false,
      cac = false,
      decl = false,
      fencedyard = false,
      balcon7patlo = false,
      backyarrd = false,
      washerdryer = false,
      frontyard = false,
      wineceller = false,
      furnished = false,
      tenniscourt = false,
      swimmingpool = false,
      lakeview = false,
      ac = false,
      fireplaces = false;

  bool ageRestricted = false,
      clubhouse = false,
      golf = false,
      fitnessCenter = false,
      gated = false,
      comminityPool = false,
      gaurdGated = false,
      tennis = false;

  bool cats = false, dogs = false;

  bool carpet = false,
      caremic = false,
      granite = false,
      marble = false,
      parquet = false,
      porcelaiin = false,
      vinyl = false,
      wood = false;

  bool uac = false,
      ucac = false,
      electricity = false,
      gas = false,
      heat = false,
      trash = false,
      water = false;
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: ListView(
        children: <Widget>[
          /*Listing Details*/ Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                    width: 2.0, color: Theme.of(context).primaryColor),
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
                            'Amenities and Features',
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
                            'Select what features and amenities apply for your property.',
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
                  /*Amenities*/ Container(
                      width: 400.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Checkbox(
                                    onChanged: (val) {
                                      print('onCnahged $val');
                                      setState(() {
                                        Attic = val;
                                      });
                                    },
                                    value: Attic,
                                  ),
                                  Text('Attic'),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Checkbox(
                                    onChanged: (val) {
                                      print('onCnahged $val');
                                      setState(() {
                                        basketballCourt = val;
                                      });
                                    },
                                    value: basketballCourt,
                                  ),
                                  Text('Basketball Court'),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Checkbox(
                                    onChanged: (val) {
                                      print('onCnahged $val');
                                      setState(() {
                                        oceanView = val;
                                      });
                                    },
                                    value: oceanView,
                                  ),
                                  Text('Ocean View'),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Checkbox(
                                    onChanged: (val) {
                                      print('onCnahged $val');
                                      setState(() {
                                        decl = val;
                                      });
                                    },
                                    value: decl,
                                  ),
                                  Text('Deck'),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Checkbox(
                                    onChanged: (val) {
                                      print('onCnahged $val');
                                      setState(() {
                                        balcon7patlo = val;
                                      });
                                    },
                                    value: balcon7patlo,
                                  ),
                                  Text('Balcony/Patio'),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Checkbox(
                                    onChanged: (val) {
                                      print('onCnahged $val');
                                      setState(() {
                                        washerdryer = val;
                                      });
                                    },
                                    value: washerdryer,
                                  ),
                                  Text('Washer Dryer'),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Checkbox(
                                    onChanged: (val) {
                                      print('onCnahged $val');
                                      setState(() {
                                        wineceller = val;
                                      });
                                    },
                                    value: wineceller,
                                  ),
                                  Text('Wine Cellar'),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Checkbox(
                                    onChanged: (val) {
                                      print('onCnahged $val');
                                      setState(() {
                                        tenniscourt = val;
                                      });
                                    },
                                    value: tenniscourt,
                                  ),
                                  Text('Tennis Court'),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Checkbox(
                                    onChanged: (val) {
                                      print('onCnahged $val');
                                      setState(() {
                                        lakeview = val;
                                      });
                                    },
                                    value: lakeview,
                                  ),
                                  Text('Lake View'),
                                ],
                              ),
                              SizedBox(
                                height: 40.0,
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Checkbox(
                                    onChanged: (val) {
                                      print('onCnahged $val');
                                      setState(() {
                                        dishwasher = val;
                                      });
                                    },
                                    value: dishwasher,
                                  ),
                                  Text('Dishwasher'),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Checkbox(
                                    onChanged: (val) {
                                      print('onCnahged $val');
                                      setState(() {
                                        loft = val;
                                      });
                                    },
                                    value: loft,
                                  ),
                                  Text('Loft'),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Checkbox(
                                    onChanged: (val) {
                                      print('onCnahged $val');
                                      setState(() {
                                        cac = val;
                                      });
                                    },
                                    value: cac,
                                  ),
                                  Text('C/AC'),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Checkbox(
                                    onChanged: (val) {
                                      print('onCnahged $val');
                                      setState(() {
                                        fencedyard = val;
                                      });
                                    },
                                    value: fencedyard,
                                  ),
                                  Text('Fenced Yard'),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Checkbox(
                                    onChanged: (val) {
                                      print('onCnahged $val');
                                      setState(() {
                                        backyarrd = val;
                                      });
                                    },
                                    value: backyarrd,
                                  ),
                                  Text('Backyard'),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Checkbox(
                                    onChanged: (val) {
                                      print('onCnahged $val');
                                      setState(() {
                                        frontyard = val;
                                      });
                                    },
                                    value: frontyard,
                                  ),
                                  Text('Front Yard'),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Checkbox(
                                    onChanged: (val) {
                                      print('onCnahged $val');
                                      setState(() {
                                        furnished = val;
                                      });
                                    },
                                    value: furnished,
                                  ),
                                  Text('Furnished'),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Checkbox(
                                    onChanged: (val) {
                                      print('onCnahged $val');
                                      setState(() {
                                        swimmingpool = val;
                                      });
                                    },
                                    value: swimmingpool,
                                  ),
                                  Text('Swimming pool'),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Checkbox(
                                    onChanged: (val) {
                                      print('onCnahged $val');
                                      setState(() {
                                        ac = val;
                                      });
                                    },
                                    value: ac,
                                  ),
                                  Text('A/C'),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Checkbox(
                                    onChanged: (val) {
                                      print('onCnahged $val');
                                      setState(() {
                                        fireplaces = val;
                                      });
                                    },
                                    value: fireplaces,
                                  ),
                                  Text('Fireplaces'),
                                ],
                              ),
                            ],
                          )
                        ],
                      )),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    width: double.infinity,
                  )
                ],
              ),
            ),
          ),
          /*Community Amenities*/ Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                    width: 2.0, color: Theme.of(context).primaryColor),
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
                            'Community Amenities',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  /*Amenities*/ Container(
                      width: 400.0,
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Checkbox(
                                    onChanged: (val) {
                                      print('onCnahged $val');
                                      setState(() {
                                        ageRestricted = val;
                                      });
                                    },
                                    value: ageRestricted,
                                  ),
                                  Text('Age Restricted'),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Checkbox(
                                    onChanged: (val) {
                                      print('onCnahged $val');
                                      setState(() {
                                        clubhouse = val;
                                      });
                                    },
                                    value: clubhouse,
                                  ),
                                  Text('Club House'),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Checkbox(
                                    onChanged: (val) {
                                      print('onCnahged $val');
                                      setState(() {
                                        fitnessCenter = val;
                                      });
                                    },
                                    value: fitnessCenter,
                                  ),
                                  Text('Fitness Center'),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Checkbox(
                                    onChanged: (val) {
                                      print('onCnahged $val');
                                      setState(() {
                                        gated = val;
                                      });
                                    },
                                    value: gated,
                                  ),
                                  Text('Gated'),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Checkbox(
                                    onChanged: (val) {
                                      print('onCnahged $val');
                                      setState(() {
                                        gaurdGated = val;
                                      });
                                    },
                                    value: gaurdGated,
                                  ),
                                  Text('Guard Gated'),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Checkbox(
                                    onChanged: (val) {
                                      print('onCnahged $val');
                                      setState(() {
                                        tennis = val;
                                      });
                                    },
                                    value: tennis,
                                  ),
                                  Text('Tennis'),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Checkbox(
                                    onChanged: (val) {
                                      print('onCnahged $val');
                                      setState(() {
                                        comminityPool = val;
                                      });
                                    },
                                    value: comminityPool,
                                  ),
                                  Text('Community Pool'),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Checkbox(
                                    onChanged: (val) {
                                      print('onCnahged $val');
                                      setState(() {
                                        golf = val;
                                      });
                                    },
                                    value: golf,
                                  ),
                                  Text('Golf'),
                                ],
                              ),
                            ],
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    width: double.infinity,
                  )
                ],
              ),
            ),
          ),
          /*Pets Allowed*/ Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                    width: 2.0, color: Theme.of(context).primaryColor),
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
                            'Pets Allowed',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  /*Amenities*/ Container(
                      width: 400.0,
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Checkbox(
                                    onChanged: (val) {
                                      print('onCnahged $val');
                                      setState(() {
                                        cats = val;
                                      });
                                    },
                                    value: cats,
                                  ),
                                  Text('Cats'),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Checkbox(
                                    onChanged: (val) {
                                      print('onCnahged $val');
                                      setState(() {
                                        dogs = val;
                                      });
                                    },
                                    value: dogs,
                                  ),
                                  Text('Dogs'),
                                ],
                              ),
                            ],
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    width: double.infinity,
                  )
                ],
              ),
            ),
          ),
          /*Flooring Type*/ Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                    width: 2.0, color: Theme.of(context).primaryColor),
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
                            'Flooring Type',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  /*Amenities*/ Container(
                      width: 400.0,
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Checkbox(
                                    onChanged: (val) {
                                      print('onCnahged $val');
                                      setState(() {
                                        carpet = val;
                                      });
                                    },
                                    value: carpet,
                                  ),
                                  Text('Carpet'),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Checkbox(
                                    onChanged: (val) {
                                      print('onCnahged $val');
                                      setState(() {
                                        caremic = val;
                                      });
                                    },
                                    value: caremic,
                                  ),
                                  Text('Ceramic'),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Checkbox(
                                    onChanged: (val) {
                                      print('onCnahged $val');
                                      setState(() {
                                        granite = val;
                                      });
                                    },
                                    value: granite,
                                  ),
                                  Text('Granite'),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Checkbox(
                                    onChanged: (val) {
                                      print('onCnahged $val');
                                      setState(() {
                                        marble = val;
                                      });
                                    },
                                    value: marble,
                                  ),
                                  Text('Marble'),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Checkbox(
                                    onChanged: (val) {
                                      print('onCnahged $val');
                                      setState(() {
                                        parquet = val;
                                      });
                                    },
                                    value: parquet,
                                  ),
                                  Text('Parquet'),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Checkbox(
                                    onChanged: (val) {
                                      print('onCnahged $val');
                                      setState(() {
                                        porcelaiin = val;
                                      });
                                    },
                                    value: porcelaiin,
                                  ),
                                  Text('Porcelain'),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Checkbox(
                                    onChanged: (val) {
                                      print('onCnahged $val');
                                      setState(() {
                                        vinyl = val;
                                      });
                                    },
                                    value: vinyl,
                                  ),
                                  Text('Vinyl'),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Checkbox(
                                    onChanged: (val) {
                                      print('onCnahged $val');
                                      setState(() {
                                        wood = val;
                                      });
                                    },
                                    value: wood,
                                  ),
                                  Text('Wood'),
                                ],
                              ),
                            ],
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    width: double.infinity,
                  )
                ],
              ),
            ),
          ),
          /*Utility Amenities*/ Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                    width: 2.0, color: Theme.of(context).primaryColor),
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
                            'Utility Amenities',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  /*Amenities*/ Container(
                      width: 400.0,
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Checkbox(
                                    onChanged: (val) {
                                      print('onCnahged $val');
                                      setState(() {
                                        uac = val;
                                      });
                                    },
                                    value: uac,
                                  ),
                                  Text('A/C'),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Checkbox(
                                    onChanged: (val) {
                                      print('onCnahged $val');
                                      setState(() {
                                        ucac = val;
                                      });
                                    },
                                    value: ucac,
                                  ),
                                  Text('C A/C'),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Checkbox(
                                    onChanged: (val) {
                                      print('onCnahged $val');
                                      setState(() {
                                        electricity = val;
                                      });
                                    },
                                    value: electricity,
                                  ),
                                  Text('Electricity'),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Checkbox(
                                    onChanged: (val) {
                                      print('onCnahged $val');
                                      setState(() {
                                        gas = val;
                                      });
                                    },
                                    value: gas,
                                  ),
                                  Text('Gas'),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Checkbox(
                                    onChanged: (val) {
                                      print('onCnahged $val');
                                      setState(() {
                                        heat = val;
                                      });
                                    },
                                    value: heat,
                                  ),
                                  Text('Heat'),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Checkbox(
                                    onChanged: (val) {
                                      print('onCnahged $val');
                                      setState(() {
                                        trash = val;
                                      });
                                    },
                                    value: trash,
                                  ),
                                  Text('Trash'),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Checkbox(
                                    onChanged: (val) {
                                      print('onCnahged $val');
                                      setState(() {
                                        water = val;
                                      });
                                    },
                                    value: water,
                                  ),
                                  Text('Water'),
                                ],
                              ),
                            ],
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 20.0,
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
                      3, 'This is title of property', widget.propertyModel);
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
                  setState(() {
                    showSpinner = true;
                  });
                  createPostReqAddProperty(context, addPropertyURL);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    alignment: Alignment.center,
                    width: 150.0,
                    height: 40.0,
                    color: Colors.red,
                    child: Text('Submit Property',
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
      ),
    );
  }

  void createPostReqAddProperty(BuildContext context, String url) async {
    print(url);
//    var request = http.MultipartRequest('POST', Uri.parse(url));
    var map = new Map<String, dynamic>();

//    if (_imageFile != null) {
//      var stream =
//      new http.ByteStream(DelegatingStream.typed(_imageFile.openRead()));
//      final length = await _imageFile.length();
//      var multiPartImage = http.MultipartFile('upload_img', stream, length,
//          filename: basename(_imageFile.path));
//      request.files.add(multiPartImage);
//    }

    print('This is user id: ${widget.propertyModel.toMap()}');

    map['user_id'] = widget.propertyModel.user_id;
    map['property_title'] = widget.propertyModel.property_title;
    map['property_description'] =
        widget.propertyModel.property_description;
    map['property_price'] = widget.propertyModel.property_price;
    map['prop_category'] = widget.propertyModel.prop_category;
    map['prop_action_category'] =
        widget.propertyModel.prop_action_category;
    map['property_status'] = widget.propertyModel.property_status;
    map['property_taxes'] = widget.propertyModel.property_taxes;
    map['property_maintenance'] =
        widget.propertyModel.property_maintenance;

//    map['attached'] = widget.propertyModel.attached;
    map['attachid'] = widget.propertyModel.attachid;
    map['attachthumb'] = widget.propertyModel.attachthumb;
    map['embed_video_type'] = widget.propertyModel.embed_video_type;
    map['embed_video_id'] = widget.propertyModel.embed_video_id;
    map['embed_virtual_tour'] =
        widget.propertyModel.embed_virtual_tour;

    map['property_address'] = widget.propertyModel.property_address;
    map['property_county'] = widget.propertyModel.property_country;
    map['property_city'] = widget.propertyModel.property_city;
    map['property_area'] = widget.propertyModel.property_area;
    map['property_zip'] = widget.propertyModel.property_zip;
    map['property_country'] = widget.propertyModel.property_country;
    map['google_camera_angle'] =
        widget.propertyModel.google_camera_angle;
    map['property_google_view'] =
        widget.propertyModel.property_google_view;
    map['property_latitude'] =
        widget.propertyModel.property_latitude;
    map['property_longitude'] =
        widget.propertyModel.property_longitude;

    map['property_size'] = widget.propertyModel.property_size;
    map['property_lot_size'] =
        widget.propertyModel.property_lot_size;
    map['property_rooms'] = widget.propertyModel.property_rooms;
    map['property_bedrooms'] =
        widget.propertyModel.property_bedrooms;
    map['property_bathrooms'] =
        widget.propertyModel.property_bathrooms;
    map['property_year'] = widget.propertyModel.property_year;
    map['property_garage'] = widget.propertyModel.property_garage;
    map['property_garage_size'] =
        widget.propertyModel.property_garage_size;
    map['property_date'] = widget.propertyModel.property_date;
    map['property_basement'] =
        widget.propertyModel.property_basement;
    map['property_external_construction'] =
        widget.propertyModel.property_external_construction;
    map['exterior_material'] =
        widget.propertyModel.exterior_material;
    map['property_roofing'] = widget.propertyModel.property_roofing;
    map['stories_number'] = widget.propertyModel.stories_number;
    map['owner_notes'] = widget.propertyModel.owner_notes;

    map['attic'] = Attic.toString();
    map['wine_cellar'] = wineceller.toString();
    map['fenced_yard'] = fencedyard.toString();
    map['basketball_court'] = basketballCourt.toString();
    map['tennis_court'] = tenniscourt.toString();
    map['backyard'] = backyarrd.toString();
    map['ocean_view'] = oceanView.toString();
    map['lake_view'] = lakeview.toString();
    map['front_yard'] = frontyard.toString();
    map['deck'] = decl.toString();
    map['dishwasher'] = dishwasher.toString();
    map['furnished'] = furnished.toString();
    map['balcony-patio'] = balcon7patlo.toString();
    map['loft'] = loft.toString();
    map['swimming_pool'] = swimmingpool.toString();
    map['washer_dryer'] = washerdryer.toString();
    map['c-ac'] = cac.toString();
    map['a-c'] = ac.toString();
    map['fireplace'] = fireplaces.toString();

    map['age-restricted'] = ageRestricted.toString();
    map['club-house'] = clubhouse.toString();
    map['community-pool'] = comminityPool.toString();
    map['fitness-center'] = fitnessCenter.toString();
    map['gated'] = gated.toString();
    map['golf'] = golf.toString();
    map['guard-gated'] = gaurdGated.toString();
    map['tennis'] = tennis.toString();

    map['cats'] = cats.toString();
    map['dogs'] = dogs.toString();

    map['carpet'] = carpet.toString();
    map['ceramic'] = caremic.toString();
    map['granite'] = granite.toString();
    map['marble'] = marble.toString();
    map['parquet'] = parquet.toString();
    map['porcelain'] = porcelaiin.toString();
    map['vinyl'] = vinyl.toString();
    map['wood'] = wood.toString();

    map['a-c'] = uac.toString();
    map['c-a-c'] = ucac.toString();
    map['electricity'] = electricity.toString();
    map['gas'] = gas.toString();
    map['heat'] = heat.toString();
    map['trash'] = trash.toString();
    map['water'] = water.toString();

    print('Request: ${map.toString()}');

    var response = await post(Uri.parse(url),

        body: map,
        );

    print('Response: ${response.body}');
    dynamic data = json.decode(response.body)['data'];

    setState(() {
      showSpinner=false;
      if (data['api_status'] == 1) {
        Navigator.push(
            context,
            new MaterialPageRoute(
              builder: (ctxt) => new SuccessScreen(),
            ));
      } else {
        showAlert(context, data['message']);
      }
    });

  }

  void showAlert(BuildContext context, String msg) {
    Alert(
      context: context,
//      type: AlertType.info,
      title: msg,
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
}
