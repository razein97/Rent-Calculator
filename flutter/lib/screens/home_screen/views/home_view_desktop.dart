import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_calculator/providers/building_provider.dart';
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
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Provider.of<BuildingProvider>(context, listen: true)
                  .buildings
                  .isEmpty
              ? const EmptyHome()
              : const NotEmptyHome(),
        ));
  }
}
