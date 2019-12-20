import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PropertyListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Row(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTiehYAkBhtPvh9SdUQXIDuOJJNqG7vDo7IuXEN4XhElq3YF3ow&s',
                  width: 150.0,
                  height: 115.0,
                  fit: BoxFit.cover,
                ),
                Container(
                    color: Colors.blueAccent,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        'Listed 15 days ago',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    )),
                Positioned(
                    bottom: 0.0,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        children: <Widget>[
                          Icon(FontAwesomeIcons.solidCircle,color: Colors.blueAccent,size: 18.0,),
                          SizedBox(width: 10.0),
                          Text('ACTIVE',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ))
              ],
            ),
            SizedBox(
              width: 15.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Single Family Recedensy',
                      style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.red),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      '\$352,200',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    AutoSizeText('2118 SUNSET VISTA Avenue',
                      style: TextStyle(
                        fontSize: 12.0,
                      ), maxLines: 2,),
                    Text('Henderson',
                        style: TextStyle(
                          fontSize: 13.0,
                        )),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      '3',
                      style: TextStyle(fontSize: 12.0),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Icon(
                      FontAwesomeIcons.bed,
                      color: Colors.grey,
                      size: 15.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 8.0),
                      child: Container(
                        color: Colors.black12,
                        height: 20,
                        width: 2,
                      ),
                    ),
//                    SizedBox(width: 20.0,),
                    Text(
                      '2',
                      style: TextStyle(fontSize: 12.0),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Icon(
                      FontAwesomeIcons.bath,
                      color: Colors.grey,
                      size: 15.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 8.0),
                      child: Container(
                        color: Colors.black12,
                        height: 20,
                        width: 2,
                      ),
                    ),
                    AutoSizeText(
                      '1188 sqft',
                      style: TextStyle(fontSize: 12.0),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        Divider(
          color: Colors.black,
          height: 10.0,
        ),
        Row(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTiehYAkBhtPvh9SdUQXIDuOJJNqG7vDo7IuXEN4XhElq3YF3ow&s',
                  width: 150.0,
                  height: 115.0,
                  fit: BoxFit.cover,
                ),
                Container(
                    color: Colors.blueAccent,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        'Listed 15 days ago',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    )),
                Positioned(
                    bottom: 0.0,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        children: <Widget>[
                          Icon(FontAwesomeIcons.solidCircle,color: Colors.blueAccent,size: 18.0,),
                          SizedBox(width: 10.0),
                          Text('ACTIVE',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ))
              ],
            ),
            SizedBox(
              width: 15.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Single Family Recedensy',
                      style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.red),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      '\$352,200',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    AutoSizeText('2118 SUNSET VISTA Avenue',
                        style: TextStyle(
                          fontSize: 12.0,
                        ), maxLines: 2,),
                    Text('Henderson',
                        style: TextStyle(
                          fontSize: 13.0,
                        )),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      '3',
                      style: TextStyle(fontSize: 12.0),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Icon(
                      FontAwesomeIcons.bed,
                      color: Colors.grey,
                      size: 15.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 8.0),
                      child: Container(
                        color: Colors.black12,
                        height: 20,
                        width: 2,
                      ),
                    ),
//                    SizedBox(width: 20.0,),
                    Text(
                      '2',
                      style: TextStyle(fontSize: 12.0),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Icon(
                      FontAwesomeIcons.bath,
                      color: Colors.grey,
                      size: 15.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 8.0),
                      child: Container(
                        color: Colors.black12,
                        height: 20,
                        width: 2,
                      ),
                    ),
                    AutoSizeText(
                      '1188 sqft',
                      style: TextStyle(fontSize: 12.0),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        Divider(
          color: Colors.black,
          height: 10.0,
        ),
        Row(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTiehYAkBhtPvh9SdUQXIDuOJJNqG7vDo7IuXEN4XhElq3YF3ow&s',
                  width: 150.0,
                  height: 115.0,
                  fit: BoxFit.cover,
                ),
                Container(
                    color: Colors.blueAccent,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        'Listed 15 days ago',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    )),
                Positioned(
                    bottom: 0.0,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        children: <Widget>[
                          Icon(FontAwesomeIcons.solidCircle,color: Colors.blueAccent,size: 18.0,),
                          SizedBox(width: 10.0),
                          Text('ACTIVE',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ))
              ],
            ),
            SizedBox(
              width: 15.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Single Family Recedensy',
                      style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.red),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      '\$352,200',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    AutoSizeText('2118 SUNSET VISTA Avenue',
                      style: TextStyle(
                        fontSize: 12.0,
                      ), maxLines: 2,),
                    Text('Henderson',
                        style: TextStyle(
                          fontSize: 13.0,
                        )),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      '3',
                      style: TextStyle(fontSize: 12.0),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Icon(
                      FontAwesomeIcons.bed,
                      color: Colors.grey,
                      size: 15.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 8.0),
                      child: Container(
                        color: Colors.black12,
                        height: 20,
                        width: 2,
                      ),
                    ),
//                    SizedBox(width: 20.0,),
                    Text(
                      '2',
                      style: TextStyle(fontSize: 12.0),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Icon(
                      FontAwesomeIcons.bath,
                      color: Colors.grey,
                      size: 15.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 8.0),
                      child: Container(
                        color: Colors.black12,
                        height: 20,
                        width: 2,
                      ),
                    ),
                    AutoSizeText(
                      '1188 sqft',
                      style: TextStyle(fontSize: 12.0),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        Divider(
          color: Colors.black,
          height: 10.0,
        ),
        Row(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTiehYAkBhtPvh9SdUQXIDuOJJNqG7vDo7IuXEN4XhElq3YF3ow&s',
                  width: 150.0,
                  height: 115.0,
                  fit: BoxFit.cover,
                ),
                Container(
                    color: Colors.blueAccent,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        'Listed 15 days ago',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    )),
                Positioned(
                    bottom: 0.0,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        children: <Widget>[
                          Icon(FontAwesomeIcons.solidCircle,color: Colors.blueAccent,size: 18.0,),
                          SizedBox(width: 10.0),
                          Text('ACTIVE',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ))
              ],
            ),
            SizedBox(
              width: 15.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Single Family Recedensy',
                      style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.red),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      '\$352,200',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    AutoSizeText('2118 SUNSET VISTA Avenue',
                      style: TextStyle(
                        fontSize: 12.0,
                      ), maxLines: 2,),
                    Text('Henderson',
                        style: TextStyle(
                          fontSize: 13.0,
                        )),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      '3',
                      style: TextStyle(fontSize: 12.0),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Icon(
                      FontAwesomeIcons.bed,
                      color: Colors.grey,
                      size: 15.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 8.0),
                      child: Container(
                        color: Colors.black12,
                        height: 20,
                        width: 2,
                      ),
                    ),
//                    SizedBox(width: 20.0,),
                    Text(
                      '2',
                      style: TextStyle(fontSize: 12.0),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Icon(
                      FontAwesomeIcons.bath,
                      color: Colors.grey,
                      size: 15.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 8.0),
                      child: Container(
                        color: Colors.black12,
                        height: 20,
                        width: 2,
                      ),
                    ),
                    AutoSizeText(
                      '1188 sqft',
                      style: TextStyle(fontSize: 12.0),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        Divider(
          color: Colors.black,
          height: 10.0,
        ),
        Row(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTiehYAkBhtPvh9SdUQXIDuOJJNqG7vDo7IuXEN4XhElq3YF3ow&s',
                  width: 150.0,
                  height: 115.0,
                  fit: BoxFit.cover,
                ),
                Container(
                    color: Colors.blueAccent,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        'Listed 15 days ago',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    )),
                Positioned(
                    bottom: 0.0,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        children: <Widget>[
                          Icon(FontAwesomeIcons.solidCircle,color: Colors.blueAccent,size: 18.0,),
                          SizedBox(width: 10.0),
                          Text('ACTIVE',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ))
              ],
            ),
            SizedBox(
              width: 15.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Single Family Recedensy',
                      style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.red),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      '\$352,200',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    AutoSizeText('2118 SUNSET VISTA Avenue',
                      style: TextStyle(
                        fontSize: 12.0,
                      ), maxLines: 2,),
                    Text('Henderson',
                        style: TextStyle(
                          fontSize: 13.0,
                        )),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      '3',
                      style: TextStyle(fontSize: 12.0),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Icon(
                      FontAwesomeIcons.bed,
                      color: Colors.grey,
                      size: 15.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 8.0),
                      child: Container(
                        color: Colors.black12,
                        height: 20,
                        width: 2,
                      ),
                    ),
//                    SizedBox(width: 20.0,),
                    Text(
                      '2',
                      style: TextStyle(fontSize: 12.0),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Icon(
                      FontAwesomeIcons.bath,
                      color: Colors.grey,
                      size: 15.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 8.0),
                      child: Container(
                        color: Colors.black12,
                        height: 20,
                        width: 2,
                      ),
                    ),
                    AutoSizeText(
                      '1188 sqft',
                      style: TextStyle(fontSize: 12.0),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        Divider(
          color: Colors.black,
          height: 10.0,
        ),
        Row(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTiehYAkBhtPvh9SdUQXIDuOJJNqG7vDo7IuXEN4XhElq3YF3ow&s',
                  width: 150.0,
                  height: 115.0,
                  fit: BoxFit.cover,
                ),
                Container(
                    color: Colors.blueAccent,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        'Listed 15 days ago',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    )),
                Positioned(
                    bottom: 0.0,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        children: <Widget>[
                          Icon(FontAwesomeIcons.solidCircle,color: Colors.blueAccent,size: 18.0,),
                          SizedBox(width: 10.0),
                          Text('ACTIVE',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ))
              ],
            ),
            SizedBox(
              width: 15.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Single Family Recedensy',
                      style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.red),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      '\$352,200',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    AutoSizeText('2118 SUNSET VISTA Avenue',
                      style: TextStyle(
                        fontSize: 12.0,
                      ), maxLines: 2,),
                    Text('Henderson',
                        style: TextStyle(
                          fontSize: 13.0,
                        )),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      '3',
                      style: TextStyle(fontSize: 12.0),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Icon(
                      FontAwesomeIcons.bed,
                      color: Colors.grey,
                      size: 15.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 8.0),
                      child: Container(
                        color: Colors.black12,
                        height: 20,
                        width: 2,
                      ),
                    ),
//                    SizedBox(width: 20.0,),
                    Text(
                      '2',
                      style: TextStyle(fontSize: 12.0),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Icon(
                      FontAwesomeIcons.bath,
                      color: Colors.grey,
                      size: 15.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 8.0),
                      child: Container(
                        color: Colors.black12,
                        height: 20,
                        width: 2,
                      ),
                    ),
                    AutoSizeText(
                      '1188 sqft',
                      style: TextStyle(fontSize: 12.0),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        Divider(
          color: Colors.black,
          height: 10.0,
        ),
        Row(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTiehYAkBhtPvh9SdUQXIDuOJJNqG7vDo7IuXEN4XhElq3YF3ow&s',
                  width: 150.0,
                  height: 115.0,
                  fit: BoxFit.cover,
                ),
                Container(
                    color: Colors.blueAccent,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        'Listed 15 days ago',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    )),
                Positioned(
                    bottom: 0.0,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        children: <Widget>[
                          Icon(FontAwesomeIcons.solidCircle,color: Colors.blueAccent,size: 18.0,),
                          SizedBox(width: 10.0),
                          Text('ACTIVE',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ))
              ],
            ),
            SizedBox(
              width: 15.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Single Family Recedensy',
                      style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.red),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      '\$352,200',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    AutoSizeText('2118 SUNSET VISTA Avenue',
                      style: TextStyle(
                        fontSize: 12.0,
                      ), maxLines: 2,),
                    Text('Henderson',
                        style: TextStyle(
                          fontSize: 13.0,
                        )),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      '3',
                      style: TextStyle(fontSize: 12.0),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Icon(
                      FontAwesomeIcons.bed,
                      color: Colors.grey,
                      size: 15.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 8.0),
                      child: Container(
                        color: Colors.black12,
                        height: 20,
                        width: 2,
                      ),
                    ),
//                    SizedBox(width: 20.0,),
                    Text(
                      '2',
                      style: TextStyle(fontSize: 12.0),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Icon(
                      FontAwesomeIcons.bath,
                      color: Colors.grey,
                      size: 15.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 8.0),
                      child: Container(
                        color: Colors.black12,
                        height: 20,
                        width: 2,
                      ),
                    ),
                    AutoSizeText(
                      '1188 sqft',
                      style: TextStyle(fontSize: 12.0),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        Divider(
          color: Colors.black,
          height: 10.0,
        ),
        Row(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTiehYAkBhtPvh9SdUQXIDuOJJNqG7vDo7IuXEN4XhElq3YF3ow&s',
                  width: 150.0,
                  height: 115.0,
                  fit: BoxFit.cover,
                ),
                Container(
                    color: Colors.blueAccent,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        'Listed 15 days ago',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    )),
                Positioned(
                    bottom: 0.0,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        children: <Widget>[
                          Icon(FontAwesomeIcons.solidCircle,color: Colors.blueAccent,size: 18.0,),
                          SizedBox(width: 10.0),
                          Text('ACTIVE',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ))
              ],
            ),
            SizedBox(
              width: 15.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Single Family Recedensy',
                      style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.red),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      '\$352,200',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    AutoSizeText('2118 SUNSET VISTA Avenue',
                      style: TextStyle(
                        fontSize: 12.0,
                      ), maxLines: 2,),
                    Text('Henderson',
                        style: TextStyle(
                          fontSize: 13.0,
                        )),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      '3',
                      style: TextStyle(fontSize: 12.0),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Icon(
                      FontAwesomeIcons.bed,
                      color: Colors.grey,
                      size: 15.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 8.0),
                      child: Container(
                        color: Colors.black12,
                        height: 20,
                        width: 2,
                      ),
                    ),
//                    SizedBox(width: 20.0,),
                    Text(
                      '2',
                      style: TextStyle(fontSize: 12.0),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Icon(
                      FontAwesomeIcons.bath,
                      color: Colors.grey,
                      size: 15.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 8.0),
                      child: Container(
                        color: Colors.black12,
                        height: 20,
                        width: 2,
                      ),
                    ),
                    AutoSizeText(
                      '1188 sqft',
                      style: TextStyle(fontSize: 12.0),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        Divider(
          color: Colors.black,
          height: 10.0,
        ),
        Row(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTiehYAkBhtPvh9SdUQXIDuOJJNqG7vDo7IuXEN4XhElq3YF3ow&s',
                  width: 150.0,
                  height: 115.0,
                  fit: BoxFit.cover,
                ),
                Container(
                    color: Colors.blueAccent,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        'Listed 15 days ago',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    )),
                Positioned(
                    bottom: 0.0,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        children: <Widget>[
                          Icon(FontAwesomeIcons.solidCircle,color: Colors.blueAccent,size: 18.0,),
                          SizedBox(width: 10.0),
                          Text('ACTIVE',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ))
              ],
            ),
            SizedBox(
              width: 15.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Single Family Recedensy',
                      style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.red),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      '\$352,200',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    AutoSizeText('2118 SUNSET VISTA Avenue',
                      style: TextStyle(
                        fontSize: 12.0,
                      ), maxLines: 2,),
                    Text('Henderson',
                        style: TextStyle(
                          fontSize: 13.0,
                        )),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      '3',
                      style: TextStyle(fontSize: 12.0),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Icon(
                      FontAwesomeIcons.bed,
                      color: Colors.grey,
                      size: 15.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 8.0),
                      child: Container(
                        color: Colors.black12,
                        height: 20,
                        width: 2,
                      ),
                    ),
//                    SizedBox(width: 20.0,),
                    Text(
                      '2',
                      style: TextStyle(fontSize: 12.0),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Icon(
                      FontAwesomeIcons.bath,
                      color: Colors.grey,
                      size: 15.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 8.0),
                      child: Container(
                        color: Colors.black12,
                        height: 20,
                        width: 2,
                      ),
                    ),
                    AutoSizeText(
                      '1188 sqft',
                      style: TextStyle(fontSize: 12.0),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        Divider(
          color: Colors.black,
          height: 10.0,
        ),
      ],
    );
  }
}
