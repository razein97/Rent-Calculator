import 'package:flutter/material.dart';
import 'package:rent_calculator/helpers/database_helpers.dart';

import 'package:rent_calculator/screens/home_screen/widgets/app_bar_home.dart';
import 'package:rent_calculator/screens/home_screen/widgets/empty_home.dart';
import 'package:rent_calculator/screens/home_screen/widgets/not_empty_home.dart';

class HomeViewDesktop extends StatefulWidget {
  const HomeViewDesktop({super.key});

  @override
  State<HomeViewDesktop> createState() => _HomeViewDesktopState();
}

class _HomeViewDesktopState extends State<HomeViewDesktop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppBarHome(
          preferredSize: Size(double.infinity, 60),
          title: 'Rent Calculator',
        ),
        body: FutureBuilder(
          future: DatabaseHelpers.getAllBuildings(),
          builder: (ctx, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                    '${snapshot.error} occurred',
                    style: const TextStyle(fontSize: 18),
                  ),
                );
              } else if (snapshot.hasData) {
                if (snapshot.data!.isEmpty) {
                  return const EmptyHome();
                } else {
                  return const NotEmptyHome();
                }
              }
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
