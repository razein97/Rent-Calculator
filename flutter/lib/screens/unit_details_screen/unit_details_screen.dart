import 'package:flutter/material.dart';
import 'package:rent_calculator/screens/unit_details_screen/views/unit_details_view_desktop.dart';
import 'package:responsive_builder/responsive_builder.dart';

class UnitDetailsScreen extends StatelessWidget {
  const UnitDetailsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      // breakpoints: ScreenBreakpoints(mobile),

      mobile: UnitDetailsViewDesktop(),
      tablet: UnitDetailsViewDesktop(),
      desktop: UnitDetailsViewDesktop(),
    );
  }
}
