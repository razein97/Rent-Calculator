import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqlite3/sqlite3.dart';

class DatabaseHelpers {
  //Create database
  static Future<void> createAppDataDb(path) async {
    Database appDataDb = sqlite3.open(path);
    //Create table
    appDataDb.execute('''CREATE TABLE IF NOT EXISTS buildings(
                    id INTEGER PRIMARY KEY AUTOINCREMENT,
                    name TEXT,
                    address TEXT,
                    units INT
                    );

        CREATE TABLE IF NOT EXISTS units(
                    id INTEGER PRIMARY KEY AUTOINCREMENT,
                    building_id INT,
                    unit_name TEXT,
                    tenant_info TEXT,
                    rent REAL,
                    amenities TEXT,
                    rented_status BOOL
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
    final ResultSet resultSet = appDataDb.select('SELECT * FROM buildings;');

    appDataDb.dispose();
    return resultSet;
  }

  //get all units by building id
  static Future<ResultSet> getAllUnitsInBID(int buildingID) async {
    final Directory appDocumentsDirectory =
        await getApplicationDocumentsDirectory();
    String path = '${appDocumentsDirectory.path}/RentCalculator/appData.db';

    Database appDataDb = sqlite3.open(path);

    final ResultSet resultSet = appDataDb
        .select('SELECT * FROM units WHERE building_id = ?;', [buildingID]);

    appDataDb.dispose();
    return resultSet;
  }

  //Create a building
  static Future<void> createBuilding(
      String bName, String bAddress, int noOfUnits) async {
    String buildingName = "Building No. ";
    int buildingID;

    final Directory appDocumentsDirectory =
        await getApplicationDocumentsDirectory();
    String path = '${appDocumentsDirectory.path}/RentCalculator/appData.db';

    Database appDataDb = sqlite3.open(path);

    //if no name is given assign a name by taking count of the total buildings + 1
    if (bName.isEmpty) {
      final ResultSet resultSet = appDataDb.select('SELECT * FROM buildings;');

      buildingName = "Building No. ${resultSet.length + 1}";
    } else {
      buildingName = bName;
    }

//if no address is given leave it null
    if (bAddress.isEmpty) {
      appDataDb.execute('INSERT INTO buildings (name, units) VALUES (?,?)',
          [buildingName, noOfUnits]);
      buildingID = appDataDb.lastInsertRowId;
    } else {
      appDataDb.execute(
          'INSERT INTO buildings (name, address, units) VALUES (?,?,?)',
          [buildingName, bAddress, noOfUnits]);
      buildingID = appDataDb.lastInsertRowId;
    }

//if units have been given a number then create the number of units accordingly

    if (noOfUnits > 0) {
      for (int i = 1; i <= noOfUnits; i++) {
        appDataDb.execute(
            'INSERT INTO units (building_id, unit_name, rent, rented_status) VALUES (?,?,?,?);',
            [
              buildingID,
              'Unit No. $i',
              0.0,
              false,
            ]);
      }
    }

    appDataDb.dispose();
    // appDataDb.execute()
  }

  //Create a unit
  static Future<void> createUnit(int bID, String uName, double uRent) async {
    debugPrint(uRent.toString());
    final Directory appDocumentsDirectory =
        await getApplicationDocumentsDirectory();
    String path = '${appDocumentsDirectory.path}/RentCalculator/appData.db';

    Database appDataDb = sqlite3.open(path);

    appDataDb.execute(
        'INSERT INTO units (building_id, unit_name, rent, rented_status) VALUES (?,?,?,?);',
        [
          bID,
          uName,
          uRent,
          false,
        ]);

    //update the buildings number of units
    ResultSet curUnits =
        appDataDb.select('SELECT units FROM buildings WHERE id = ?', [bID]);

    appDataDb.execute('UPDATE buildings SET units = ? WHERE id = ?', [
      curUnits.first['units'] + 1,
      bID,
    ]);

    appDataDb.dispose();
  }
}
