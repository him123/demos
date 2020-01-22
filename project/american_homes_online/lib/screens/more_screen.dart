import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MoreScreen extends StatefulWidget {
  @override
  _MoreScreenState createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Card(
          child: ListTile(
            leading: Icon(FontAwesomeIcons.cog, color: Colors.red,),
            title: Text('Preferences'),
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(FontAwesomeIcons.star, color: Colors.red,),
            title: Text('Rate This Application'),
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(FontAwesomeIcons.searchengin, color: Colors.red,),
            title: Text('Reset Agent\'s Code'),
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(FontAwesomeIcons.unlock, color: Colors.red,),
            title: Text('Unlock More Features'),
          ),
        ),
      ],
    );
  }
}
