import 'package:american_homes_online/widget/custom_radio_buttons.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchScreen extends StatefulWidget {
  static String id = 'SearchScreen';

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
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
                  Padding(
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Sale/Rental',
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
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
                  Divider(
                    color: Colors.black,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: CustomRadio(bedOrBath: 1,)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: CustomRadio(bedOrBath: 2,)),
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Living Area',
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Lot Area',
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Status',
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Show open house only',
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:  Container(

                      color: Colors.white,
                      height: 60,
                      alignment: FractionalOffset.center,
                      child: RaisedButton(
                        elevation: 5.0,
                        padding: EdgeInsets.only(top: 10.0, bottom: 10.0, right: 30.0,left: 30.0),
                        color: Colors.white,
                        child: Text(
                          'MORE CRITERIA',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 16,
                          ),
                        ),
                        onPressed: () async {},
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
                    padding: EdgeInsets.only(top: 10.0, bottom: 10.0, right: 35.0,left: 35.0),
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
                    padding: EdgeInsets.only(top: 10.0, bottom: 10.0, right: 30.0,left: 30.0),
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
