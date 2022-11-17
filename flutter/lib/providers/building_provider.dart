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

  Future<void> createUnit(int bID, String uName, double rent) async {
    // debugPrint(rent.toString());
    await DatabaseHelpers.createUnit(bID, uName, rent);
    await getNumberOfUnits(bID);
    await getNumberOfBuildings();
    notifyListeners();
  }
}
