import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:rent_calculator/helpers/json_file_encoders.dart';
import 'package:rent_calculator/models/tenant_info_model.dart';
import 'package:rent_calculator/values/database_sql.dart';
import 'package:sqlite3/sqlite3.dart';

class TenantsDataDBHelper {
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

  static Future<void> removeTenantFromDB(
      int tenantID, int buildingID, int unitID) async {
    final Directory appDocumentsDirectory =
        await getApplicationDocumentsDirectory();
    String path = '${appDocumentsDirectory.path}/RentCalculator/appData.db';
    Database appDataDb = sqlite3.open(path);

    appDataDb.execute(
        'DELETE FROM tenant_details WHERE id = ? AND building_id = ? AND unit_id = ?',
        [tenantID, buildingID, unitID]);
    appDataDb.dispose();
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
