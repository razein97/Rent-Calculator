import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_calculator/providers/building_provider.dart';
import 'package:rent_calculator/screens/units_screen/widgets/app_bar_unit.dart';
import 'package:rent_calculator/screens/units_screen/widgets/desktop_widgets/empty_unit_desktop.dart';
import 'package:rent_calculator/screens/units_screen/widgets/desktop_widgets/not_empty_unit_desktop.dart';

class UnitsViewDesktop extends StatelessWidget {
  final int buildingID;
  final String buildingName;
  const UnitsViewDesktop(
      {super.key, required this.buildingID, required this.buildingName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarUnits(
          title: buildingName,
          preferredSize: const Size(double.infinity, 60),
          buildingID: buildingID,
        ),
        body: FutureBuilder(
          future: Provider.of<BuildingProvider>(context, listen: true)
              .getNumberOfUnits(buildingID),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
              } else if (snapshot.hasData) {
                return SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: snapshot.data!.isEmpty
                      ? const EmptyUnitDesktop()
                      : NotEmptyUnitDesktop(
                          units: snapshot.data,
                        ),
                );
              }
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
