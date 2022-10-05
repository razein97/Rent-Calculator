import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class BuildingContainer extends StatelessWidget {
  final int numberOfHomes;
  final String nameOfBuilding;
  final double width;
  final double height;

  const BuildingContainer(
      {super.key,
      required this.numberOfHomes,
      required this.nameOfBuilding,
      required this.width,
      required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: (() => {}),
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
