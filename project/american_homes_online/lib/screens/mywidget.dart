import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({
    @required this.data,
    @required this.str,
    @required this.onDataChange,
    Key key,
  }) : super(key: key);

  final int data;
  final String str;
  final Function(int,String) onDataChange;

  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('Welcome to screen 1'),
        FlatButton(
          onPressed: () => widget.onDataChange(1, 'Iam screen one'),
          child: Text('Press here'),
        ),
      ],
    );
  }
}