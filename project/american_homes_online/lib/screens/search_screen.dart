import 'dart:convert';

import 'package:american_homes_online/constants/data_library.dart';
import 'package:american_homes_online/screens/criteria_list_screen.dart';
import 'package:american_homes_online/widget/custom_radio_buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_picker/Picker.dart';
import 'package:http/http.dart' as http;

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
  List selectedCityList = [];
  List saleOrRent = ['All', 'Buy', 'Rentals'];
  List petsList = ['All', 'Dogs', 'Cats'];

  String saleOrRental = 'All';
  String petsSelected = 'All';
  String price = 'All';
  String cityOraddress = '';
  List<String> cityList = [
//    'New Yorke',
//    'Los Angeles',
//    'Chicago',
//    'Phoenix',
//    'San Antonio',
//    'Las Vegas, Nevada'
  ];

  String getText(List fullList) {
    if (fullList.length == 1) {
      return fullList[0].toString();
    } else if (fullList.length > 1) {
      return 'Multiple';
    } else {
      return '';
    }
  }

  String getCity(List fullList) {
    if (fullList.length == 1) {
      selectedCity = fullList[0];
      print(selectedCity);
      return fullList[0].toString();
    } else if (fullList.length > 1) {
      selectedCity = fullList.join(', ');
      print(selectedCity);
      return fullList[0].toString() + ' And More ${fullList.length}';
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

  String bedRooms = '';
  String bathRooms = '';
  TextEditingController cityController = TextEditingController();

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

  String selectedCity = '';
  String selectedMinPrice = '', selectedMaxPrice = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCities();
  }

  showPickerNumber(BuildContext context) {
    new Picker(
        adapter: NumberPickerAdapter(data: [
          NumberPickerColumn(
            begin: 0,
            end: 10000000,
            jump: 1000,
            postfix: Text('\$ '),
          ),
          NumberPickerColumn(
              begin: 1000, end: 10000000, jump: 1000, postfix: Text('\$ ')),
        ]),
        delimiter: [
          PickerDelimiter(
              child: Container(
            width: 30.0,
            alignment: Alignment.center,
            child: Icon(Icons.more_vert),
          ))
        ],
        hideHeader: true,
        title: new Text("Please Select"),
        onConfirm: (Picker picker, List value) {
          setState(() {
            //          print(value.toString());
//          print(picker.getSelectedValues());
            selectedMinPrice = picker.getSelectedValues()[0].toString();
            selectedMaxPrice = picker.getSelectedValues()[1].toString();

            print('Max Value $selectedMaxPrice Min Value $selectedMinPrice');
          });
        }).showDialog(context);
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
            Spacer(),
            cityList.length == 0
                ? CircularProgressIndicator(
                    backgroundColor: Colors.white,
                  )
                : Text('')
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
                  /*Community Amenities*/ Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () async {
                        final result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CriteriaScreen(
                                mainList: cityList,
                              ),
                            ));

                        setState(() {
                          if (result != null) {
                            selectedCityList = result;
                          }
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            selectedCityList.length == 0
                                ? 'Select City'
                                : getCity(selectedCityList),
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      onChanged: (val) {
                        cityOraddress = val;
                      },
                      decoration: InputDecoration(
                          border: UnderlineInputBorder(
                              borderSide: new BorderSide(color: Colors.red)),
                          hintText: 'Address, Neighborhood'),
                    ),
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
                        if (result != null) selPType = result;
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
                            'Buy/Rental',
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
                        showPickerNumber(context);
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
                            '\$' +
                                selectedMinPrice +
                                ' - ' +
                                '\$' +
                                selectedMaxPrice,
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
                  /*BEDROOMS*/ Padding(
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
                          if (result != null) selAmenitiesAndFeatures = result;
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
                          if (result != null) communityAmenities = result;
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
                          if (result != null) buildingAmenities = result;
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
                          if (result != null) flooringType = result;
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
                          if (result != null) utilitiesIncluded = result;
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
                          if (result != null) lotDescription = result;
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
                            if (result != null) moreCriteriaSel = result;
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
                        petsSelected = 'All';
                        saleOrRental = 'All';
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
                                        'https://americanhomesonline.com/wp-json/api/v1/All_Property/?secret_key=yQTTspWXd530xNAEnBKkMFNFuBbKG6kd&bedrooms=${bedRooms=='0'?'':bedRooms}&min_price=$selectedMinPrice&max_price=$selectedMaxPrice&bathrooms=${bathRooms=='0'?'':bathRooms}&home_type=${getText(selPType)}&community=${getText(communityAmenities)}&zip=${cityOraddress.trim()}&listing_type=${saleOrRental=='All'?'':saleOrRental}&building=${getText(buildingAmenities)}&features=${getText(selAmenitiesAndFeatures)}&size=${getText(lotDescription)}&pet_allowed=${getText(petsAllowed)}&utility${getText(utilitiesIncluded)}&floor_type=${getText(flooringType)}&property_city=${selectedCity.trim()}',
                                    filters: isFilters(),
                                    city: selectedCity.trim() == ''
                                        ? 'No'
                                        : 'Yes',
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

  Future<String> getCities() async {
    print('========= city api called ===========');
    var response = await http.get(
        'https://americanhomesonline.com/wp-json/api/v1/List_City/?secret_key=yQTTspWXd530xNAEnBKkMFNFuBbKG6kd');

    this.setState(() {
      dynamic data = json.decode(response.body)['data'];

      if (data != null) {
        if (response.statusCode == 200) {
          String cityStr = data.toString().replaceAll('[', '');
          String cityStrComplete = cityStr.replaceAll(']', '');
          print('Check Data: $cityStrComplete');

          cityList = cityStrComplete.split(',').toList();
          print(cityList);

//          cityList = data.toList();

//              (data as List).map((data) => new Agent.fromJson(data)).toList();
//
//          String firstname = list[0].title;
//          print('All Shops: $firstname');

//          setState(() {
//            showSpinner = false;
//          });
        } else {
//          setState(() {
//            showSpinner = false;
//            isFail = true;
//          });
          throw Exception('Failed to load photos');
        }
      } else {
//        setState(() {
//          showSpinner = false;
//          isFail = true;
//        });
      }
    });

//    print(data[1]["name"]);

//    showSpinner = false;
    return "Success!";
  }
}
