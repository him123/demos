import 'package:american_homes_online/model/property_model.dart';
import 'package:american_homes_online/screens/add_new_property_description.dart';
import 'package:american_homes_online/screens/add_property_amenities.dart';
import 'package:american_homes_online/screens/add_property_details.dart';
import 'package:american_homes_online/screens/add_property_location.dart';
import 'package:american_homes_online/screens/add_property_media.dart';
import 'package:american_homes_online/screens/my_passing_widget.dart';
import 'package:american_homes_online/screens/mywidget.dart';
import 'package:flutter/material.dart';

class AddPropertyScreen extends StatefulWidget {
  final String userId;
  AddPropertyScreen({this.userId});
  @override
  _AddPropertyScreenState createState() => _AddPropertyScreenState();
}

class _AddPropertyScreenState extends State<AddPropertyScreen> {
  var controller = PageController(
    initialPage: 1,
  );
  int bottomSelectedIndex = 0;

  String title = '1. Description';

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );


  int data = 0;
  String str = '';
  PropertyModel propertyModel;

  void onDataChange(
      int newData, String newStr, PropertyModel newPropertyModel) {
    setState(() {
      data = newData;
      str = newStr;
      propertyModel = newPropertyModel;
    });

    setState(() {
      pageController.animateToPage(
        data,
        duration: Duration(milliseconds: 300),
        curve: Curves.linear,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    print('user id from main drawer: ${widget.userId}');
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: buildPageView(),
    );
  }

  Widget buildPageView() {
    return PageView(
      physics:new NeverScrollableScrollPhysics(),
      controller: pageController,
      onPageChanged: (index) {
        pageChanged(index);
      },
      children: <Widget>[
//        MyWidget(onDataChange: onDataChange,data: data,str: str,),
//        MyPasssingWidget(onDataChange: onDataChange,data: data,str: str,),
        AddPropertyDescription(
          onDataChange: onDataChange,
          data: data,
          str: str,
          propertyModel: propertyModel,
          userId: widget.userId,
        ),
        AddPropertyMedia(
          onDataChange: onDataChange,
          data: data,
          str: str,
          propertyModel: propertyModel,
        ),
        AddPropertyLocation( onDataChange: onDataChange,
          data: data,
          str: str,
          propertyModel: propertyModel,),
        AddPropertyDetails(onDataChange: onDataChange,
          data: data,
          str: str,
          propertyModel: propertyModel,),
        AddPropertyAmenities(onDataChange: onDataChange,
          data: data,
          str: str,
          propertyModel: propertyModel,)
      ],
    );
  }

  void pageChanged(int index) {
    setState(() {
      print('====pageChanged');
      bottomSelectedIndex = index;
      if (index == 0) {
        title = '1. Description';
      } else if (index == 1) {
        title = '2. Media';
      } else if (index == 2) {
        title = '3. Location';
      } else if (index == 3) {
        title = '4. Detials';
      } else if (index == 4) {
        title = '5. Amenities';
      }
    });
  }
}
