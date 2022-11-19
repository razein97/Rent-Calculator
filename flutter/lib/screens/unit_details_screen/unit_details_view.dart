import 'package:flutter/material.dart';
import 'package:rent_calculator/screens/unit_details_screen/views/unit_details_view_desktop.dart';
import 'package:responsive_builder/responsive_builder.dart';

class UnitDetailsView extends StatelessWidget {
  final String unitName;

  const UnitDetailsView({
    super.key,
    required this.unitName,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      // breakpoints: ScreenBreakpoints(mobile),

      mobile: UnitDetailsViewDesktop(
        unitName: unitName,
      ),
      tablet: UnitDetailsViewDesktop(
        unitName: unitName,
      ),
      desktop: UnitDetailsViewDesktop(
        unitName: unitName,
      ),
    );
  }
}
