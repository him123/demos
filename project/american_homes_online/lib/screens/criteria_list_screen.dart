import 'package:american_homes_online/constants/constants.dart';
import 'package:american_homes_online/constants/data_library.dart';
import 'package:flutter/material.dart';

class CriteriaScreen extends StatefulWidget {
  final List mainList;
  CriteriaScreen({this.mainList});

  @override
  _CriteriaScreenState createState() => _CriteriaScreenState(mainList: mainList);
}

class _CriteriaScreenState extends State<CriteriaScreen> {

  final List mainList;
  _CriteriaScreenState({this.mainList});
  List selectedIndexes = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select'),
        actions: <Widget>[
          FlatButton(
              onPressed: () {
                Navigator.pop(context, selectedIndexes);
              },
              child: Text(
                'Apply',
                style: TextStyle(color: Colors.white, fontSize: 19.0),
              ))
        ],
      ),
      body: ListView.builder(
          itemCount: mainList.length,
          itemBuilder: (context, index) {
            return InkWell(
              hoverColor: Colors.blue,
              onTap: () {
                print(mainList[index].toString());

                setState(() {
                  if (selectedIndexes
                      .contains(mainList[index].toString())) {
                    selectedIndexes.remove(mainList[index].toString());
                  } else {
                    selectedIndexes.add(mainList[index].toString());
                  }
                });
              },
              child: Container(
                color: selectedIndexes
                            .contains(mainList[index].toString()) ==
                        true
                    ? Colors.blue
                    : Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    mainList[index].toString(),
                    style: TextStyle(fontSize: 19.0),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
