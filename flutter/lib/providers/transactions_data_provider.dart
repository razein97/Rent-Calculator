import 'package:flutter/material.dart';
import 'package:rent_calculator/helpers/database_helpers/transactions_data_db_helper.dart';
import 'package:sqlite3/common.dart';

class TransactionsDataProvider extends ChangeNotifier {
  ResultSet? transactions;

  Future<void> getTransactions(int buildingID, int unitID, int date) async {
    ResultSet resultSet = await TransactionsDataDBHelper.getTransactions(
        buildingID, unitID, date);

    if (resultSet.isNotEmpty) {
      transactions = resultSet;
    } else {
      transactions = null;
    }
  }
}
