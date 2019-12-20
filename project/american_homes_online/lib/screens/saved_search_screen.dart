import 'package:flutter/material.dart';

class SavedSearch extends StatelessWidget {
  static String id = 'SavedSearch';
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Row(
        children: <Widget>[
          Hero(
            tag: 'saved',
            child: Image.asset(
              'images/recent_search.png',
              height: 30.0,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
          Text("Saved search"),
        ],
      ),),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('First'),
            subtitle: (Text('Map bound')),
          ),
          ListTile(
            title: Text('First'),
            subtitle: (Text('Map bound')),
          )
        ],
      ),

    );
  }
}
