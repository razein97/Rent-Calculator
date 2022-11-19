import 'package:flutter/material.dart';
import 'package:rent_calculator/helpers/sizes_helpers.dart';
import 'package:rent_calculator/screens/unit_details_screen/widgets/app_bar_unit_details.dart';
import 'package:rent_calculator/screens/unit_details_screen/widgets/desktop_widgets/tenant_details_desktop.dart';
import 'package:rent_calculator/screens/unit_details_screen/widgets/desktop_widgets/transactions_log_desktop.dart';

class UnitDetailsViewDesktop extends StatelessWidget {
  final String unitName;
  const UnitDetailsViewDesktop({
    super.key,
    required this.unitName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarUnitDetails(
        preferredSize: const Size(double.infinity, 60),
        title: unitName,
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
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
