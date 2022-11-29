import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqlite3/sqlite3.dart';

class UnitsDataDBHelper {
  //Create a unit
  static Future<int> createUnit(int bID, String uName, double uRent) async {
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

    int unitId = appDataDb.lastInsertRowId;

    //update the buildings number of units
    ResultSet curUnits =
        appDataDb.select('SELECT units FROM buildings WHERE id = ?', [bID]);

    appDataDb.execute('UPDATE buildings SET units = ? WHERE id = ?', [
      curUnits.first['units'] + 1,
      bID,
    ]);

    appDataDb.dispose();
    return unitId;
  }

  static Future<ResultSet> getUnitDetails(int bID, int uID) async {
    final Directory appDocumentsDirectory =
        await getApplicationDocumentsDirectory();
    String path = '${appDocumentsDirectory.path}/RentCalculator/appData.db';

    Database appDataDb = sqlite3.open(path);
    ResultSet resultSet = appDataDb.select(
        'SELECT * FROM units WHERE building_id = ? AND id = ?', [bID, uID]);
    appDataDb.dispose();
    return resultSet;
  }

  static Future<void> updateUnitRent(
      int bID, int uID, double uRent, int date) async {
    final Directory appDocumentsDirectory =
        await getApplicationDocumentsDirectory();
    String path = '${appDocumentsDirectory.path}/RentCalculator/appData.db';

    Database appDataDb = sqlite3.open(path);

    appDataDb.execute(
        'INSERT INTO units_rents (building_id, unit_id, rent_amount, date) VALUES (?,?,?,?)',
        [bID, uID, uRent, date]);

    appDataDb.execute('UPDATE units SET rent = ? WHERE id=? AND building_id= ?',
        [uRent, uID, bID]);

    appDataDb.dispose();
  }

  static Future<void> updateUnitSecurityDeposit(
      int bID, int uID, double uSecurityDeposit) async {
    final Directory appDocumentsDirectory =
        await getApplicationDocumentsDirectory();
    String path = '${appDocumentsDirectory.path}/RentCalculator/appData.db';

    Database appDataDb = sqlite3.open(path);

    appDataDb.execute(
        'UPDATE units SET security_deposit = ? WHERE id = ? AND building_id = ?',
        [uSecurityDeposit, uID, bID]);

    appDataDb.dispose();
  }

  static Future<void> updateUnitAmenities(
      int bID, int uID, String amenitiesJson) async {
    final Directory appDocumentsDirectory =
        await getApplicationDocumentsDirectory();
    String path = '${appDocumentsDirectory.path}/RentCalculator/appData.db';

    Database appDataDb = sqlite3.open(path);

    appDataDb.execute(
        'UPDATE units SET amenities = ? WHERE id = ? AND building_id = ?',
        [amenitiesJson, uID, bID]);

    appDataDb.dispose();
  }

  static Future<double> getUnitRent(int bID, int uID) async {
    final Directory appDocumentsDirectory =
        await getApplicationDocumentsDirectory();
    String path = '${appDocumentsDirectory.path}/RentCalculator/appData.db';

    Database appDataDb = sqlite3.open(path);

    ResultSet resultSet = appDataDb
        .select('SELECT rent_amount FROM units_rents ORDER BY id DESC LIMIT 1');
    appDataDb.dispose();
    if (resultSet.rows.isEmpty) {
      return 0.0;
    } else {
      return resultSet.first['rent_amount'];
    }
  }

  static Future<void> updateUnitRentedStatus(
      int bID, int uID, bool rentedStatus, int rentedDate) async {
    final Directory appDocumentsDirectory =
        await getApplicationDocumentsDirectory();
    String path = '${appDocumentsDirectory.path}/RentCalculator/appData.db';

    Database appDataDb = sqlite3.open(path);

    appDataDb.execute(
        'UPDATE units SET rented_status = ?, rented_date = ? WHERE id = ? AND building_id = ?',
        [rentedStatus, rentedDate, uID, bID]);

    appDataDb.dispose();
  }
}
