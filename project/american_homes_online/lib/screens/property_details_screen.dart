import 'dart:async';
import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:shimmer/shimmer.dart';

const kExpansionTextHeaderStyle = TextStyle(
  fontWeight: FontWeight.bold,
  color: Colors.black,
  fontSize: 18.0,
);

const kExpansionTextCollabeStyle = TextStyle(
  fontWeight: FontWeight.bold,
  color: Colors.black,
  fontSize: 14.0,
);

class PropertyDetailsScreen extends StatefulWidget {
  static String id = 'PropertyDetailsScreen';

  final String image;
  final String pid;
  final String title;

  PropertyDetailsScreen({this.image, this.pid, this.title});

  @override
  _PropertyDetailsScreenState createState() =>
      _PropertyDetailsScreenState(image: image, pid: pid, title: title);
}

class _PropertyDetailsScreenState extends State<PropertyDetailsScreen> {
  bool showSpinner = false;
  final String image;
  final String pid;
  final String title;

  Completer<GoogleMapController> _controller = Completer();

  _PropertyDetailsScreenState({this.image, this.pid, this.title});

  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  CameraPosition _kGooglePlex;

  void _add(double lat, double long) {
    MarkerId markerId = MarkerId(pid);

    Marker marker = Marker(
      markerId: markerId,
      position: LatLng(
        lat,
        long,
      ),
//        infoWindow: InfoWindow(title: list[i].property_title, snippet: list[i].property_action_category),
      onTap: () {
//        _onMarkerTapped(markerId);
      },
    );
    markers[markerId] = marker;

//    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _kGooglePlex = CameraPosition(
      target: LatLng(0.0, 0.0),
      zoom: 5.0,
    );

    getPropertyDetails(pid);
  }

  List<Widget> featuresRows(List list) {
    print('check add list ${list.toString()}');
    List<Widget> featuresRows = List();

    for (int i = 0; i < list.length; i++) {
      featuresRows.add(Row(
        children: <Widget>[
          Icon(
            FontAwesomeIcons.check,
            size: 20.0,
            color: Colors.redAccent,
          ),
          SizedBox(
            width: 5.0,
          ),
          Text(list[i]),
        ],
      ));
    }

    return featuresRows;
  }

//
//  Future<List<CachedNetworkImageProvider>> _loadAllImages(List images) async {
//    List<CachedNetworkImageProvider> cachedImages = [];
//    for(int i=0;i<images.length;i++) {
//      var configuration = createLocalImageConfiguration(context);
//      cachedImages.add(new CachedNetworkImageProvider(images[i]['image'].toString())..resolve(configuration));
//    }
//    return cachedImages;
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 250.0,

            flexibleSpace: FlexibleSpaceBar(
//              title: Text(title),
              background: images == null
                  ? Hero(
                      tag: 'pro_img$pid',
                      child: Image.network(
                        image,
                        fit: BoxFit.cover,
                      ))
                  : Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return CachedNetworkImage(
                    imageUrl: images[index]['image'].toString(),
                    imageBuilder: (context, imageProvider) =>
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
//                                      colorFilter:
//                                      ColorFilter.mode(Colors.red, BlendMode.colorBurn)
                            ),
                          ),
                        ),
                    placeholder: (context, url) => Align(
                        alignment: Alignment.center,
                        child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        Icon(Icons.error),
                  );
                },
                itemCount: images.length,
                pagination: new SwiperPagination(),
                control: new SwiperControl(color: Colors.red),
              )
//              PageView.builder(
//                      itemCount: images.length,
//                      itemBuilder: (BuildContext context, int index) {
//                        return Container(
//                            child: Stack(
//                          children: <Widget>[
//                            CachedNetworkImage(
//                              imageUrl: images[index]['image'].toString(),
//                              imageBuilder: (context, imageProvider) =>
//                                  Container(
//                                decoration: BoxDecoration(
//                                  image: DecorationImage(
//                                    image: imageProvider,
//                                    fit: BoxFit.cover,
////                                      colorFilter:
////                                      ColorFilter.mode(Colors.red, BlendMode.colorBurn)
//                                  ),
//                                ),
//                              ),
//                              placeholder: (context, url) => Align(
//                                  alignment: Alignment.center,
//                                  child: CircularProgressIndicator()),
//                              errorWidget: (context, url, error) =>
//                                  Icon(Icons.error),
//                            ),
//                          ],
//                        ));
//                      }),
            ),

//              : Swiper(
//                itemBuilder: (BuildContext context, int index) {
//                  return Image.network(
//                    images[index]['image'].toString(),
//                    fit: BoxFit.fill,
//                  );
//                },
//                itemCount: images.length,
//                pagination: new SwiperPagination(),
//                control: new SwiperControl(color: Colors.red),
//              )
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              /*ACTIVE TAG*/ Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                'ACTIVE',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            color: Theme.of(context).primaryColor,
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                'LISTED 45 DAYS AGO',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            color: Theme.of(context).primaryColor,
                          ),
                        ],
                      ),
                      Text(
                        'AHO $pid',
                        style: TextStyle(
                            fontWeight: FontWeight.w700, color: Colors.black54),
                      )
                    ],
                  ),
                ),
              ),
              /*PRICE*/ Padding(
                padding: const EdgeInsets.all(8.0),
                child: property_details != null
                    ? Text(
                        property_details['price'],
                        style: TextStyle(
                            fontSize: 32.0, fontWeight: FontWeight.bold),
                      )
                    : getShimmer(30.0),
              ),
              /*DESCRIPTION*/ Padding(
                padding: const EdgeInsets.all(8.0),
                child: property_details != null
                    ? Text(
                        title,
                        style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black54,
                            fontWeight: FontWeight.w700),
                      )
                    : getShimmer(20.0),
              ),
              /*HORIZONTAL SCROLLVIEW*/ Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: <Widget>[
                      /*BEDROOMS*/ Container(
                        width: 80.0,
                        child: Column(
                          children: <Widget>[
                            property_details != null
                                ? Text(
                                    property_details['property_bedrooms'],
                                    style: TextStyle(
                                        fontSize: 19.0,
                                        fontWeight: FontWeight.bold),
                                  )
                                : getShimmer(20.0),
                            Text(
                              'Bedrooms',
                              style: TextStyle(color: Colors.black54),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.0, right: 8.0),
                        child: Container(
                          color: Colors.black12,
                          height: 40,
                          width: 2,
                        ),
                      ),
                      /*BATHROOMS*/ Container(
                        width: 80.0,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Column(
                            children: <Widget>[
                              property_details != null
                                  ? Text(
                                      property_details['property_bathrooms'],
                                      style: TextStyle(
                                          fontSize: 19.0,
                                          fontWeight: FontWeight.bold),
                                    )
                                  : getShimmer(20.0),
                              Text(
                                'Bathrooms',
                                style: TextStyle(color: Colors.black54),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.0, right: 8.0),
                        child: Container(
                          color: Colors.black12,
                          height: 40,
                          width: 2,
                        ),
                      ),
                      /*SqFt*/ Container(
                        width: 100.0,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Column(
                            children: <Widget>[
                              property_details != null
                                  ? Text(
                                      property_details['property_size']
                                          .toString()
                                          .replaceAll('ft<sup>2</sup>', '')
                                          .trim(),
                                      style: TextStyle(
                                          fontSize: 19.0,
                                          fontWeight: FontWeight.bold),
                                    )
                                  : getShimmer(20.0),
                              Text(
                                'SqFt',
                                style: TextStyle(color: Colors.black54),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.0, right: 8.0),
                        child: Container(
                          color: Colors.black12,
                          height: 40,
                          width: 2,
                        ),
                      ),
                      /*MAINTANANCE*/ Container(
                        width: 100.0,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Column(
                            children: <Widget>[
                              property_details != null
                                  ? Text(
                                      property_details['maintenance'],
                                      style: TextStyle(
                                          fontSize: 19.0,
                                          fontWeight: FontWeight.bold),
                                    )
                                  : getShimmer(20.0),
                              Text(
                                'Maintenance',
                                style: TextStyle(color: Colors.black54),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.0, right: 8.0),
                        child: Container(
                          color: Colors.black12,
                          height: 40,
                          width: 2,
                        ),
                      ),
                      /*YEAR*/ Container(
                        width: 80.0,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Column(
                            children: <Widget>[
                              property_details != null
                                  ? Text(
                                      property_details['property-year'],
                                      style: TextStyle(
                                          fontSize: 19.0,
                                          fontWeight: FontWeight.bold),
                                    )
                                  : getShimmer(20.0),
                              Text(
                                'Year',
                                style: TextStyle(color: Colors.black54),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                color: Colors.black,
              ),
              /*SEND BUTTONS*/ Container(
                color: Colors.black12,
                height: 60.0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    InkWell(
                      child: Container(
                        width: 120.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.sms,
                              color: Colors.black45,
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text('Send by SMS',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black45))
                          ],
                        ),
                      ),
                      onTap: () {
                        String message = "This is message goes to agent!";
                        List<String> recipents = [agent['agent_mobile']];

                        _sendSMS(message, recipents);
                      },
                    ),
                    InkWell(
                      child: Container(
                        width: 120.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(FontAwesomeIcons.solidEnvelopeOpen,
                                color: Colors.black45),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              'Send by Mail',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black45),
                            )
                          ],
                        ),
                      ),
                      onTap: () async {
                        final Email email = Email(
                          body: 'Email body',
                          subject: 'Email subject',
                          recipients: ['example@example.com'],
                          cc: ['cc@example.com'],
                          bcc: ['bcc@example.com'],
//                          attachmentPath: '/path/to/attachment.zip',
                          isHTML: false,
                        );

                        await FlutterEmailSender.send(email);
                      },
                    ),
                    InkWell(
                      child: Container(
                        width: 120.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(FontAwesomeIcons.print, color: Colors.black45),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text('Print',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black45))
                          ],
                        ),
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.black,
              ),
              /*GOOGLE MAP*/ Container(
                height: 150.0,
                child: Container(
                  color: Colors.black12,
                  alignment: Alignment.center,
                  child: GoogleMap(
                    mapType: MapType.normal,
                    initialCameraPosition: _kGooglePlex,
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                    markers: Set<Marker>.of(markers.values),
                  ),
                ),
              ),
              Divider(
                color: Colors.black,
              ),
              /*STREET VIEW*/ Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        alignment: Alignment.center,
                        height: 40.0,
                        child: Text(
                          'VIEW MAP',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.black54),
                        )),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 8.0),
                      child: Container(
                        color: Colors.black12,
                        height: 30,
                        width: 2,
                      ),
                    ),
                    Container(
                        alignment: Alignment.center,
                        height: 40.0,
                        child: Text(
                          'STREET VIEW',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.black54),
                        )),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 8.0),
                      child: Container(
                        color: Colors.black12,
                        height: 30,
                        width: 2,
                      ),
                    ),
                    Container(
                        alignment: Alignment.center,
                        height: 40.0,
                        child: Text(
                          'DIRECTION',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.black54),
                        )),
                  ],
                ),
              ),
              Divider(
                color: Colors.black,
              ),
              /*DESCRIPTION*/ Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Public remarks', style: kExpansionTextHeaderStyle),
                      Text(property_desc,
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.w300)),
                    ],
                  ),
                ),
              ),

              /*Address Details*/ ExpansionTile(
                title: Text(
                  'Address Details',
                  style: kExpansionTextHeaderStyle,
                ),
                initiallyExpanded: false,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Address:',
                              style: kExpansionTextCollabeStyle,
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              'City:',
                              style: kExpansionTextCollabeStyle,
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text('Area:', style: kExpansionTextCollabeStyle),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text('State/County:',
                                style: kExpansionTextCollabeStyle),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text('Zip:', style: kExpansionTextCollabeStyle),
                          ],
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: 200.0,
                              child: Text(
                                address_details == null
                                    ? ''
                                    : address_details['property_address']
                                        .toString(),
                                maxLines: 1,
                              ),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(address_details == null
                                ? ''
                                : address_details['property_city'].toString()),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(address_details == null
                                ? ''
                                : address_details['property_area'].toString()),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(address_details == null
                                ? ''
                                : address_details['property_country']
                                    .toString()),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(address_details == null
                                ? ''
                                : address_details['property_zip'].toString()),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
              /*property_details*/ ExpansionTile(
                title:
                    Text('Property Details', style: kExpansionTextHeaderStyle),
                initiallyExpanded: false,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Property Id:',
                              style: kExpansionTextCollabeStyle,
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              'Price:',
                              style: kExpansionTextCollabeStyle,
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text('Maintenance:',
                                style: kExpansionTextCollabeStyle),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text('Property Size:',
                                style: kExpansionTextCollabeStyle),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text('Rooms:', style: kExpansionTextCollabeStyle),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text('Bedrooms:',
                                style: kExpansionTextCollabeStyle),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text('Bathrooms:',
                                style: kExpansionTextCollabeStyle),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text('Year Built:',
                                style: kExpansionTextCollabeStyle),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text('Available From:',
                                style: kExpansionTextCollabeStyle),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text('External Construction:',
                                style: kExpansionTextCollabeStyle),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text('Exterior Material:',
                                style: kExpansionTextCollabeStyle),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text('Structure Type:',
                                style: kExpansionTextCollabeStyle),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text('Floors No:',
                                style: kExpansionTextCollabeStyle),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text('Building Name:',
                                style: kExpansionTextCollabeStyle),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text('Building Type:',
                                style: kExpansionTextCollabeStyle),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text('Apt.#:', style: kExpansionTextCollabeStyle),
                          ],
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(property_details != null
                                ? property_details['property_id']
                                : ''),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(property_details != null
                                ? property_details['price']
                                : ''),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(property_details != null
                                ? property_details['maintenance']
                                : ''),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(property_details != null
                                ? property_details['property_size']
                                    .toString()
                                    .replaceAll('ft<sup>2</sup>', '')
                                : ''),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(property_details != null
                                ? property_details['property_rooms']
                                : ''),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(property_details != null
                                ? property_details['property_bedrooms']
                                : ''),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(property_details != null
                                ? property_details['property_bathrooms']
                                : ''),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(property_details != null
                                ? property_details['property-year']
                                : ''),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(property_details != null
                                ? property_details['propertydate']
                                : ''),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(property_details != null
                                ? property_details[
                                    'property_external_construction']
                                : ''),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(property_details != null
                                ? property_details['exterior-material']
                                : ''),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(property_details != null
                                ? property_details['structure_type']
                                : ''),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(property_details != null
                                ? property_details['floor_no']
                                : ''),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(property_details != null
                                ? property_details['building_name']
                                : ''),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(property_details != null
                                ? property_details['building_type']
                                : ''),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(property_details != null
                                ? property_details['property_appartment_no']
                                : ''),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
              /*feature*/ ExpansionTile(
                title: Text('Featues', style: kExpansionTextHeaderStyle),
                initiallyExpanded: false,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: featureList != null
                          ? featuresRows(featureList)
                          : <Widget>[],
                    ),
                  )
                ],
              ),
              /*community*/ ExpansionTile(
                title: Text('Community', style: kExpansionTextHeaderStyle),
                initiallyExpanded: false,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: communityList != null
                          ? featuresRows(communityList)
                          : <Widget>[],
                    ),
                  )
                ],
              ),
              /*pets*/ ExpansionTile(
                title: Text('Pets', style: kExpansionTextHeaderStyle),
                initiallyExpanded: false,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: petsList != null
                          ? featuresRows(petsList)
                          : <Widget>[],
                    ),
                  )
                ],
              ),
              /*floor*/ ExpansionTile(
                title: Text('Floor', style: kExpansionTextHeaderStyle),
                initiallyExpanded: false,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: floorList != null
                          ? featuresRows(floorList)
                          : <Widget>[],
                    ),
                  )
                ],
              ),
              Container(
                height: 60.0,
                color: Colors.black12,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
//                        agent=!null?agent['agent_name']:'',
                        agent != null ? agent['agent_name'].toString() : '',
                        style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.black45,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
//                        agent=!null?agent['agent_mobile']:'',
                        agent != null ? agent['agent_mobile'].toString() : '',
                        style: TextStyle(color: Colors.black45),
                      ),
                    ],
                  ),
                ),
              )
            ]),
          )
        ],
      ),
    );
  }

//
  dynamic address_details;
  dynamic property_details;
  dynamic agent;
  List images;
  List featureList;
  List communityList;
  List petsList;
  List floorList;

//  dynamic agent;
  String property_title = '',
      property_desc = '',
      price = '',
      feature = '',
      community = '',
      pets = '',
      floor = '';

  Future<String> getPropertyDetails(String id) async {
    print('========= getPropertyDetails ===========$id');
    var response = await http.get(
        'https://americanhomesonline.com/wp-json/api/v1/Property_Details/?secret_key=yQTTspWXd530xNAEnBKkMFNFuBbKG6kd&property_id=$id');

    print(response.body);
    setState(() {
      dynamic data = json.decode(response.body)['data'];

      if (response.statusCode == 200) {
        address_details = data['address_details'];
        property_details = data['property_details'];
        property_title = data['property_title'];
        property_desc = data['property_desc'];
        feature = data['feature'];
        community = data['community'];
        pets = data['pets'];
        floor = data['floor'];
        agent = data['agent'];
        images = data['images'];

        featureList = feature.split(",").toList();
        communityList = community.split(",").toList();
        petsList = pets.split(",").toList();
        floorList = floor.split(",").toList();

        print('Features ${featureList[0]}');

        String latitude = address_details['property_latitude'];
        String longitude = address_details['property_longitude'];

        _add(double.parse(latitude), double.parse(longitude));

        _goToTheLake(double.parse(latitude), double.parse(longitude));

//        _add(address_details['property_latitude'],
//            address_details['property_longitude']);

        setState(() {
          showSpinner = false;
        });
      } else {
        showSpinner = false;
        throw Exception('Failed to load photos');
      }
    });

    return "Success!";
  }

  Future<void> _goToTheLake(double latitude, double longitude) async {
    _kGooglePlex = CameraPosition(
      target: LatLng(latitude, longitude),
      zoom: 12.0,
    );

    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kGooglePlex));
  }

  void _sendSMS(String message, List<String> recipents) async {
    String _result =
        await FlutterSms.sendSMS(message: message, recipients: recipents)
            .catchError((onError) {
      print(onError);
    });
    print(_result);
  }

  Shimmer getShimmer(double height) {
    return Shimmer.fromColors(
      highlightColor: Colors.white,
      baseColor: Colors.grey[300],
      child: Container(
        width: 30.0,
        height: height,
        color: Colors.red,
      ),
      period: Duration(milliseconds: 800),
    );
  }
}
