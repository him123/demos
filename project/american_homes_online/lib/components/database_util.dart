import 'dart:async';
import 'dart:io';

import 'package:american_homes_online/model/property_model.dart';
import 'package:american_homes_online/model/saved_search.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  DBProvider._();

  static final DBProvider db = DBProvider._();

  Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    // if _database is null we instantiate it
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "Aho.db");

    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {

      await db.execute("CREATE TABLE saved_search ("
          "id INTEGER PRIMARY KEY,"
          "url TEXT,"
          "name TEXT,"
          "filter TEXT,"
          "date TEXT,"
          "is_map_included TEXT"
          ")");

    });
  }

  insertSearch(SavedSearchModel savedSearchModel) async {
    print('Filter to be saved: ${savedSearchModel.filters}');
    final db = await database;
    var raw = await db.rawInsert(
        "INSERT Into saved_search (name, url, filter, date, is_map_included)"
        " VALUES (?,?,?,?,?)",
        [
          savedSearchModel.name,
          savedSearchModel.url,
          savedSearchModel.filters,
          savedSearchModel.date,
          savedSearchModel.is_map_included
        ]);
    return raw;
  }

  addPropertyDescription(PropertyModel propertyModel) async {
    final db = await database;
    var raw = await db.rawInsert(
        "INSERT Into create_pro ("
        "user_id,"
        "property_title,"
        "property_description,"
        "property_price,"
        "prop_category,"
        "prop_action_category,"
        "property_status,"
        "property_taxes,"
        "property_maintenance"
        ")"
        " VALUES (?,?,?,?,?,?,?,?,?)",
        [
          propertyModel.user_id,
          propertyModel.property_title,
          propertyModel.property_description,
          propertyModel.property_price,
          propertyModel.prop_category,
          propertyModel.prop_action_category,
          propertyModel.property_status,
          propertyModel.property_taxes,
          propertyModel.property_maintenance,
        ]);
    return raw;
  }

  updatePropertyMedia(PropertyModel propertyModel) async {
    final db = await database;

//    // row to update
//    Map<String, dynamic> row = {
//      propertyModel.property_title : 'Mary',
//      DatabaseHelper.columnAge  : 32
//    };

    var raw = await db.rawUpdate(
        "UPDATE create_pro ("
            "user_id,"
            "property_title,"
            "property_description,"
            "property_price,"
            "prop_category,"
            "prop_action_category,"
            "property_status,"
            "property_taxes,"
            "property_maintenance"
            ")"
            " VALUES (?,?,?,?,?,?,?,?,?)",
        [
          propertyModel.user_id,
          propertyModel.property_title,
          propertyModel.property_description,
          propertyModel.property_price,
          propertyModel.prop_category,
          propertyModel.prop_action_category,
          propertyModel.property_status,
          propertyModel.property_taxes,
          propertyModel.property_maintenance,
        ]);
    return raw;
  }



  Future<List<SavedSearchModel>> getAllSavedSearches() async {
    final db = await database;

    var res = await db.query("saved_search");

    List<SavedSearchModel> list = res.isNotEmpty
        ? res.map((c) => SavedSearchModel.fromMap(c)).toList()
        : [];

    print('checkl list : ${list[0].filters}');

    return list;
  }
}
