import 'package:flutter/cupertino.dart';
import 'package:rent_calculator/helpers/database_helpers.dart';
import 'package:sqlite3/common.dart';

class BuildingProvider extends ChangeNotifier {
  late ResultSet buildings;

  Future<void> getNumberOfBuildings() async {
    buildings = await DatabaseHelpers.getAllBuildings();
  }

  Future<void> createBuilding(String bName, String bAdd, int bComp) async {
    await DatabaseHelpers.createBuilding(bName, bAdd, bComp);
    await getNumberOfBuildings();
    notifyListeners();
  }

  late int unitsInBuilding;
  Future<ResultSet> getNumberOfUnits(int buildingID) async {
    ResultSet units = await DatabaseHelpers.getAllUnitsInBID(buildingID);
    unitsInBuilding = units.length;
    return units;
  }

  Future<int> createUnit(int bID, String uName, double uRent) async {
    // debugPrint(rent.toString());
    int unitID = await DatabaseHelpers.createUnit(bID, uName, uRent);
    await getNumberOfUnits(bID);
    await getNumberOfBuildings();
    notifyListeners();
    return unitID;
  }

  Future<void> updateUnitRent(int bID, int uID, double rent, int date) async {
    await DatabaseUnitHelpers.updateUnitRent(bID, uID, rent, date);
    await getNumberOfUnits(bID);
    notifyListeners();
  }

  Future<double> getUnitRent(int bID, int uID) async {
    return await DatabaseUnitHelpers.getUnitRent(bID, uID);
  }
}
