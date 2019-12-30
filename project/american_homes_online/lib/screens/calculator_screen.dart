import 'package:american_homes_online/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Calculator extends StatefulWidget {

  final bool showAppBar;
  Calculator({this.showAppBar});
  @override
  _CalculatorState createState() => _CalculatorState(showAppBar: showAppBar);
}

class _CalculatorState extends State<Calculator> {
  int heightAmo = 180;
  int heightFre = 180;
  final bool showAppBar;
  _CalculatorState({this.showAppBar});
//  int weight = 60;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: showAppBar==true?AppBar(
        title: Row(
      children: <Widget>[
      Hero(
        tag: 'cal',
        child: Image.asset(
          'images/cal.png',
          height: 30.0,
          color: Colors.white,
        ),
      ),
      SizedBox(
        width: 10.0,
      ),
      Text("Calculator"),
      ],
    ),
      ):null,
      body: ListView(
        children: <Widget>[
          SizedBox(height: 20.0,),
          Center(
            child: Text(
              'Every Month Payment',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(35.0),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    FontAwesomeIcons.circle,
                    size: 70.0,
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Text(
                    '\$568',
                    style: TextStyle(fontSize: 60.0),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40.0, right: 40.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Principal & Interest', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15.0),),
                Text('\$12345',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19.0)),
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            color: Colors.black12,
            child: Padding(
              padding: const EdgeInsets.only(left:45.0,right: 45.0,bottom: 40.0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: Text(
                              'Sale Price',
                              style: kCalTableTextKeyStyle,
                            ),
                            height: 50.0,
                            alignment: Alignment.center,

                          ),
                          Container(
                            child: Text(
                              'Sale Price',
                              style: kCalTableTextKeyStyle,
                            ),
                            height: 50.0,
                            alignment: Alignment.center,
                          ),
                          Container(
                            child: Text(
                              'Sale Price',
                              style: kCalTableTextKeyStyle,
                            ),
                            height: 50.0,
                            alignment: Alignment.center,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: TextField(
                            ),
                            width: 150.0,
                            alignment: Alignment.center,

                          ),
                          Container(
                            child: TextField(
                            ),
                            width: 150.0,
                            alignment: Alignment.center,

                          ),
                          Container(
                            child: TextField(
                            ),
                            width: 150.0,
                            alignment: Alignment.center,

                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Amortization', style: kCalTableTextKeyStyle,),
                      Text('15 Years', style: kCalTableTextValStyle,)
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: Color(0xFF8D8E98),
                        activeTrackColor: Colors.white,
                        overlayColor: Color(0x29EB1555),
                        thumbColor: Color(0xFFEB1555),
                        thumbShape: RoundSliderThumbShape(
                            enabledThumbRadius: 10.0),
                        overlayShape: RoundSliderOverlayShape(
                            overlayRadius: 20.0)),
                    child: Slider(
                      value: heightAmo.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue) {
                        setState(() {
                          heightAmo = newValue.round();
                        });
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Frequency', style: kCalTableTextKeyStyle,),
                      Text('15 Years', style: kCalTableTextValStyle,)
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: Color(0xFF8D8E98),
                        activeTrackColor: Colors.white,
                        overlayColor: Color(0x29EB1555),
                        thumbColor: Color(0xFFEB1555),
                        thumbShape: RoundSliderThumbShape(
                            enabledThumbRadius: 10.0),
                        overlayShape: RoundSliderOverlayShape(
                            overlayRadius: 20.0)),
                    child: Slider(
                      value: heightFre.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue) {
                        setState(() {
                          heightFre = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
