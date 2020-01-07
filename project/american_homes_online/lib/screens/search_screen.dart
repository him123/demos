import 'package:american_homes_online/constants/data_library.dart';
import 'package:american_homes_online/screens/criteria_list_screen.dart';
import 'package:american_homes_online/widget/custom_radio_buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:numberpicker/numberpicker.dart';

class SearchScreen extends StatefulWidget {
  static String id = 'SearchScreen';

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  bool isChecked = false;
  List selPType = [];
  List selAmenitiesAndFeatures = [];
  List communityAmenities = [];
  List buildingAmenities = [];
  List flooringType = [];
  List petsAllowed = [];
  List utilitiesIncluded = [];
  List lotDescription = [];
  List moreCriteriaSel = [];
  List saleOrRent = ['All','Sale', 'Rent'];

  String saleOrRental = 'All';
  String price = 'All';

  String getText(List fullList) {
    if (fullList.length == 1) {
      return fullList[0].toString();
    } else {
      return 'Multiple';
    }
  }

  double _currentPrice = 10000.0;

  void _showDialog() {
    showDialog<int>(
        context: context,
        builder: (BuildContext context) {
          return new NumberPickerDialog.decimal(
            minValue: 10000,
            maxValue: 1000000,
            title: new Text("Pick a new price"),
            initialDoubleValue: _currentPrice,
          );
        }
    ).then((int value ){
      if (value != null) {
        setState(() => _currentPrice = value as double);
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Hero(
              tag: 'search',
              child: Image.asset(
                'images/search.png',
                height: 30.0,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Text("Advance Search"),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                        border: UnderlineInputBorder(
                            borderSide: new BorderSide(color: Colors.red)),
                        hintText: 'Select city'),
                  ),
                  TextField(
                    decoration: InputDecoration(
                        border: UnderlineInputBorder(
                            borderSide: new BorderSide(color: Colors.red)),
                        hintText: 'Search by address (E.g. 123 Main)'),
                  ),
                  InkWell(
                    onTap: () async {
                      final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CriteriaScreen(
                              mainList: propertyTypes,
                            ),
                          ));

                      setState(() {
                        selPType = result;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Property Type',
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            selPType.length == 0 ? 'All' : getText(selPType),
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Widget setupAlertDialoadContainer() {
                          return Container(
                            height: 300.0, // Change as per your requirement
                            width: 300.0, // Change as per your requirement
                            child: ListView.builder(
                              shrinkWrap: false,
                              itemCount: saleOrRent.length,
                              itemBuilder: (BuildContext context, int index) {
                                return InkWell(
                                  onTap: () {
                                    print(
                                        'selected ${saleOrRent[index]}');
                                    setState(() {
                                      saleOrRental = saleOrRent[index];
                                    });
                                  Navigator.pop(context);
                                  },
                                  child: ListTile(
                                    selected: true,
                                    title: Text(saleOrRent[index]),
                                  ),
                                );
                              },
                            ),
                          );
                        }

                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Property Type'),
                                content: setupAlertDialoadContainer(),
                                actions: <Widget>[
                                  FlatButton(
                                    child: Text('Cancel'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  FlatButton(
                                    child: Text('Ok'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Sale/Rental',
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            saleOrRental,
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: (){
                        _showDialog();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Price',
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            'All',
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                        child: CustomRadio(
                      bedOrBath: 1,
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                        child: CustomRadio(
                      bedOrBath: 2,
                    )),
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                  /*Amenities & Features*/ Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () async {
                        final result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CriteriaScreen(
                                mainList: amenitiesAndFeatures,
                              ),
                            ));

                        setState(() {
                          selAmenitiesAndFeatures = result;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Amenities & Features',
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            selAmenitiesAndFeatures.length == 0
                                ? 'All'
                                : getText(selAmenitiesAndFeatures),
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                  /*Community Amenities*/ Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () async {
                        final result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CriteriaScreen(
                                mainList: CommunitiesAminities,
                              ),
                            ));

                        setState(() {
                          communityAmenities = result;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Community Amenities',
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            communityAmenities.length == 0
                                ? 'All'
                                : getText(communityAmenities),
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                  /*Building Amenities*/ Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () async {
                        final result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CriteriaScreen(
                                mainList: BuildingAmenities,
                              ),
                            ));

                        setState(() {
                          buildingAmenities = result;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Building Amenities',
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            buildingAmenities.length == 0
                                ? 'All'
                                : getText(buildingAmenities),
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                  /*Flooring Type*/ Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () async {
                        final result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CriteriaScreen(
                                mainList: FlooringType,
                              ),
                            ));

                        setState(() {
                          flooringType = result;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Flooring Type',
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            flooringType.length == 0
                                ? 'All'
                                : getText(flooringType),
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                  /*Pets Allowed*/ Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Pets Allowed',
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'All',
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                  /*Utilities Included*/ Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () async {
                        final result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CriteriaScreen(
                                mainList: UtilitiesIncluded,
                              ),
                            ));

                        setState(() {
                          utilitiesIncluded = result;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Utilities Included',
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            utilitiesIncluded.length == 0
                                ? 'All'
                                : getText(utilitiesIncluded),
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                  /*Lot Description*/ Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () async {
                        final result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CriteriaScreen(
                                mainList: LotDescription,
                              ),
                            ));

                        setState(() {
                          lotDescription = result;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Lot Description',
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            lotDescription.length == 0
                                ? 'All'
                                : getText(lotDescription),
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.black,
                  ),
//                  /*Sale Type*/ Padding(
//                    padding: const EdgeInsets.all(8.0),
//                    child: Row(
//                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                      children: <Widget>[
//                        Text(
//                          'Sale Type',
//                          style: TextStyle(
//                              fontSize: 18.0, fontWeight: FontWeight.w600),
//                        ),
//                        Text(
//                          'All',
//                          style: TextStyle(
//                              fontSize: 18.0, fontWeight: FontWeight.w300),
//                        ),
//                      ],
//                    ),
//                  ),
//                  Divider(
//                    color: Colors.black,
//                  ),
                  /*Open Houses*/ Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Open Houses',
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w600),
                        ),
                        Checkbox(
                          onChanged: (val) {
                            setState(() {
                              isChecked = val;
                            });
                          },
                          value: isChecked,
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.black,
                  ),

                  /*MORE*/ Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.white,
                      height: 60,
                      alignment: FractionalOffset.center,
                      child: RaisedButton(
                        elevation: 5.0,
                        padding: EdgeInsets.only(
                            top: 10.0, bottom: 10.0, right: 30.0, left: 30.0),
                        color: Colors.white,
                        child: Text(
                          'MORE CRITERIA',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 16,
                          ),
                        ),
                        onPressed: () async {
                            final result = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CriteriaScreen(
                                    mainList: moreCriteria,
                                  ),
                                ));

                            setState(() {
                              moreCriteriaSel = result;
                            });
                        },
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              height: 60,
              alignment: FractionalOffset.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  FlatButton(
                    color: Colors.blueGrey,
                    padding: EdgeInsets.only(
                        top: 10.0, bottom: 10.0, right: 35.0, left: 35.0),
                    child: Text(
                      'Reset',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    onPressed: () async {},
                  ),
                  FlatButton(
                    padding: EdgeInsets.only(
                        top: 10.0, bottom: 10.0, right: 30.0, left: 30.0),
                    color: Theme.of(context).accentColor,
                    child: Text(
                      'Search',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    onPressed: () async {},
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
