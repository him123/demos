import 'package:american_homes_online/screens/input_property_one.dart';
import 'package:american_homes_online/screens/input_property_two.dart';
import 'package:flutter/material.dart';

class AddPropertyScreen extends StatefulWidget {
  @override
  _AddPropertyScreenState createState() => _AddPropertyScreenState();
}

class _AddPropertyScreenState extends State<AddPropertyScreen> {
  var controller = PageController(
    initialPage: 1,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add new property'),
      ),
      body: ListView(
        controller: controller,
        children: <Widget>[
          /*Property Description*/ Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                    width: 2.0, color: Theme.of(context).primaryColor),
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
                            'Property Description',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        SizedBox(height: 5.0,),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'This description will appear first in page. Keeping it as a brief overview makes it easier to read.',
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
                  /*FIRST NAME*/ Container(
                    width: 300.0,
                    child: Column(
                      children: <Widget>[
                        TextFormField(

//                      controller: titleController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              filled: true,
                              labelText:
                              'Title/Position',
                              fillColor: Colors.white),

                        ),
                        SizedBox(height: 10.0,),
                        TextFormField(
//                      controller: titleController,
                          decoration: InputDecoration(

                              border: OutlineInputBorder(),
                              filled: true,
                              labelText:
                              'Description',
                              fillColor: Colors.white),
                        ),
                      ],
                    )
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
          /*Property Price*/ Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                    width: 2.0, color: Theme.of(context).primaryColor),
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
                            'Property Price',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        SizedBox(height: 5.0,),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Adding a price will make it easier for users to find your property in search results',
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
                  /*FIRST NAME*/ Container(
                      width: 300.0,
                      child: Column(
                        children: <Widget>[
                          TextFormField(

//                      controller: titleController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                filled: true,
                                labelText:
                                'Price in \$ (only numbers)',
                                fillColor: Colors.white),

                          ),
                          SizedBox(height: 10.0,),
                          TextFormField(
//                      controller: titleController,
                            decoration: InputDecoration(

                                border: OutlineInputBorder(),
                                filled: true,
                                labelText:
                                'Taxes in \$',
                                fillColor: Colors.white),
                          ),
                          SizedBox(height: 10.0,),
                          TextFormField(
//                      controller: titleController,
                            decoration: InputDecoration(

                                border: OutlineInputBorder(),
                                filled: true,
                                labelText:
                                'Maintenance in \$',
                                fillColor: Colors.white),
                          ),
                        ],
                      )
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
          /*Select Categories*/ Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                    width: 2.0, color: Theme.of(context).primaryColor),
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
                            'Select Categories',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        SizedBox(height: 5.0,),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Selecting a category will make it easier for users to find you property in search results.',
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
                  /*FIRST NAME*/ Container(
                      width: 300.0,
                      child: Column(
                        children: <Widget>[
                          TextFormField(

//                      controller: titleController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                filled: true,
                                labelText:
                                'Category',
                                fillColor: Colors.white),

                          ),
                          SizedBox(height: 10.0,),
                          TextFormField(
//                      controller: titleController,
                            decoration: InputDecoration(

                                border: OutlineInputBorder(),
                                filled: true,
                                labelText:
                                'Listed In',
                                fillColor: Colors.white),
                          ),
                        ],
                      )
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
          /*Listing Media*/ Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                    width: 2.0, color: Theme.of(context).primaryColor),
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
                        SizedBox(height: 5.0,),
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
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
          /*Listing Location*/ Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                    width: 2.0, color: Theme.of(context).primaryColor),
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
                            'Listing Location',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        SizedBox(height: 5.0,),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Use the button to save your property location on the map as well.',
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
                  /*FIRST NAME*/ Container(
                      width: 300.0,
                      child: Column(
                        children: <Widget>[
                          TextFormField(

//                      controller: titleController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                filled: true,
                                labelText:
                                '*Address',
                                fillColor: Colors.white),

                          ),
                          SizedBox(height: 10.0,),
                          TextFormField(
//                      controller: titleController,
                            decoration: InputDecoration(

                                border: OutlineInputBorder(),
                                filled: true,
                                labelText:
                                'County / State',
                                fillColor: Colors.white),
                          ),
                          SizedBox(height: 10.0,),
                          TextFormField(
//                      controller: titleController,
                            decoration: InputDecoration(

                                border: OutlineInputBorder(),
                                filled: true,
                                labelText:
                                'City',
                                fillColor: Colors.white),
                          ),
                          SizedBox(height: 10.0,),
                          TextFormField(
//                      controller: titleController,
                            decoration: InputDecoration(

                                border: OutlineInputBorder(),
                                filled: true,
                                labelText:
                                'Neighborhood',
                                fillColor: Colors.white),
                          ),
                          SizedBox(height: 10.0,),
                          TextFormField(
//                      controller: titleController,
                            decoration: InputDecoration(

                                border: OutlineInputBorder(),
                                filled: true,
                                labelText:
                                'Zip',
                                fillColor: Colors.white),
                          ),
                          SizedBox(height: 10.0,),
                          TextFormField(
//                      controller: titleController,
                            decoration: InputDecoration(

                                border: OutlineInputBorder(),
                                filled: true,
                                labelText:
                                'Country',
                                fillColor: Colors.white),
                          ),
                        ],
                      )
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
          /*Listing Details*/ Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                    width: 2.0, color: Theme.of(context).primaryColor),
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
                            'Listing Details',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        SizedBox(height: 5.0,),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Add a little more info about your property.',
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
                  /*FIRST NAME*/ Container(
                      width: 300.0,
                      child: Column(
                        children: <Widget>[
                          TextFormField(

//                      controller: titleController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                filled: true,
                                labelText:
                                '*Address',
                                fillColor: Colors.white),

                          ),
                          SizedBox(height: 10.0,),
                          TextFormField(
//                      controller: titleController,
                            decoration: InputDecoration(

                                border: OutlineInputBorder(),
                                filled: true,
                                labelText:
                                'County / State',
                                fillColor: Colors.white),
                          ),
                          SizedBox(height: 10.0,),
                          TextFormField(
//                      controller: titleController,
                            decoration: InputDecoration(

                                border: OutlineInputBorder(),
                                filled: true,
                                labelText:
                                'City',
                                fillColor: Colors.white),
                          ),
                          SizedBox(height: 10.0,),
                          TextFormField(
//                      controller: titleController,
                            decoration: InputDecoration(

                                border: OutlineInputBorder(),
                                filled: true,
                                labelText:
                                'Neighborhood',
                                fillColor: Colors.white),
                          ),
                          SizedBox(height: 10.0,),
                          TextFormField(
//                      controller: titleController,
                            decoration: InputDecoration(

                                border: OutlineInputBorder(),
                                filled: true,
                                labelText:
                                'Zip',
                                fillColor: Colors.white),
                          ),
                          SizedBox(height: 10.0,),
                          TextFormField(
//                      controller: titleController,
                            decoration: InputDecoration(

                                border: OutlineInputBorder(),
                                filled: true,
                                labelText:
                                'Country',
                                fillColor: Colors.white),
                          ),
                        ],
                      )
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
        ],
      ),
    );
  }
}
