import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:rent_calculator/providers/building_provider.dart';

import 'helpers/database_helpers.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  void initState() {
    super.initState();
    _databaseStuff().whenComplete(() =>
        Provider.of<BuildingProvider>(context, listen: false)
            .getNumberOfBuildings()
            .whenComplete(() => context.replace("/home")));
  }

  Future<void> _databaseStuff() async {
    final Directory appDocumentsDirectory =
        await getApplicationDocumentsDirectory();

    if (await Directory("${appDocumentsDirectory.path}/RentCalculator")
        .exists()) {
      String path = '${appDocumentsDirectory.path}/RentCalculator/appData.db';

      bool fileExists = await File(path).exists();

      if (!fileExists) {
        await DatabaseHelpers.createAppDataDb(path);
      }
    } else {
      await Directory("${appDocumentsDirectory.path}/RentCalculator")
          .create(recursive: true);

      String path = '${appDocumentsDirectory.path}/RentCalculator/appData.db';

      bool fileExists = await File(path).exists();

      if (!fileExists) {
        await DatabaseHelpers.createAppDataDb(path);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
