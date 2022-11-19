import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rent_calculator/routing/router.gr.dart' as auto_router;

class BuildingCard extends StatelessWidget {
  final int buildingId;
  final int numberOfHomes;
  final String nameOfBuilding;
  final double width;
  final double height;
  const BuildingCard(
      {super.key,
      required this.numberOfHomes,
      required this.nameOfBuilding,
      required this.width,
      required this.height,
      required this.buildingId});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: Colors.blue,
      hoverColor: Colors.blue.shade600,
      onPressed: () {
        AutoRouter.of(context).push(auto_router.UnitsView(
            buildingID: buildingId, buildingName: nameOfBuilding));
      },
      child: SizedBox(
        // color: Colors.blue.shade400,
        width: width,
        height: height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(nameOfBuilding),
            Icon(numberOfHomes > 5 ? Icons.apartment : Icons.home),
            Text('Number of apartments: $numberOfHomes'),
          ],
        ),
      ),
    );
  }
}
