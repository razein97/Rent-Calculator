import 'package:rent_calculator/values/database_sql.dart';
import 'package:sqlite3/sqlite3.dart';

class AppDataDBHelper {
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
}
