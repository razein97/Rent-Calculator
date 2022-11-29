import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:rent_calculator/providers/building_provider.dart';
import 'package:rent_calculator/screens/unit_details_screen/widgets/app_bar_unit_details.dart';
import 'package:rent_calculator/screens/unit_details_screen/widgets/desktop_widgets/tenant_details_desktop_widget.dart';
import 'package:rent_calculator/screens/unit_details_screen/widgets/desktop_widgets/transactions_log_desktop.dart';
import 'package:rent_calculator/values/temp_values.dart';

class UnitDetailsViewDesktop extends StatefulWidget {
  final int unitID;

  const UnitDetailsViewDesktop({
    super.key,
    required this.unitID,
  });

  @override
  State<UnitDetailsViewDesktop> createState() => _UnitDetailsViewDesktopState();
}

class _UnitDetailsViewDesktopState extends State<UnitDetailsViewDesktop> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: context
            .read<BuildingProvider>()
            .getUnitDetails(TempValues.curBuildingID, widget.unitID),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
              appBar: AppBarUnitDetails(
                preferredSize: const Size(double.infinity, 60),
                title: context.read<BuildingProvider>().unitsDetails.unitName!,
              ),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  TentantDetailsDesktopWidget(),
                  TransactionsLogDesktop(),
                ],
              ),
            );
          }

          return Container(
            width: 200,
            height: 200,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: const SpinKitCubeGrid(
              color: Colors.blue,
            ),
          );
        });
  }
}
