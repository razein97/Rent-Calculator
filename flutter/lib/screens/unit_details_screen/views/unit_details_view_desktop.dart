import 'package:flutter/material.dart';
import 'package:rent_calculator/helpers/sizes_helpers.dart';
import 'package:rent_calculator/screens/unit_details_screen/widgets/app_bar_unit_details.dart';
import 'package:rent_calculator/screens/unit_details_screen/widgets/desktop_widgets/tenant_details_desktop.dart';
import 'package:rent_calculator/screens/unit_details_screen/widgets/desktop_widgets/transactions_log_desktop.dart';
import 'package:rent_calculator/values/temp_values.dart';

class UnitDetailsViewDesktop extends StatefulWidget {
  const UnitDetailsViewDesktop({
    super.key,
  });

  @override
  State<UnitDetailsViewDesktop> createState() => _UnitDetailsViewDesktopState();
}

class _UnitDetailsViewDesktopState extends State<UnitDetailsViewDesktop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarUnitDetails(
        preferredSize: const Size(double.infinity, 60),
        title: TempValues.curUnitName,
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          TentantDetailsDesktop(),
          TransactionsLogDesktop(),
        ],
      ),
      // body: FutureBuilder(
      //   future: Provider.of<BuildingProvider>(context, listen: true)
      //       .getNumberOfUnits(buildingID),
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.done) {
      //       if (snapshot.hasError) {
      //       } else if (snapshot.hasData) {
      //         return SizedBox(
      //           width: double.infinity,
      //           height: double.infinity,
      //           child: snapshot.data!.isEmpty
      //               ? const EmptyUnit()
      //               : NotEmptyUnit(
      //                   units: snapshot.data,
      //                 ),
      //         );
      //       }
      //     }
      //     return const Center(
      //       child: CircularProgressIndicator(),
      //     );
      //   },
      // ),
    );
  }
}
