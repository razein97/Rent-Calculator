import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rent_calculator/routing/router.gr.dart' as auto_router;
import 'package:provider/provider.dart';
import 'package:rent_calculator/providers/building_provider.dart';
import 'package:path/path.dart' as p;

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
            .whenComplete(() =>
                AutoRouter.of(context).replace(const auto_router.HomeView())));
  }

  Future<void> _databaseStuff() async {
    final Directory appDocumentsDirectory =
        await getApplicationDocumentsDirectory();

    final String savePath =
        p.join(appDocumentsDirectory.path, 'RentCalculator');

    final String dbPath = p.join(savePath, 'appData.db');

    if (await Directory(savePath).exists()) {
      bool fileExists = await File(dbPath).exists();

      if (!fileExists) {
        await DatabaseHelpers.createAppDataDb(dbPath);
      }
    } else {
      await Directory(savePath).create(recursive: true);

      bool fileExists = await File(dbPath).exists();

      if (!fileExists) {
        await DatabaseHelpers.createAppDataDb(dbPath);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
