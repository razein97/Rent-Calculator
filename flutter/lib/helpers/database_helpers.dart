import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:rent_calculator/helpers/json_file_encoders.dart';
import 'package:rent_calculator/models/tenant_info_model.dart';
import 'package:rent_calculator/values/database_sql.dart';
import 'package:sqlite3/sqlite3.dart';

class DatabaseHelpers {
  //Create database
  static Future<void> createAppDataDb(path) async {
    Database appDataDb = sqlite3.open(path);
    //Create table
    appDataDb.execute(createTableBuildingsSQL);
    appDataDb.execute(createTableUnitsSQL);
    appDataDb.execute(createTableTenantDetailsSQL);
    appDataDb.execute(createTransactionsSQL);
    appDataDb.execute(createRentAmountSQL);

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
}

class DatabaseUnitHelpers {
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
    return resultSet.first['rent_amount'];
  }

  static Future<void> updateUnitRentedStatus(
      int bID, int uID, bool rentedStatus) async {
    final Directory appDocumentsDirectory =
        await getApplicationDocumentsDirectory();
    String path = '${appDocumentsDirectory.path}/RentCalculator/appData.db';

    Database appDataDb = sqlite3.open(path);

    appDataDb.execute(
        'UPDATE units SET rented_status = ? WHERE id = ? AND building_id = ?',
        [rentedStatus, uID, bID]);

    appDataDb.dispose();
  }
}

class DatabaseTenantsHelper {
  static Future<void> saveTenantDetails(
    int buildingId,
    int unitId,
    double rent,
    double securityDeposit,
    List<TenantInfo> tenantInfos,
    String amenities,
    int checkInDate,
  ) async {
    final Directory appDocumentsDirectory =
        await getApplicationDocumentsDirectory();
    String path = '${appDocumentsDirectory.path}/RentCalculator/appData.db';
    Database appDataDb = sqlite3.open(path);

    for (TenantInfo tenantInfo in tenantInfos) {
      String profilePhotosJson =
          JsonEncoderDecoder.jsonEncodeFile(tenantInfo.profilePhotos!);
      String tenantDocsJson =
          JsonEncoderDecoder.jsonEncodeFile(tenantInfo.tenantDocs!);

      appDataDb.execute(saveTenantDetailsSQL, [
        buildingId,
        unitId,
        rent,
        securityDeposit,
        tenantInfo.firstName,
        tenantInfo.lastName,
        tenantInfo.streetAddressLine1,
        tenantInfo.streetAddressLine2,
        tenantInfo.city,
        tenantInfo.state,
        tenantInfo.pincode,
        tenantInfo.country,
        tenantInfo.phoneHome,
        tenantInfo.phoneWork,
        tenantInfo.phoneEmergency,
        tenantInfo.email,
        tenantInfo.notes,
        profilePhotosJson,
        tenantDocsJson,
        amenities,
        checkInDate,
        false
      ]);
    }

    appDataDb.dispose();
  }

  static Future<ResultSet> getTenantDetails(int buildingID, int unitID) async {
    final Directory appDocumentsDirectory =
        await getApplicationDocumentsDirectory();
    String path = '${appDocumentsDirectory.path}/RentCalculator/appData.db';
    Database appDataDb = sqlite3.open(path);

    ResultSet resultSet = appDataDb.select(
        'SELECT * FROM tenant_details WHERE building_id = ? AND unit_id = ? AND is_checked_out = ?',
        [buildingID, unitID, false]);

    appDataDb.dispose();

    return resultSet;
  }

  static Future<void> updateTenantDetails(
      int tenantID, int buildingID, int unitID, TenantInfo info) async {
    final Directory appDocumentsDirectory =
        await getApplicationDocumentsDirectory();
    String path = '${appDocumentsDirectory.path}/RentCalculator/appData.db';
    Database appDataDb = sqlite3.open(path);

    String profilePhotosJson =
        JsonEncoderDecoder.jsonEncodeFile(info.profilePhotos!);
    String tenantDocsJson = JsonEncoderDecoder.jsonEncodeFile(info.tenantDocs!);

    appDataDb.execute(updateTenantDetailsSQL, [
      info.firstName,
      info.lastName,
      info.streetAddressLine1,
      info.streetAddressLine2,
      info.city,
      info.state,
      info.pincode,
      info.country,
      info.phoneHome,
      info.phoneWork,
      info.phoneEmergency,
      info.email,
      info.notes,
      profilePhotosJson,
      tenantDocsJson,
      tenantID,
      buildingID,
      unitID
    ]);

    appDataDb.dispose();
  }

  static Future<void> updateCurTenantSecurityDeposit(
      int buildingID, int unitID, double uSecurityDeposit) async {
    final Directory appDocumentsDirectory =
        await getApplicationDocumentsDirectory();
    String path = '${appDocumentsDirectory.path}/RentCalculator/appData.db';
    Database appDataDb = sqlite3.open(path);
    ResultSet resultSet = appDataDb.select(
        'SELECT id FROM tenant_details WHERE building_id = ? AND unit_id = ? AND is_checked_out = ?',
        [buildingID, unitID, false]);

    if (resultSet.isNotEmpty) {
      for (var result in resultSet) {
        appDataDb.execute(
            'UPDATE tenant_details SET security_deposit = ? WHERE id = ? AND building_id = ? AND unit_id= ?',
            [uSecurityDeposit, result['id'], buildingID, unitID]);
      }
    }
    appDataDb.dispose();
  }

  static Future<void> updateCurTenantAmenities(
      int buildingID, int unitID, String amenitiesJson) async {
    final Directory appDocumentsDirectory =
        await getApplicationDocumentsDirectory();
    String path = '${appDocumentsDirectory.path}/RentCalculator/appData.db';
    Database appDataDb = sqlite3.open(path);
    ResultSet resultSet = appDataDb.select(
        'SELECT id FROM tenant_details WHERE building_id = ? AND unit_id = ? AND is_checked_out = ?',
        [buildingID, unitID, false]);

    if (resultSet.isNotEmpty) {
      for (var result in resultSet) {
        appDataDb.execute(
            'UPDATE tenant_details SET amenities = ? WHERE id = ? AND building_id = ? AND unit_id= ?',
            [amenitiesJson, result['id'], buildingID, unitID]);
      }
    }
    appDataDb.dispose();
  }
}
