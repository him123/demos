import 'package:american_homes_online/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math';

class Calculator extends StatefulWidget {
  final bool showAppBar;

  Calculator({this.showAppBar});

  @override
  _CalculatorState createState() => _CalculatorState(showAppBar: showAppBar);
}

class _CalculatorState extends State<Calculator> {
  int heightAmo = 20;
  int heightFre = 4;
  String frequencyStr = 'Monthly';
  final bool showAppBar;
  double salePrice = 0.0;
  double downpayment = 0.0;
  double interestRate = 5.0;
  int amortixation = 0;
  int frequency = 0;
  double total = 0;

  TextEditingController downPaymentCntrl = TextEditingController();

  _CalculatorState({this.showAppBar});

  void calculateEmi(double salesPrice, double interestRate, double time) {

    print('Price: $salesPrice , Interest Rate: $interestRate , Time: $time');
    interestRate = interestRate / (12 * 100); // one month interest
    time = time * 12; // one month period



    if(heightFre==1){
      total = (salesPrice * interestRate * pow((1 + interestRate), time) /
          (pow((1 + interestRate), time) - 1))/4;
    }else if(heightFre==2){
      total = (salesPrice * interestRate * pow((1 + interestRate), time) /
          (pow((1 + interestRate), time) - 1))/3;
    }else if(heightFre==3){
      total = (salesPrice * interestRate * pow((1 + interestRate), time) /
          (pow((1 + interestRate), time) - 1))/2;
    }else{
      total = (salesPrice * interestRate * pow((1 + interestRate), time) /
          (pow((1 + interestRate), time) - 1));
    }

    print('Total: $total');
  }

//  int weight = 60;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: showAppBar == true
          ? AppBar(
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
            )
          : null,
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 20.0,
          ),
          Center(
            child: Text(
              '$frequencyStr Paymentry ',
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
                    '\$${total.round()}',
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
                Text(
                  'Principal & Interest',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15.0),
                ),
                Text('\$${total.round()}',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 19.0)),
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            color: Colors.black12,
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 45.0, right: 45.0, bottom: 40.0),
              child: Column(
                children: <Widget>[
                  Row(
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
                        child: TextFormField(
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.w900),
                          onChanged: (val) {
                            setState(() {
                              salePrice = double.parse(val);
                              calculateEmi(salePrice, interestRate, heightAmo.toDouble());
                              downpayment = salePrice / 10;
                              downPaymentCntrl.text = '\$$downpayment';
                              print(downpayment);
                            });
                          },
                          keyboardType: TextInputType.number,
                        ),
                        width: 150.0,
                        alignment: Alignment.bottomCenter,
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Text(
                          'Down Payment',
                          style: kCalTableTextKeyStyle,
                        ),
                        height: 50.0,
                        alignment: Alignment.center,
                      ),
                      Container(
                        child: TextFormField(
                          textAlign: TextAlign.right,
                          controller: downPaymentCntrl,
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.w900),
                          keyboardType: TextInputType.number,
                          onChanged: (val) {
                            setState(() {
                              downpayment = double.parse(val);
                              calculateEmi(salePrice, interestRate,
                                  heightAmo.toDouble());
                            });
                          },
                        ),
                        width: 150.0,
                        alignment: Alignment.center,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Text(
                          'Interest Rate',
                          style: kCalTableTextKeyStyle,
                        ),
                        height: 50.0,
                        alignment: Alignment.center,
                      ),
                      Container(
                        child: TextFormField(
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.w900),
                          keyboardType: TextInputType.number,
                          initialValue: '$interestRate%',
                          onChanged: (val) {
                            setState(() {
                              interestRate = double.parse(val);
                              calculateEmi(salePrice, interestRate, heightAmo.toDouble());
                            });
                          },
                        ),
                        width: 150.0,
                        alignment: Alignment.center,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Amortization',
                        style: kCalTableTextKeyStyle,
                      ),
                      Text(
                        '$heightAmo Years',
                        style: kCalTableTextValStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: Color(0xFF8D8E98),
                        activeTrackColor: Colors.white,
                        overlayColor: Color(0x29EB1555),
                        thumbColor: Color(0xFFEB1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 10.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 20.0)),
                    child: Slider(
                      value: heightAmo.toDouble(),
                      min: 5.0,
                      max: 30.0,
                      divisions: 5,
                      onChanged: (double newValue) {
                        setState(() {
                          heightAmo = newValue.round();
                          calculateEmi(
                              salePrice, interestRate, heightAmo.toDouble());
                        });
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Frequency',
                        style: kCalTableTextKeyStyle,
                      ),
                      Text(
                        '$frequencyStr',
                        style: kCalTableTextValStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: Color(0xFF8D8E98),
                        activeTrackColor: Colors.white,
                        overlayColor: Color(0x29EB1555),
                        thumbColor: Color(0xFFEB1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 10.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 20.0)),
                    child: Slider(
                      value: heightFre.toDouble(),
                      min: 1.0,
                      max: 4.0,
                      onChanged: (double newValue) {
                        setState(() {
                          heightFre = newValue.round();
                          calculateEmi(
                              salePrice, interestRate, heightAmo.toDouble());
                          if (heightFre == 1) {
                            frequencyStr = 'Weekly';
//                            total = total/4;
                          } else if (heightFre == 2) {
                            frequencyStr = 'Biweekly';
//                            total = total/2;
                          } else if (heightFre == 3) {
                            frequencyStr = 'Semimonthly';
//                            total = total/2;
                          } else {
                            frequencyStr = 'Monthly';

                          }
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
