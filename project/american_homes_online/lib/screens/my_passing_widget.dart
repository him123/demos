import 'package:flutter/material.dart';

class MyPasssingWidget extends StatefulWidget {
  const MyPasssingWidget({
    @required this.data,
    @required this.str,
    @required this.onDataChange,
    Key key,
  }) : super(key: key);

  final int data;
  final String str;
  final Function(int,String) onDataChange;

  @override
  _MyPasssingWidgetState createState() => _MyPasssingWidgetState();
}

class _MyPasssingWidgetState extends State<MyPasssingWidget> {
  @override
  Widget build(BuildContext context) {
    print('This nubmer come ===> : ${widget.str}');
    return Container(
      child: Column(
        children: <Widget>[
          Text('This is screen two'),
          Text('This nubmer come ===> ${widget.str}'),
        ],
      ),

    );
  }
}
