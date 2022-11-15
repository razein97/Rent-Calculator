import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

class DatabaseHelpers {
  //Create database
  static Future<void> createAppDataDb(path) async {
    Database appDataDb = sqlite3.open(path);
    //Create table
    appDataDb.execute('''

CREATE TABLE IF NOT EXISTS buildings(
                    id INTEGER PRIMARY KEY AUTOINCREMENT,
                    name TEXT,
                    address TEXT,
                    compartments INT
                    );
''');

    appDataDb.dispose();
  }

  //get all buildings
  static Future<ResultSet> getAllBuildings() async {
    final Directory appDocumentsDirectory =
        await getApplicationDocumentsDirectory();
    String path = '${appDocumentsDirectory.path}/RentCalculator/appData.db';

    Database appDataDb = sqlite3.open(path);
    //Create table
    final ResultSet resultSet = appDataDb.select('''
SELECT * FROM buildings;
''');

    appDataDb.dispose();
    return resultSet;
  }

  //Create a building
  static Future<void> createBuilding(
      String bName, String bAddress, int noOfCompartment) async {
    String buildingName = "Building No. ";

    final Directory appDocumentsDirectory =
        await getApplicationDocumentsDirectory();
    String path = '${appDocumentsDirectory.path}/RentCalculator/appData.db';

    Database appDataDb = sqlite3.open(path);

    if (bName.isEmpty) {
      final ResultSet resultSet = appDataDb.select('''
SELECT * FROM buildings;
''');

      buildingName = "Building No. ${resultSet.length + 1}";
    } else {
      buildingName = bName;
    }

    if (bAddress.isEmpty) {
      appDataDb.execute('''

INSERT INTO buildings (name, compartments) VALUES (?,?)
''', [buildingName, noOfCompartment]);
    } else {
      appDataDb.execute('''

INSERT INTO buildings (name, address, compartments) VALUES (?,?,?)
''', [buildingName, bAddress, noOfCompartment]);
    }

    appDataDb.dispose();
    // appDataDb.execute()
  }
}
