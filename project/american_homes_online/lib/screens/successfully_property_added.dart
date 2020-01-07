import 'package:american_homes_online/screens/dashboard_screen.dart';
import 'package:flutter/material.dart';

class SuccessScree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Property Added'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Congratulations, Your Property added Successfully.',
              style: TextStyle(
                fontSize: 26.0,
                fontWeight: FontWeight.w900,
                color: Colors.redAccent,
              ),
              textAlign: TextAlign.center,
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
                int count = 0;
                Navigator.of(context).popUntil((_) => count++ >= 1);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.center,
                  width: 150.0,
                  height: 40.0,
                  color: Colors.red,
                  child: Text('Home',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 16.0)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
