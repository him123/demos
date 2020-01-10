import 'dart:convert';

import 'package:american_homes_online/model/property_model.dart';
import 'package:american_homes_online/screens/successfully_property_added.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
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
                              SizedBox(height: 40.0,),
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
                    showSpinner=true;
                  });
                  createPostReqAddProperty(context,
                      'https://americanhomesonline.com/wp-json/api/v1/Add_Property/?secret_key=yQTTspWXd530xNAEnBKkMFNFuBbKG6kd');
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
    var request = http.MultipartRequest('POST', Uri.parse(url));

//    if (_imageFile != null) {
//      var stream =
//      new http.ByteStream(DelegatingStream.typed(_imageFile.openRead()));
//      final length = await _imageFile.length();
//      var multiPartImage = http.MultipartFile('upload_img', stream, length,
//          filename: basename(_imageFile.path));
//      request.files.add(multiPartImage);
//    }

    print('This is user id: ${widget.propertyModel.user_id}');

    request.fields['user_id'] = widget.propertyModel.user_id;
    request.fields['property_title'] = widget.propertyModel.property_title;
    request.fields['property_description'] =
        widget.propertyModel.property_description;
    request.fields['property_price'] = widget.propertyModel.property_price;
    request.fields['prop_category'] = widget.propertyModel.prop_category;
    request.fields['prop_action_category'] =
        widget.propertyModel.prop_action_category;
    request.fields['property_status'] = widget.propertyModel.property_status;
    request.fields['property_taxes'] = widget.propertyModel.property_taxes;
    request.fields['property_maintenance'] =
        widget.propertyModel.property_maintenance;

    request.fields['attached'] = widget.propertyModel.attached;
    request.fields['attachthumb'] = widget.propertyModel.attachthumb;
    request.fields['embed_video_type'] = widget.propertyModel.embed_video_type;
    request.fields['embed_video_id'] = widget.propertyModel.embed_video_id;
    request.fields['embed_virtual_tour'] =
        widget.propertyModel.embed_virtual_tour;

    request.fields['property_address'] = widget.propertyModel.property_address;
    request.fields['property_county'] = widget.propertyModel.property_country;
    request.fields['property_city'] = widget.propertyModel.property_city;
    request.fields['property_area'] = widget.propertyModel.property_area;
    request.fields['property_zip'] = widget.propertyModel.property_zip;
    request.fields['property_country'] = widget.propertyModel.property_country;
    request.fields['google_camera_angle'] =
        widget.propertyModel.google_camera_angle;
    request.fields['property_google_view'] =
        widget.propertyModel.property_google_view;
    request.fields['property_latitude'] =
        widget.propertyModel.property_latitude;
    request.fields['property_longitude'] =
        widget.propertyModel.property_longitude;

    request.fields['property_size'] = widget.propertyModel.property_size;
    request.fields['property_lot_size'] =
        widget.propertyModel.property_lot_size;
    request.fields['property_rooms'] = widget.propertyModel.property_rooms;
    request.fields['property_bedrooms'] =
        widget.propertyModel.property_bedrooms;
    request.fields['property_bathrooms'] =
        widget.propertyModel.property_bathrooms;
    request.fields['property_year'] = widget.propertyModel.property_year;
    request.fields['property_garage'] = widget.propertyModel.property_garage;
    request.fields['property_garage_size'] =
        widget.propertyModel.property_garage_size;
    request.fields['property_date'] = widget.propertyModel.property_date;
    request.fields['property_basement'] =
        widget.propertyModel.property_basement;
    request.fields['property_external_construction'] =
        widget.propertyModel.property_external_construction;
    request.fields['exterior_material'] =
        widget.propertyModel.exterior_material;
    request.fields['property_roofing'] = widget.propertyModel.property_roofing;
    request.fields['stories_number'] = widget.propertyModel.stories_number;
    request.fields['owner_notes'] = widget.propertyModel.owner_notes;

    request.fields['attic'] = Attic.toString();
    request.fields['wine_cellar'] = wineceller.toString();
    request.fields['fenced_yard'] = fencedyard.toString();
    request.fields['basketball_court'] = basketballCourt.toString();
    request.fields['tennis_court'] = tenniscourt.toString();
    request.fields['backyard'] = backyarrd.toString();
    request.fields['ocean_view'] = oceanView.toString();
    request.fields['lake_view'] = lakeview.toString();
    request.fields['front_yard'] = frontyard.toString();
    request.fields['deck'] = decl.toString();
    request.fields['dishwasher'] = dishwasher.toString();
    request.fields['furnished'] = furnished.toString();
    request.fields['balcony-patio'] = balcon7patlo.toString();
    request.fields['loft'] = loft.toString();
    request.fields['swimming_pool'] = swimmingpool.toString();
    request.fields['washer_dryer'] = washerdryer.toString();
    request.fields['c-ac'] = cac.toString();
    request.fields['a-c'] = ac.toString();
    request.fields['fireplace'] = fireplaces.toString();

    request.fields['age-restricted'] = ageRestricted.toString();
    request.fields['club-house'] = clubhouse.toString();
    request.fields['community-pool'] = comminityPool.toString();
    request.fields['fitness-center'] = fitnessCenter.toString();
    request.fields['gated'] = gated.toString();
    request.fields['golf'] = golf.toString();
    request.fields['guard-gated'] = gaurdGated.toString();
    request.fields['tennis'] = tennis.toString();

    request.fields['cats'] = cats.toString();
    request.fields['dogs'] = dogs.toString();

    request.fields['carpet'] = carpet.toString();
    request.fields['ceramic'] = caremic.toString();
    request.fields['granite'] = granite.toString();
    request.fields['marble'] = marble.toString();
    request.fields['parquet'] = parquet.toString();
    request.fields['porcelain'] = porcelaiin.toString();
    request.fields['vinyl'] = vinyl.toString();
    request.fields['wood'] = wood.toString();

    request.fields['a-c'] = uac.toString();
    request.fields['c-a-c'] = ucac.toString();
    request.fields['electricity'] = electricity.toString();
    request.fields['gas'] = gas.toString();
    request.fields['heat'] = heat.toString();
    request.fields['trash'] = trash.toString();
    request.fields['water'] = water.toString();

    print('Request: ${request.fields.toString()}');

    http.Response response =
        await http.Response.fromStream(await request.send());
//
    print(response.body);

    dynamic data = json.decode(response.body)['data'];

    setState(() {
      showSpinner=false;
      if (data['api_status'] == 1) {
        Navigator.push(
            context,
            new MaterialPageRoute(
              builder: (ctxt) => new SuccessScree(),
            ));
      } else {
        showAlert(context, data['message']);
      }
    });

//
//    prefs.setString('email', tookEmail);
//    prefs.setString('address', tookAddress);
//    prefs.setString('phone', tookNumber);
//    prefs.setString('login', '1');
//
//    print(prefs.getString('profile_image'));
//
//    setState(() {
//      showSpinner = false;
//    });

//    Navigator.pop(context);
//    Navigator.of(context).pushReplacementNamed(NavigationDashboard.id);

//    Navigator.push(
//        context,
//        new MaterialPageRoute(
//          builder: (ctxt) => new NavigationDashboard(
//            profileImage: image,
//            address: address,
//            phone: phone,
//            email: email,
//            name: nameUser,
//            custId: id.toString(),
//          ),
//        ));
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
