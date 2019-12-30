import 'package:flutter/material.dart';

class InputPropertyOne extends StatefulWidget {
  @override
  _InputPropertyOneState createState() => _InputPropertyOneState();
}

class _InputPropertyOneState extends State<InputPropertyOne> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Column(
          children: <Widget>[
            Text('*Title (mandatory) - one'),
            InkWell(
              onTap: (){
              },
              child: Container(
                color: Colors.red,
                height: 35.0,
                width: 150.0,
                child: Text('Next', style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold, color: Colors.white),),
              ),
            )
          ],
        )
      ],
    );
  }
}
