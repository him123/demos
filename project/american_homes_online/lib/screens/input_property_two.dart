import 'package:flutter/material.dart';

class InputProperyTwo extends StatefulWidget {
  @override
  _InputProperyTwoState createState() => _InputProperyTwoState();
}

class _InputProperyTwoState extends State<InputProperyTwo> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Column(
          children: <Widget>[
            Text('*Title (mandatory) - two')
          ],
        )
      ],
    );
  }
}

