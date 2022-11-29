import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:rent_calculator/helpers/database_helpers/buildings_data_db_helper.dart';
import 'package:rent_calculator/helpers/database_helpers/tenants_data_db_helper.dart';
import 'package:rent_calculator/helpers/database_helpers/units_data_db_helper.dart';
import 'package:rent_calculator/models/tenant_info_model.dart';
import 'package:rent_calculator/models/units_model.dart';
import 'package:sqlite3/common.dart';

class BuildingProvider extends ChangeNotifier {
  late ResultSet buildings;
  UnitsModel unitsDetails = UnitsModel();

  Future<void> getNumberOfBuildings() async {
    buildings = await BuildingsDataDBHelper.getAllBuildings();
  }

  Future<void> createBuilding(String bName, String bAdd, int bComp) async {
    await BuildingsDataDBHelper.createBuilding(bName, bAdd, bComp);
    await getNumberOfBuildings();
    notifyListeners();
  }

  late int unitsInBuilding;
  Future<ResultSet> getNumberOfUnits(int buildingID) async {
    ResultSet units = await BuildingsDataDBHelper.getAllUnitsInBID(buildingID);
    unitsInBuilding = units.length;
    return units;
  }

  Future<int> createUnit(int bID, String uName, double uRent) async {
    int unitID = await UnitsDataDBHelper.createUnit(bID, uName, uRent);
    await getNumberOfUnits(bID);
    await getNumberOfBuildings();
    notifyListeners();
    return unitID;
  }

  Future<void> updateUnitRent(int bID, int uID, double rent, int date) async {
    await UnitsDataDBHelper.updateUnitRent(bID, uID, rent, date);
    await getNumberOfUnits(bID);
    notifyListeners();
  }

  Future<double> getUnitRent(int bID, int uID) async {
    return await UnitsDataDBHelper.getUnitRent(bID, uID);
  }

  Future<void> updateUnitSecurityDeposit(
      int bID, int uID, double securityDeposit) async {
    await UnitsDataDBHelper.updateUnitSecurityDeposit(
        bID, uID, securityDeposit);
    await TenantsDataDBHelper.updateCurTenantSecurityDeposit(
        bID, uID, securityDeposit);
  }

  Future<void> updateUnitAmenities(
      int bID, int uID, List<AmenitiesModel> amenities) async {
    String amenitiesJson = '';
    if (amenities.isNotEmpty) {
      amenitiesJson = jsonEncode(amenities);
    }
    await UnitsDataDBHelper.updateUnitAmenities(bID, uID, amenitiesJson);
    await TenantsDataDBHelper.updateCurTenantAmenities(bID, uID, amenitiesJson);
    await getUnitDetails(bID, uID);
    notifyListeners();
  }

  Future<void> getUnitDetails(int bID, int uID) async {
    ResultSet resultSet = await UnitsDataDBHelper.getUnitDetails(bID, uID);
    List<AmenitiesModel> amenities = [];
    if (resultSet.isNotEmpty) {
      unitsDetails.unitId = resultSet.first['id'];
      unitsDetails.buildingId = resultSet.first['building_id'];
      unitsDetails.unitName = resultSet.first['unit_name'];
      unitsDetails.rent = resultSet.first['rent'];
      unitsDetails.securityDeposit = resultSet.first['security_deposit'];
      unitsDetails.electricityUnit = resultSet.first['electricity_unit'];
      unitsDetails.rentedStatus =
          resultSet.first['rented_status'] == 1 ? true : false;
      unitsDetails.rentedDate = resultSet.first['rented_date'];

      if (resultSet.first['amenities'].toString().isNotEmpty) {
        List decoded = jsonDecode(resultSet.first['amenities']);
        for (var i in decoded) {
          amenities.add(AmenitiesModel(i['amenityName'], i['amenityPrice']));
        }
      }
      unitsDetails.amenities = amenities;
    }
    notifyListeners();
  }
}
