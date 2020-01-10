import 'package:american_homes_online/model/property_model.dart';
import 'package:flutter/material.dart';

class AddPropertyDetails extends StatefulWidget {
  const AddPropertyDetails({
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
  _AddPropertyDetailsState createState() => _AddPropertyDetailsState();
}

class _AddPropertyDetailsState extends State<AddPropertyDetails> {
  List<String> spStructureType = [
    'Brick',
    'Wood',
    'Cement',
  ];

  List<String> spFloorNo = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
  ];

  String spStrucTypeVal = 'Brick', selectedStructType = '';
  String spFloorVal = '1', selectedFloor = '';

  double txtFldHeight = 40.0;
  String property_size = '',
      property_lot_size = '',
      property_rooms = '',
      property_bedrooms = '',
      property_bathrooms = '',
      property_year = '',
      property_garage = '',
      property_garage_size = '',
      property_date = '',
      property_basement = '',
      property_external_construction = '',
      exterior_material = '',
      property_roofing = '',
      stories_number = '',
      owner_notes = '';

  @override
  Widget build(BuildContext context) {
    return ListView(
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
                          'Listing Details',
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
                          'Add a little more info about your property.',
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
                    width: 380.0,
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Flexible(
                              child: SizedBox(
                                height: txtFldHeight,
                                child: TextFormField(
                                  onChanged: (val) {
                                    property_size = val;
                                  },
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      filled: true,
                                      labelText: 'Size in ft2 (*only numbers)',
                                      fillColor: Colors.white),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 8.0,
                            ),
                            Flexible(
                              child: SizedBox(
                                height: txtFldHeight,
                                child: TextFormField(
                                  onChanged: (val) {
                                    property_lot_size = val;
                                  },
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      filled: true,
                                      labelText:
                                          'Lot Size in ft2 (*only numbers)',
                                      fillColor: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Flexible(
                              child: SizedBox(
                                height: txtFldHeight,
                                child: TextFormField(
                                  onChanged: (val) {
                                    property_rooms = val;
                                  },
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      filled: true,
                                      labelText: 'Rooms (*only numbers)',
                                      fillColor: Colors.white),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 8.0,
                            ),
                            Flexible(
                              child: SizedBox(
                                height: txtFldHeight,
                                child: TextFormField(
                                  onChanged: (val) {
                                    property_bedrooms = val;
                                  },
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      filled: true,
                                      labelText: 'Bedrooms (*only numbers)',
                                      fillColor: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Flexible(
                              child: SizedBox(
                                height: txtFldHeight,
                                child: TextFormField(
                                  onChanged: (val) {
                                    property_bathrooms = val;
                                  },
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      filled: true,
                                      labelText: 'Bathrooms (*only numbers)',
                                      fillColor: Colors.white),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 8.0,
                            ),
                            Flexible(
                              child: SizedBox(
                                height: txtFldHeight,
                                child: TextFormField(
                                  onChanged: (val) {
//                                    customid
                                  },
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      filled: true,
                                      labelText: 'Custom ID (*numeric)',
                                      fillColor: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Flexible(
                              child: SizedBox(
                                height: txtFldHeight,
                                child: TextFormField(
                                  onChanged: (val) {
                                    property_year = val;
                                  },
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      filled: true,
                                      labelText: 'Year Built (*text)',
                                      fillColor: Colors.white),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 8.0,
                            ),
                            Flexible(
                              child: SizedBox(
                                height: txtFldHeight,
                                child: TextFormField(
                                  onChanged: (val) {
                                    property_garage = val;
                                  },
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      filled: true,
                                      labelText: 'Garages (*text)',
                                      fillColor: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Flexible(
                              child: SizedBox(
                                height: txtFldHeight,
                                child: TextFormField(
                                  onChanged: (val) {
                                    property_garage_size = val;
                                  },
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      filled: true,
                                      labelText: 'Garage Size (*text)',
                                      fillColor: Colors.white),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 8.0,
                            ),
                            Flexible(
                              child: SizedBox(
                                height: txtFldHeight,
                                child: TextFormField(
                                  onChanged: (val) {},
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      filled: true,
                                      labelText: 'Available from (*date)',
                                      fillColor: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Flexible(
                              child: SizedBox(
                                height: txtFldHeight,
                                child: TextFormField(
                                  onChanged: (val) {
                                    property_basement = val;
                                  },
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      filled: true,
                                      labelText: 'Basement (*text)',
                                      fillColor: Colors.white),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 8.0,
                            ),
                            Flexible(
                              child: SizedBox(
                                height: txtFldHeight,
                                child: TextFormField(
                                  onChanged: (val) {
                                    property_external_construction = val;
                                  },
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      filled: true,
                                      labelText:
                                          'External Construction (*text)',
                                      fillColor: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Flexible(
                              child: SizedBox(
                                height: txtFldHeight,
                                child: TextFormField(
                                  onChanged: (val) {
                                    exterior_material = val;
                                  },
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      filled: true,
                                      labelText: 'Exterior Material (*text)',
                                      fillColor: Colors.white),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 8.0,
                            ),
                            Flexible(
                              child: SizedBox(
                                height: txtFldHeight,
                                child: TextFormField(
                                  onChanged: (val) {
                                    property_roofing = val;
                                  },
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      filled: true,
                                      labelText: 'Roofing (*text)',
                                      fillColor: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        /*DropDown*/ Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Flexible(
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    color: Colors.white,
                                    height: 70.0,
                                    child: Container(
                                      alignment: Alignment.center,
                                      decoration: ShapeDecoration(
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                              width: 1.0,
                                              style: BorderStyle.solid),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5.0)),
                                        ),
                                      ),
                                      child: Column(
                                        children: <Widget>[
                                          Align(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(2.0),
                                              child: Text('Structure Type'),
                                            ),
                                            alignment: Alignment.topLeft,
                                          ),
                                          DropdownButton<String>(
                                            value: spStrucTypeVal,
                                            icon: Icon(Icons.arrow_drop_down),
                                            iconSize: 24,
                                            elevation: 16,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                inherit: false,
                                                decorationColor: Colors.white),
//                  underline: Container(
//                    height: 2,
//                    color: Colors.deepPurpleAccent,
//                  ),

                                            onChanged: (String data) {
                                              setState(() {
                                                spStrucTypeVal = data;
                                                selectedStructType =
                                                    spStrucTypeVal;
                                              });
                                            },
                                            items: spStructureType
                                                .map<DropdownMenuItem<String>>(
                                                    (String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value),
                                              );
                                            }).toList(),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 8.0,
                            ),
                            Flexible(
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    color: Colors.white,
                                    height: 70.0,
                                    child: Container(
                                      alignment: Alignment.center,
                                      decoration: ShapeDecoration(
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                              width: 1.0,
                                              style: BorderStyle.solid),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5.0)),
                                        ),
                                      ),
                                      child: Column(
                                        children: <Widget>[
                                          Align(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(2.0),
                                              child: Text('Floors No'),
                                            ),
                                            alignment: Alignment.topLeft,
                                          ),
                                          DropdownButton<String>(
                                            value: spFloorVal,
                                            icon: Icon(Icons.arrow_drop_down),
                                            iconSize: 24,
                                            elevation: 16,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                inherit: false,
                                                decorationColor: Colors.white),
                                            onChanged: (String data) {
                                              setState(() {
                                                spFloorVal = data;
                                                selectedFloor = spFloorVal;
                                              });
                                            },
                                            items: spFloorNo
                                                .map<DropdownMenuItem<String>>(
                                                    (String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value),
                                              );
                                            }).toList(),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        SizedBox(
                          height: txtFldHeight,
                          child: TextFormField(
                            onChanged: (val) {
                              owner_notes = val;
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                filled: true,
                                labelText:
                                    'Owner/Agent notes (*not visible on front end)',
                                fillColor: Colors.white),
                          ),
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
        /*NEXT*/ Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            InkWell(
              onTap: () {
                widget.onDataChange(
                    2, 'This is title of property', widget.propertyModel);
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
                print('tapped next');
                widget.propertyModel.property_size = property_size;
                widget.propertyModel.property_lot_size = property_lot_size;
                widget.propertyModel.property_rooms = property_rooms;
                widget.propertyModel.property_bedrooms = property_bedrooms;
                widget.propertyModel.property_bathrooms = property_bathrooms;
                widget.propertyModel.property_year = property_year;
                widget.propertyModel.property_garage = property_garage;
                widget.propertyModel.property_garage_size =
                    property_garage_size;
                widget.propertyModel.property_date = property_date;
                widget.propertyModel.property_basement = property_basement;
                widget.propertyModel.property_external_construction =
                    property_external_construction;
                widget.propertyModel.exterior_material = exterior_material;
                widget.propertyModel.property_roofing = property_roofing;
                widget.propertyModel.stories_number = stories_number;
                widget.propertyModel.owner_notes = owner_notes;

                widget.onDataChange(
                    4, 'This is title of property', widget.propertyModel);
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
