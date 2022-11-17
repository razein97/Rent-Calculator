import 'package:flutter/material.dart';
import 'package:rent_calculator/screens/units_screen/views/units_view_desktop.dart';
import 'package:responsive_builder/responsive_builder.dart';

class UnitsView extends StatelessWidget {
  final int buildingID;
  final String buildingName;
  const UnitsView(
      {super.key, required this.buildingID, required this.buildingName});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      // breakpoints: ScreenBreakpoints(mobile),

      mobile: UnitsViewDesktop(
        buildingID: buildingID,
        buildingName: buildingName,
      ),
      tablet: UnitsViewDesktop(
        buildingID: buildingID,
        buildingName: buildingName,
      ),
      desktop: UnitsViewDesktop(
        buildingID: buildingID,
        buildingName: buildingName,
      ),
    );
  }
}
