import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_calculator/providers/building_provider.dart';
import 'package:rent_calculator/screens/buildings_screen/widgets/app_bar_building.dart';
import 'package:rent_calculator/screens/buildings_screen/widgets/empty_building.dart';
import 'package:rent_calculator/screens/buildings_screen/widgets/not_empty_building.dart';

class BuildingsViewDesktop extends StatefulWidget {
  const BuildingsViewDesktop({super.key});

  @override
  State<BuildingsViewDesktop> createState() => _BuildingsViewDesktopState();
}

class _BuildingsViewDesktopState extends State<BuildingsViewDesktop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppBarBuildings(
          preferredSize: Size(double.infinity, 60),
          title: 'Rent Calculator',
        ),
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Provider.of<BuildingProvider>(context, listen: true)
                  .buildings
                  .isEmpty
              ? const EmptyBuildings()
              : const NotEmptyBuildings(),
        ));
  }
}
