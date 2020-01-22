import 'dart:io';

import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:path/path.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class RegisterScreenSaray extends StatefulWidget {
  static String id = 'RegisterScreen';

  @override
  _RegisterScreenSarayState createState() => _RegisterScreenSarayState();
}

class _RegisterScreenSarayState extends State<RegisterScreenSaray> {
  bool showSpinner = false;

//  Future<File> imageFile;
  String name, address, email, pass, phone;
  File _imageFile;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;

  TextEditingController nameCntrlr = TextEditingController();
  TextEditingController emailCntrlr = TextEditingController();
  TextEditingController addressCntrlr = TextEditingController();
  TextEditingController phoneCntrlr = TextEditingController();
  TextEditingController passwordCntrlr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Register'),
      ),
      backgroundColor: Color(0xFFF7F7F7),
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            autovalidate: _autoValidate,
            child: ListView(
//            crossAxisAlignment: CrossAxisAlignment.center,
//            mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
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

                FlatButton(
                  color: Colors.red,
                  onPressed: (){
                    setState(() {
                      showSpinner=true;
                    });
                    createPost(context);
                  },
                  child: Text('Upload Image'),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Center(
                  child: Text(
                    'Please Select Image',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _getImage(BuildContext context, ImageSource source) {
    ImagePicker.pickImage(source: source, maxWidth: 400.0).then((File image) {
      setState(() {
        _imageFile = image;
        print('image path: ${_imageFile.path}');
      });

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

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }

  void createPost(BuildContext context) async {
    print('post called');
    var request = http.MultipartRequest('POST', Uri.parse('https://americanhomesonline.com/wp-json/api/v1/Property_Images/?secret_key=yQTTspWXd530xNAEnBKkMFNFuBbKG6kd'));

    if (_imageFile != null) {
      var stream =
          new http.ByteStream(DelegatingStream.typed(_imageFile.openRead()));
      final length = await _imageFile.length();
      var multiPartImage = http.MultipartFile('upload_img', stream, length,
          filename: basename(_imageFile.path));
      request.files.add(multiPartImage);
    }

    print('====================FILE${_imageFile.path}');

    request.fields['method'] = 'register_customer';
    request.fields['name'] = 'Rajan';
    request.fields['email'] = 'vaja@gmail.com';
    request.fields['password'] = '123456';
    request.fields['address'] = 'fdafdjjdas';
    request.fields['phone'] = '56467645465';
    request.fields['fcmtoken'] = 'd4as56f4a56sd4f5a4sd564';

    http.Response response =
        await http.Response.fromStream(await request.send());

    print(response.body);

//    String image = json.decode(response.body)['profile_image'];
//    int id = json.decode(response.body)['user_id'];
//    String nameUser = json.decode(response.body)['name'];
//    String tookEmail = json.decode(response.body)['email'];
//    String tookAddress = json.decode(response.body)['address'];
//    String tookNumber = json.decode(response.body)['phone'];
//
//    SharedPreferences prefs = await SharedPreferences.getInstance();
//
//    prefs.setString('profile_image', image);
//    prefs.setString('name', nameUser);
//    prefs.setString('id', id.toString());
//    prefs.setString('email', tookEmail);
//    prefs.setString('address', tookAddress);
//    prefs.setString('phone', tookNumber);
//    prefs.setString('login', '1');
//
//    print(prefs.getString('profile_image'));

    setState(() {
      showSpinner = false;
    });

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

  void showAlert(BuildContext context, String msg) {
    Alert(
      context: context,
//      type: AlertType.info,
      title: msg,
//      desc: msg,
      buttons: [
        DialogButton(
          child: Text(
            "OK",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          width: 120,
        )
      ],
    ).show();
  }
}
