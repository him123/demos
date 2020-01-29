import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomRadio extends StatefulWidget {
  final int bedOrBath;
  final Function getValues;

  CustomRadio({ this.bedOrBath, Key key, this.getValues}): super(key: key);

  @override
  createState() {
    return new CustomRadioState(bedOrBath: bedOrBath);
  }
}

class CustomRadioState extends State<CustomRadio> {
  final int bedOrBath;

  CustomRadioState({this.bedOrBath});

  List<RadioModel> sampleData = new List<RadioModel>();


  @override
  void initState() {

    // TODO: implement initState
    super.initState();
    sampleData.add(new RadioModel(
        true, 'A', 'April 18', Icon(FontAwesomeIcons.lock), true));
    sampleData.add(new RadioModel(
        false, '+1', 'April 17', Icon(FontAwesomeIcons.lock), false));
    sampleData.add(new RadioModel(
        false, '+2', 'April 16', Icon(FontAwesomeIcons.lock), false));
    sampleData.add(new RadioModel(
        false, '+3', 'April 15', Icon(FontAwesomeIcons.lock), false));
    sampleData.add(new RadioModel(
        false, '+4', 'April 15', Icon(FontAwesomeIcons.lock), false));
    sampleData.add(new RadioModel(
        false, '+5', 'April 15', Icon(FontAwesomeIcons.lock), false));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        InkWell(
          //highlightColor: Colors.red,
          splashColor: Colors.black12,
          onTap: () {
            setState(() {
              sampleData.forEach((element) => element.isSelected = false);
              sampleData[0].isSelected = true;
              widget.getValues('0');
            });
          },
          child: new RadioItem(sampleData[0], bedOrBath),
        ),
        InkWell(
          //highlightColor: Colors.red,
          splashColor: Colors.blueAccent,
          onTap: () {
            setState(() {
              sampleData.forEach((element) => element.isSelected = false);
              sampleData[1].isSelected = true;
              widget.getValues('1');
            });
          },
          child: new RadioItem(sampleData[1], bedOrBath),
        ),
        InkWell(
          //highlightColor: Colors.red,
          splashColor: Colors.blueAccent,
          onTap: () {
            setState(() {
              sampleData.forEach((element) => element.isSelected = false);
              sampleData[2].isSelected = true;
              widget.getValues('2');
            });
          },
          child: new RadioItem(sampleData[2], bedOrBath),
        ),
        InkWell(
          //highlightColor: Colors.red,
          splashColor: Colors.black,
          onTap: () {
            setState(() {
              sampleData.forEach((element) => element.isSelected = false);
              sampleData[3].isSelected = true;
              widget.getValues('3');
            });
          },
          child: new RadioItem(sampleData[3], bedOrBath),
        ),
        InkWell(
          //highlightColor: Colors.red,
          splashColor: Colors.black,
          onTap: () {
            setState(() {
              sampleData.forEach((element) => element.isSelected = false);
              sampleData[4].isSelected = true;
              widget.getValues('4');
            });
          },
          child: new RadioItem(sampleData[4], bedOrBath),
        ),
        InkWell(
          //highlightColor: Colors.red,
          splashColor: Colors.black,
          onTap: () {
            setState(() {
              sampleData.forEach((element) => element.isSelected = false);
              sampleData[5].isSelected = true;
              widget.getValues('5');
            });
          },
          child: new RadioItem(sampleData[5], bedOrBath),
        ),
      ],
    );
  }
}

class RadioItem extends StatelessWidget {
  final int bedOrBath;
  final RadioModel _item;

  RadioItem(this._item, this.bedOrBath);

  @override
  Widget build(BuildContext context) {
    return _item.isIcon == true
        ? Container(
//      margin: new EdgeInsets.all(15.0),
            child: Container(
              height: 30.0,
              width: 75.0,
//        padding: const EdgeInsets.only(
//            top: 11.0, bottom: 11.0, right: 20.0, left: 20.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5.0),
                      bottomLeft: Radius.circular(5.0),
                      topRight: Radius.circular(0.0),
                      bottomRight: Radius.circular(0.0)),
                  border: Border.all(color: Colors.black),
                  color:
                      _item.isSelected == true ? Colors.black : Colors.white),
              child: Icon(
                bedOrBath == 1 ? FontAwesomeIcons.bed : FontAwesomeIcons.bath,
                color: _item.isSelected == true ? Colors.white : Colors.black,
                size: 17.0,
              ),
            ),
          )
        : Container(
            height: 30.0,
            width: 50.0,
            child: new Center(
              child: _item.isIcon
                  ? Icon(
                      FontAwesomeIcons.lock,
                      color: _item.isSelected ? Colors.white : Colors.black,
                    )
                  : Text(_item.buttonText,
                      style: new TextStyle(
                          color: _item.isSelected ? Colors.white : Colors.black,
                          fontSize: 18.0)),
            ),
            decoration: BoxDecoration(
//          borderRadius: BorderRadius.only(
//              topLeft: Radius.circular(5.0),
//              bottomLeft: Radius.circular(5.0),
//              topRight: Radius.circular(0.0),
//              bottomRight: Radius.circular(0.0)),
                border: Border.all(color: Colors.black),
                color: _item.isSelected == true ? Colors.black : Colors.white),
          );
  }
}

class RadioModel {
  bool isSelected;
  final String buttonText;
  final String text;
  Icon icon;
  bool isIcon;

  RadioModel(
      this.isSelected, this.buttonText, this.text, this.icon, this.isIcon);
}
