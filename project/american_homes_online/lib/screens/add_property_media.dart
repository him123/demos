import 'dart:convert';
import 'dart:io';

import 'package:american_homes_online/model/property_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';

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

  List<File> _imageFileArr = [];
  List<String> _imageArr = ['images/agent.png', 'images/aho_logo.jpg'];
  List<String> attachedList=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print('I got from first ${widget.propertyModel.user_id}');
    print('I got from price ${widget.propertyModel.property_price}');
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
                Container(
                  height: 250.0,
                  width: 400.0,
                  child: Swiper(
                    key: UniqueKey(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return _imageFileArr.length == 0
                          ? Text('upload images')
                          : Image.file(
                              _imageFileArr[index],
                              width: 350,
                              height: 200,
                              fit: BoxFit.cover,
                            );
                    },
                    itemCount:
                        _imageFileArr.length == 0 ? 0 : _imageFileArr.length,
                    pagination: new SwiperPagination(),
                    control: new SwiperControl(color: Colors.red),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      _openImagePickerModal(context);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 200.0,
                      height: 40.0,
                      color: Colors.red,
                      child: _isUploading == true
                          ? CircularProgressIndicator(backgroundColor: Colors.white,)
                          : Text('ADD MEDIA',
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
//                widget.propertyModel.attached = attachedList.join(', ');
                widget.propertyModel.attachid = attachedList.join(', ');
                widget.propertyModel.attachthumb = '';
                widget.propertyModel.embed_video_type = '';
                widget.propertyModel.embed_video_id = '';
                widget.propertyModel.embed_virtual_tour = '';

                print('images ids: ${widget.propertyModel.attached}');

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

  // To track the file uploading state
  bool _isUploading = false;

  String baseUrl =
      'https://americanhomesonline.com/wp-json/api/v1/Property_Images/?secret_key=yQTTspWXd530xNAEnBKkMFNFuBbKG6kd';

  Future<Map<String, dynamic>> _uploadImage(File image) async {
    setState(() {
      _isUploading = true;
    });

    // Find the mime type of the selected file by looking at the header bytes of the file
    final mimeTypeData =
        lookupMimeType(image.path, headerBytes: [0xFF, 0xD8]).split('/');

    // Intilize the multipart request
    final imageUploadRequest =
        http.MultipartRequest('POST', Uri.parse(baseUrl));

    print(image.path);
    // Attach the file in the request
    final file = await http.MultipartFile.fromPath('upload_img', image.path,
        contentType: MediaType(mimeTypeData[0], mimeTypeData[1]));

    imageUploadRequest.fields['ext'] = mimeTypeData[1];

    imageUploadRequest.files.add(file);

    try {
      final streamedResponse = await imageUploadRequest.send();

      final response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode != 200) {

        return null;
      }else{
        dynamic data = json.decode(response.body)['data'];
        print('Data: $data');
        int attach = data['attach'];
        print('check ID: $attach');

        attachedList.add(attach.toString());
      }

      final Map<String, dynamic> responseData = json.decode(response.body);

      _resetState();

      return responseData;
    } catch (e) {
      print(e);
      return null;
    }
  }

  void _startUploading(BuildContext context) async {
    final Map<String, dynamic> response = await _uploadImage(_imageFile);
    print(response);
    // Check if any error occured
//    if (response == null || response.containsKey("error")) {
//      Toast.show("Image Upload Failed!!!", context,
//          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
//    } else {
//      Toast.show("Image Uploaded Successfully!!!", context,
//          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
//    }
  }

  void _resetState() {
    setState(() {
      _isUploading = false;
      _imageFile = null;
    });
  }

  void _openImagePickerModal(BuildContext context) {
    final flatButtonColor = Theme.of(context).primaryColor;
    print('Image Picker Modal Called');
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 150.0,
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Text(
                  'Pick an image',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10.0,
                ),
                FlatButton(
                  textColor: flatButtonColor,
                  child: Text('Use Camera'),
                  onPressed: () {
                    _getImage(context, ImageSource.camera);
                  },
                ),
                FlatButton(
                  textColor: flatButtonColor,
                  child: Text('Use Gallery'),
                  onPressed: () {
                    _getImage(context, ImageSource.gallery);
                  },
                ),
              ],
            ),
          );
        });
  }

  void _getImage(BuildContext context, ImageSource source) async {
    File image = await ImagePicker.pickImage(source: source);

    setState(() {
      _imageFile = image;
      _imageFileArr.add(_imageFile);
    });

    _startUploading(context);
    // Closes the bottom sheet
    Navigator.pop(context);
  }
}
