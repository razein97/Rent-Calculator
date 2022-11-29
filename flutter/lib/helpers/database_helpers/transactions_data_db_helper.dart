import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqlite3/sqlite3.dart';

class TransactionsDataDBHelper {
  //Get trasactions
  static Future<ResultSet> getTransactions(
      int buildingID, int unitID, int date) async {
    final Directory appDocumentsDirectory =
        await getApplicationDocumentsDirectory();
    String path = '${appDocumentsDirectory.path}/RentCalculator/appData.db';

    Database appDataDb = sqlite3.open(path);

    final ResultSet resultSet = appDataDb.select(
        'SELECT * FROM transactions WHERE building_id = ? AND unit_id = ? AND date_created > ?',
        [buildingID, unitID, date]);
    return resultSet;
  }
}
