import 'package:american_homes_online/constants/data_library.dart';
import 'package:american_homes_online/screens/criteria_list_screen.dart';
import 'package:american_homes_online/widget/custom_radio_buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:numberpicker/numberpicker.dart';

import 'mapsearch_screen.dart';

class SearchScreen extends StatefulWidget {
  static String id = 'SearchScreen';

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool isOpenHome = false;
  List selPType = [];
  List selAmenitiesAndFeatures = [];
  List communityAmenities = [];
  List buildingAmenities = [];
  List flooringType = [];
  List petsAllowed = [];
  List utilitiesIncluded = [];
  List lotDescription = [];
  List moreCriteriaSel = [];
  List saleOrRent = ['All', 'Sale', 'Rent'];
  List petsList = ['All', 'Dogs', 'Cats'];

  String saleOrRental = 'All';
  String petsSelected = 'All';
  String price = 'All';
  String cityOraddress = '';

  String getText(List fullList) {
    if (fullList.length == 1) {
      return fullList[0].toString();
    } else if (fullList.length > 1) {
      return 'Multiple';
    } else {
      return '';
    }
  }

  int _currentPrice = 100;

  int isFilters() {
    if (selAmenitiesAndFeatures.length > 0 ||
        selPType.length > 0 ||
        communityAmenities.length > 0 ||
        buildingAmenities.length > 0 ||
        flooringType.length > 0 ||
        petsAllowed.length > 0 ||
        utilitiesIncluded.length > 0 ||
        lotDescription.length > 0 ||
        moreCriteriaSel.length > 0) {
      return 1;
    } else {
      return 0;
    }
  }

  void _showDialog() {
    showDialog<int>(
        context: context,
        builder: (BuildContext context) {
          return Container();
        }).then((int value) {
      if (value != null) {
        setState(() => _currentPrice = value);
      }
    });
  }

  String bedRooms='0';
  String bathRooms='0';

  void _refreshBedRooms(String rooms) {
    setState(() {
      bedRooms = rooms;
      print('selected Bed rooms: $bedRooms');
    });
  }

  void _refreshBathRooms(String rooms) {
    setState(() {
      bathRooms = rooms;
      print('selected Bath rooms: $bathRooms');
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
                    onChanged: (val) {
                      cityOraddress = val;
                    },
                    decoration: InputDecoration(
                        border: UnderlineInputBorder(
                            borderSide: new BorderSide(color: Colors.red)),
                        hintText: 'Address, Neighborhood, City or Zip'),
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
                            height: 180.0, // Change as per your requirement
                            width: 200.0, // Change as per your requirement
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: saleOrRent.length,
                              itemBuilder: (BuildContext context, int index) {
                                return InkWell(
                                  onTap: () {
                                    print('selected ${saleOrRent[index]}');
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
                      onTap: () {
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
                /*BEDROOMS*/  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                        child: CustomRadio(
                      bedOrBath: 1,
                      getValues: _refreshBedRooms,
                    )),
                  ),
                 /*BATHROOMS*/ Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                        child: CustomRadio(
                      bedOrBath: 2,
                          getValues: _refreshBathRooms,
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
                    child: InkWell(
                      onTap: () {
                        Widget setupAlertDialoadContainer() {
                          return Container(
                            height: 180.0, // Change as per your requirement
                            width: 200.0, // Change as per your requirement
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: petsList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return InkWell(
                                  onTap: () {
                                    print('selected ${petsList[index]}');
                                    setState(() {
                                      petsSelected = petsList[index];
                                    });
                                    Navigator.pop(context);
                                  },
                                  child: ListTile(
                                    selected: true,
                                    title: Text(petsList[index]),
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
                                title: Text('Pets Allowed'),
                                content: setupAlertDialoadContainer(),
                              );
                            });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Pets Allowed',
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            petsSelected,
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
                              isOpenHome = val;
                            });
                          },
                          value: isOpenHome,
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
                    onPressed: () async {
                      setState(() {
                        selAmenitiesAndFeatures.clear();
                        selPType.clear();
                        communityAmenities..clear();
                        buildingAmenities..clear();
                        flooringType.clear();
                        petsAllowed.clear();
                        utilitiesIncluded.clear();
                        lotDescription.clear();
                        moreCriteriaSel.clear();
                        petsSelected='All';
                        saleOrRental='All';

                      });

                    },
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
                    onPressed: () {
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                              transitionDuration: Duration(seconds: 1),
                              pageBuilder: (_, __, ___) => MapSearchScreen(
                                    url:
                                        'https://americanhomesonline.com/wp-json/api/v1/All_Property/?secret_key=yQTTspWXd530xNAEnBKkMFNFuBbKG6kd&bedrooms=$bedRooms&min_price=&max_price=&bathrooms=$bathRooms&home_type$isOpenHome=&community=${getText(communityAmenities)}&zip=$cityOraddress&listing_type=${getText(selPType)}&building=${getText(buildingAmenities)}&features=${getText(selAmenitiesAndFeatures)}&size=${getText(lotDescription)}&pet_allowed=${getText(petsAllowed)}&utility${getText(utilitiesIncluded)}&floor_type=${getText(flooringType)}',
                                    filters: isFilters(),
                                  )));
                    },
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
