import 'package:american_homes_online/components/database_util.dart';
import 'package:american_homes_online/model/property_model.dart';
import 'package:flutter/material.dart';

class AddPropertyDescription extends StatefulWidget {
  const AddPropertyDescription({
    @required this.data,
    @required this.str,
    @required this.propertyModel,
    @required this.onDataChange,
    this.userId,
    Key key,
  }) : super(key: key);

  final String userId;
  final int data;
  final String str;
  final PropertyModel propertyModel;
  final Function(int, String, PropertyModel) onDataChange;

  @override
  _AddPropertyDescriptionState createState() => _AddPropertyDescriptionState();
}

class _AddPropertyDescriptionState extends State<AddPropertyDescription> {
  final _formKey = GlobalKey<FormState>();

  List<String> spCategories = [
    'None',
    'Appartment',
    'Condos',
    'Coops',
    'Duplex',
    'Houses',
    'Industrial',
    'Land',
    'Manufactured',
    'Multi-Family',
    'Offices',
    'Retail',
    'Townhomes',
    'Villas',
  ];

  List<String> spListedIn = [
    'None',
    'Buy',
    'Rental',
  ];

  List<String> spProStatus = [
    'None',
    'Hot Status',
    'Cold Status',
    'Open House',
    'Sold',
  ];

  String spCatVal = 'None',
      selectedCate = '';
  String spListedInVal = 'None',
      selectedListedIn = '';
  String spProStaVal = 'None',
      selectedProSta = '';

  String user_id = '',
      property_title = '',
      property_description = '',
      property_price= '',
      prop_category= '',
      prop_action_category= '',
      property_status= '',
      property_taxes= '',
      property_maintenance= '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            /*Property Description*/ Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 2.0, color: Theme
                      .of(context)
                      .primaryColor),
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
                              'Property Description',
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
                              'This description will appear first in page. Keeping it as a brief overview makes it easier to read.',
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
                            TextFormField(
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter title';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  filled: true,
                                  labelText: 'Title/Position',
                                  fillColor: Colors.white),
                              onChanged: (val) {
                                property_title = val;
                              },
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            TextFormField(
                              maxLines: 5,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter description';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  filled: true,
                                  labelText: 'Description',
                                  fillColor: Colors.white),
                              onChanged: (val) {
                                property_description = val;
                              },
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
            /*Property Price*/ Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 2.0, color: Theme
                      .of(context)
                      .primaryColor),
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
                              'Property Price',
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
                              'Adding a price will make it easier for users to find your property in search results',
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
                            TextFormField(
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter price';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  filled: true,
                                  labelText: 'Price in \$ (only numbers)',
                                  fillColor: Colors.white),
                              onChanged: (val) {
                                property_price = val;
                              },
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            TextFormField(
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter taxes in \$';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  filled: true,
                                  labelText: 'Taxes in \$',
                                  fillColor: Colors.white),
                              onChanged: (val) {
                                property_taxes = val;
                              },
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            TextFormField(
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter maintanance';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  filled: true,
                                  labelText: 'Maintenance in \$',
                                  fillColor: Colors.white),
                              onChanged: (val) {
                                property_maintenance = val;
                              },
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
            /*Select Categories*/ Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 2.0, color: Theme
                      .of(context)
                      .primaryColor),
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
                              'Select Categories',
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
                              'Selecting a category will make it easier for users to find you property in search results.',
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
                            /*Category*/ Container(
                              color: Colors.white,
                              width: 300.0,
                              height: 40.0,
                              child: Container(
                                alignment: Alignment.center,
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        width: 1.0, style: BorderStyle.solid),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                                  ),
                                ),
                                child: DropdownButton<String>(
                                  value: spCatVal,
                                  icon: Icon(Icons.arrow_drop_down),
                                  iconSize: 24,
                                  elevation: 16,
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 20,
                                      inherit: false,
                                      decorationColor: Colors.white),
//                  underline: Container(
//                    height: 2,
//                    color: Colors.deepPurpleAccent,
//                  ),

                                  onChanged: (String data) {
                                    setState(() {
                                      spCatVal = data;
                                      selectedCate = spCatVal;
                                      prop_category = selectedCate;
                                    });
                                  },
                                  items: spCategories
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            /*Listed in*/ Container(
                              color: Colors.white,
                              width: 300.0,
                              height: 40.0,
                              child: Container(
                                alignment: Alignment.center,
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        width: 1.0, style: BorderStyle.solid),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                                  ),
                                ),
                                child: DropdownButton<String>(
                                  value: spListedInVal,
                                  icon: Icon(Icons.arrow_drop_down),
                                  iconSize: 24,
                                  elevation: 16,
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 20,
                                      inherit: false,
                                      decorationColor: Colors.white),
//                  underline: Container(
//                    height: 2,
//                    color: Colors.deepPurpleAccent,
//                  ),

                                  onChanged: (String data) {
                                    setState(() {
                                      spListedInVal = data;
                                      selectedListedIn = spListedInVal;
                                      prop_action_category = selectedListedIn;
                                    });
                                  },
                                  items: spListedIn
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                ),
                              ),
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
            /*Select Property Status*/ Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 2.0, color: Theme
                      .of(context)
                      .primaryColor),
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
                              'Select Property Status',
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
                              'Highlight your property.',
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
                    Container(
                        width: 300.0,
                        child: Column(
                          children: <Widget>[
                            /*Category*/ Container(
                              color: Colors.white,
                              width: 300.0,
                              height: 40.0,
                              child: Container(
                                alignment: Alignment.center,
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        width: 1.0, style: BorderStyle.solid),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                                  ),
                                ),
                                child: DropdownButton<String>(
                                  value: spProStaVal,
                                  icon: Icon(Icons.arrow_drop_down),
                                  iconSize: 24,
                                  elevation: 16,
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 20,
                                      inherit: false,
                                      decorationColor: Colors.white),
//                  underline: Container(
//                    height: 2,
//                    color: Colors.deepPurpleAccent,
//                  ),

                                  onChanged: (String data) {
                                    setState(() {
                                      spProStaVal = data;
                                      selectedProSta = spProStaVal;
                                      property_status = selectedProSta;
                                    });
                                  },
                                  items: spProStatus
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                ),
                              ),
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  var pModel = PropertyModel();

                  pModel.user_id = widget.userId;
                  pModel.property_title = property_title;
                  pModel.property_description = property_description;
                  pModel.property_price = property_price;
                  pModel.property_taxes = property_taxes;
                  pModel.property_maintenance = property_maintenance;
                  pModel.prop_category = prop_category;
                  pModel.prop_action_category = prop_action_category;
                  pModel.property_status = property_status;


                  widget.onDataChange(1, 'This is title of property',pModel);
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 200.0,
                  height: 40.0,
                  color: Colors.red,
                  child: Text('Next',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 16.0)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
