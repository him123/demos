import 'package:flutter/material.dart';

class MyFavorite extends StatelessWidget {
  static String id = 'MyFavorite';
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: <Widget>[
              Hero(
                tag: 'fav',
                child: Image.asset(
                  'images/favorite.png',
                  height: 30.0,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Text("Favorite"),
            ],
          ),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(text: 'Favorite',),
              Tab(text: 'Possibilities',),
              Tab(text: 'Discarded',)
            ],
          ),

        ),
      ),
    );
  }
}
