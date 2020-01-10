import 'dart:convert';
import 'dart:io';

import 'package:american_homes_online/model/property_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import 'package:path/path.dart';

const String imgUploadUrl =
    'https://americanhomesonline.com/test.php';

class AddPropertyMedia extends StatefulWidget {
  const AddPropertyMedia({
    @required this.data,
    @required this.str,
    @required this.propertyModel,
    @required this.onDataChange,
    Key key,
  }) : super(key: key);

  final int data;
  final String str;
  final PropertyModel propertyModel;
  final Function(int, String, PropertyModel) onDataChange;

  @override
  _AddPropertyMediaState createState() => _AddPropertyMediaState();
}

class _AddPropertyMediaState extends State<AddPropertyMedia> {
  List<String> spProStatus = [
    'Vimeo',
    'Youtube',
  ];
  String spProStaVal = 'Vimeo', selectedProSta = '';
  File _imageFile;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print('I got from first ${widget.propertyModel.user_id}');
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        /*Listing Media*/ Padding(
          padding: EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              border:
                  Border.all(width: 2.0, color: Theme.of(context).primaryColor),
            ),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Listing Media',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'You can select multiple images to upload at one time.',
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      _openImagePicker(context);
                    },
                    child: CircleAvatar(
                      radius: 60.0,
                      backgroundColor: Theme.of(context).primaryColor,
                      child: ClipOval(
                        child: _imageFile != null
                            ? Image.file(
                                _imageFile,
                                width: 200,
                                height: 200,
                                fit: BoxFit.cover,
                              )
                            : Icon(
                                Icons.camera_alt,
                                size: 60.0,
                                color: Theme.of(context).accentColor,
                              ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      _openImagePicker(context);
//                      testPost(context, imgUploadUrl);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 200.0,
                      height: 40.0,
                      color: Colors.red,
                      child: Text('MEDIA',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 16.0)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            '* At least 1 image is required for a valid submission.Minimum size is 500/500px. You can upload maximum 10 images'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            '** Double click on the image to select featured.'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:
                            Text('*** Change images order with Drag & Drop.'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('**** PDF files upload supported as well.'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            '***** Images might take longer to be processed.'),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: double.infinity,
                )
              ],
            ),
          ),
        ),
        /*Video Option*/ Padding(
          padding: EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              border:
                  Border.all(width: 2.0, color: Theme.of(context).primaryColor),
            ),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Video Option',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Add just the video ID from the vimeo or youtube url.',
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                /*Video from*/ Container(
                  color: Colors.white,
                  width: 150.0,
                  height: 30.0,
                  child: Container(
                    alignment: Alignment.center,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1.0, style: BorderStyle.solid),
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),
                    ),
                    child: DropdownButton<String>(
                      value: spProStaVal,
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          inherit: false,
                          decorationColor: Colors.black),
//                  underline: Container(
//                    height: 2,
//                    color: Colors.deepPurpleAccent,
//                  ),

                      onChanged: (String data) {
                        setState(() {
                          spProStaVal = data;
                          selectedProSta = spProStaVal;
                        });
                      },
                      items: spProStatus
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                /*URL*/ Padding(
                  padding: const EdgeInsets.only(
                      top: 0.0, right: 15.0, left: 15.0, bottom: 10.0),
                  child: Container(
                    width: 350.0,
                    height: 40.0,
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          filled: true,
                          labelText: 'Embed Video id:',
                          fillColor: Colors.white),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                )
              ],
            ),
          ),
        ),
        /*NEXT*/ Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            InkWell(
              onTap: () {
                widget.onDataChange(
                    0, 'This is title of property', widget.propertyModel);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.center,
                  width: 150.0,
                  height: 40.0,
                  color: Colors.red,
                  child: Text('Previous',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 16.0)),
                ),
              ),
            ),
            InkWell(
              onTap: () {
//                var pModel = PropertyModel();

                widget.propertyModel.attached = '1235';
                widget.propertyModel.attachthumb = '';
                widget.propertyModel.embed_video_type = '';
                widget.propertyModel.embed_video_id = '';
                widget.propertyModel.embed_virtual_tour = '';

                widget.onDataChange(
                    2, 'This is title of property', widget.propertyModel);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.center,
                  width: 150.0,
                  height: 40.0,
                  color: Colors.red,
                  child: Text('Next',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 16.0)),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  Upload(
    File imageFile,
    String url,
  ) async {
    var stream =
        new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    var length = await imageFile.length();

    var uri = Uri.parse(url);

    var request = new http.MultipartRequest("POST", uri);
    var multipartFile = new http.MultipartFile('upload_img', stream, length,
        filename: basename(imageFile.path));
    //contentType: new MediaType('image', 'png'));

    request.files.add(multipartFile);
    var response = await request.send();
    print(response.statusCode);
    response.stream.transform(utf8.decoder).listen((value) {
      print(value);
    });
  }

  void createPost(BuildContext context, String url, File _imageFile) async {
    print('====post method called =====');
    var request = http.MultipartRequest('POST', Uri.parse(url));

//    if (_imageFile != null) {
//      var stream =
//          new http.ByteStream(DelegatingStream.typed(_imageFile.openRead()));
//      final length = await _imageFile.length();
//      var multiPartImage = http.MultipartFile('upload_img', stream, length,
//          filename: basename(_imageFile.path));
//      request.files.add(multiPartImage);
//    }

//    print('====================FILE$_imageFile');
    request.fields['upload_img'] = 'This is test from flutter';
//    request.fields['name'] = name;
//    request.fields['email'] = email;
//    request.fields['password'] = pass;
//    request.fields['address'] = address;
//    request.fields['phone'] = phone;
//    request.fields['fcmtoken'] = 'd4as56f4a56sd4f5a4sd564';

    http.Response response =
        await http.Response.fromStream(await request.send());
//
    print('FResponse: ${response.body}');
//
//    String image = json.decode(response.body)['profile_image'];
//    int id = json.decode(response.body)['user_id'];
//    String nameUser = json.decode(response.body)['name'];
//    String tookEmail = json.decode(response.body)['email'];
//    String tookAddress = json.decode(response.body)['address'];
//    String tookNumber = json.decode(response.body)['phone'];
//
//    SharedPreferences prefs = await SharedPreferences.getInstance();

//    prefs.setString('profile_image', image);
//    prefs.setString('name', nameUser);
//    prefs.setString('id', id.toString());
//    prefs.setString('email', tookEmail);
//    prefs.setString('address', tookAddress);
//    prefs.setString('phone', tookNumber);
//    prefs.setString('login', '1');
//
//    print(prefs.getString('profile_image'));
//
//    setState(() {
//      showSpinner = false;
//    });

//    Navigator.pop(context);
//    Navigator.of(context).pushReplacementNamed(NavigationDashboard.id);

//    Navigator.push(
//        context,
//        new MaterialPageRoute(
//          builder: (ctxt) => new NavigationDashboard(
//            profileImage: image,
//            address: address,
//            phone: phone,
//            email: email,
//            name: nameUser,
//            custId: id.toString(),
//          ),
//        ));
  }

  void _getImage(BuildContext context, ImageSource source) {
    ImagePicker.pickImage(source: source, maxWidth: 400.0).then((File image) {
      setState(() {
        _imageFile = image;
      });

//      createPost(context, imgUploadUrl, _imageFile);

//      Upload(_imageFile, imgUploadUrl);
      testPost(context, imgUploadUrl);

      Navigator.pop(context);
    });
  }

  void _openImagePicker(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 150.0,
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Text(
                  'Pick an Image',
                  style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10.0,
                ),
                FlatButton(
                  textColor: Theme.of(context).accentColor,
                  onPressed: () {
                    _getImage(context, ImageSource.camera);
                  },
                  child: Text('User Camera'),
                ),
                FlatButton(
                  textColor: Theme.of(context).accentColor,
                  onPressed: () {
                    _getImage(context, ImageSource.gallery);
                  },
                  child: Text('User Gallery'),
                ),
              ],
            ),
          );
        });
  }

  void testPost(BuildContext context, String url,) async {
    var request = http.MultipartRequest('POST', Uri.parse(url));

    if (_imageFile != null) {
      var stream =
      new http.ByteStream(DelegatingStream.typed(_imageFile.openRead()));
      final length = await _imageFile.length();
      var multiPartImage = http.MultipartFile('upload_img', stream, length,
          filename: basename(_imageFile.path));
//      final headers = {'Content-Type': 'multipart/form-data; boundary=MultipartBoundry',
//      'secret_key':'yQTTspWXd530xNAEnBKkMFNFuBbKG6kd'};
//      request.headers.addAll(headers);
      request.files.add(multiPartImage);

//      secret_key=yQTTspWXd530xNAEnBKkMFNFuBbKG6kd
    }

    print('====================FILE$_imageFile');


//    Map<String, dynamic> body = {
//      'upload_img': imageFile,
//      'testtext': 'This is flutter'
//    };
//
//    String jsonBody = json.encode(body);
//    final encoding = Encoding.getByName('utf-8');
//
//    final headers = {'Content-Type': 'application/json'};

//    Map<String, String> headers = { "Content-Type": "application/json"};
//    request.headers.addAll(headers);

//    request.fields['upload_img'] = imageFile;
    request.fields['testtext'] = 'Flitter is this';

//

//
    print('Request: ${request.fields.toString()}');

//    Response response = await post(
//      Uri.parse(url),
//      headers: headers,
//      body: jsonBody,
//      encoding: encoding,
//    );
//
//    int statusCode = response.statusCode;
//    String responseBody = response.body;

    http.Response response =
        await http.Response.fromStream(await request.send());

    print('FResponse ${response.body}}');
  }
}
