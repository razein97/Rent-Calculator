import 'package:flutter/material.dart';
import 'package:rent_calculator/helpers/sizes_helpers.dart';
import 'package:rent_calculator/screens/buildings_screen/views/home_view_desktop.dart';
import 'package:responsive_builder/responsive_builder.dart';

class BuildingsScreen extends StatelessWidget {
  const BuildingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeHelper().init(context);
    return ScreenTypeLayout(
      // breakpoints: ScreenBreakpoints(mobile),

      mobile: const HomeViewDesktop(),
      tablet: const HomeViewDesktop(),
      desktop: const HomeViewDesktop(),
    );
  }
}
