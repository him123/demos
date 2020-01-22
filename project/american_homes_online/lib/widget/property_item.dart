import 'package:american_homes_online/screens/property_details_screen.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PropertyItem extends StatelessWidget {
  final String property_id;
  final String property_image;
  final String price;
  final String property_title;
  final String property_address;
  final String property_action_category;
  final String property_rooms;
  final String property_bedrooms;
  final String property_size;
  final String property_latitude;
  final String property_longitude;

  PropertyItem(
      {this.property_id,
      this.property_image,
      this.price,
      this.property_title,
      this.property_address,
      this.property_action_category,
      this.property_rooms,
      this.property_bedrooms,
      this.property_size,
      this.property_latitude,
      this.property_longitude});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('Image $property_image id $property_id title $property_title');

        Navigator.push(
            context,
            PageRouteBuilder(
                transitionDuration: Duration(seconds: 1),
                pageBuilder: (_, __, ___) => PropertyDetailsScreen(
                      image: property_image,
                      pid: property_id,
                      title: property_title,
                    ),
                transitionsBuilder:
                    (_, Animation<double> animation, __, Widget child) {
                  return new FadeTransition(opacity: animation, child: child);
                }));
      },
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Hero(
                    tag: 'pro_img$property_id',
                    child: Image.network(
                      property_image,
                      width: 150.0,
                      height: 115.0,
                      fit: BoxFit.cover,
                    ),
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
                            Icon(
                              FontAwesomeIcons.solidCircle,
                              color: Colors.blueAccent,
                              size: 18.0,
                            ),
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 150.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: 150.0,
                            child: Text(
                              property_title,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.red),
                              maxLines: 1,
                            ),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Text(
                            price,
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                            maxLines: 1,
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Container(
                            width: 150.0,
                            child: AutoSizeText(
                              property_address,
                              style: TextStyle(
                                fontSize: 12.0,
                              ),
                              maxLines: 1,
                            ),
                          ),
                          Container(
                            width: 150,
                            child: Text(
                              property_action_category,
                              style: TextStyle(
                                fontSize: 13.0,
                              ),
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Text(
                          property_bedrooms,
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
                          property_rooms,
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
                          property_size.replaceAll('<sup>2</sup>', ''),
                          style: TextStyle(fontSize: 12.0),
                        ),
                      ],
                    ),
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
      ),
    );
  }
}
