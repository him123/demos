import 'package:american_homes_online/components/database_util.dart';
import 'package:american_homes_online/model/saved_search.dart';
import 'package:flutter/material.dart';

import 'mapsearch_screen.dart';

class SavedSearch extends StatefulWidget {
  static String id = 'SavedSearch';

  @override
  _SavedSearchState createState() => _SavedSearchState();
}

class _SavedSearchState extends State<SavedSearch> {
//  List<SavedSearch> list;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
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
        ),
      ),
      body: FutureBuilder<List<SavedSearchModel>>(
        future: DBProvider.db.getAllSavedSearches(),
        builder: (BuildContext context,
            AsyncSnapshot<List<SavedSearchModel>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {

                SavedSearchModel item = snapshot.data[index];

                return Card(
                  elevation: 3.0,
                  borderOnForeground: true,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                                transitionDuration:
                                Duration(seconds: 1),
                                pageBuilder: (_, __, ___) =>
                                    MapSearchScreen(url: item.url, filters: 0,city: 'No',)));
                      },
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                item.name,
                                style: TextStyle(
                                    fontSize: 18.0, fontWeight: FontWeight.w700),
                              ),
                              Text(
                                item.date,
                                style: TextStyle(
                                    fontSize: 14.0, fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Row(
                            children: <Widget>[
//                            Text(item.is_map_included!=null?item.is_map_included:'Map'),
//                            SizedBox(width: 5.0,),
                              Text(item.filters)
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(child: Text('No Saved Search Found',style: TextStyle(fontSize: 25.0),));
          }
        },
      ),
    );
  }
}
