import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BuildingCard extends StatelessWidget {
  final int numberOfHomes;
  final String nameOfBuilding;
  final double width;
  final double height;
  const BuildingCard(
      {super.key,
      required this.numberOfHomes,
      required this.nameOfBuilding,
      required this.width,
      required this.height});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: Colors.blue,
      hoverColor: Colors.blue.shade600,
      onPressed: () {
        GoRouter.of(context).go('/compartments');
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
