import 'package:flutter/material.dart';
import 'package:rent_calculator/screens/compartments_screen/views/compartments_view_desktop.dart';
import 'package:responsive_builder/responsive_builder.dart';

class CompartmentsView extends StatelessWidget {
  const CompartmentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      // breakpoints: ScreenBreakpoints(mobile),

      mobile: const CompartmentsViewDesktop(),
      tablet: const CompartmentsViewDesktop(),
      desktop: const CompartmentsViewDesktop(),
    );
  }
}
