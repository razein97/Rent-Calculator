import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rent_calculator/routing/router.gr.dart' as auto_router;

class UnitCard extends StatelessWidget {
  final String nameOfUnit;
  final bool rentedStatus;
  final double rent;
  final double width;
  final double height;
  const UnitCard(
      {super.key,
      required this.nameOfUnit,
      required this.width,
      required this.height,
      required this.rentedStatus,
      required this.rent});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: Colors.blue,
      hoverColor: Colors.blue.shade600,
      onPressed: () {
        AutoRouter.of(context)
            .push(auto_router.UnitDetailsView(unitName: nameOfUnit));
      },
      child: SizedBox(
        // color: Colors.blue.shade400,
        width: width,
        height: height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(nameOfUnit),
            const Icon(Icons.home),
            Text('Rent: $rent'),
            Text(rentedStatus ? 'Rented' : 'Not Rented'),
          ],
        ),
      ),
    );
  }
}
