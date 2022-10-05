import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:rent_calculator/screens/home_screen/widgets/building_container.dart';

class NotEmptyHome extends StatelessWidget {
  const NotEmptyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        BuildingContainer(
          width: 250.0,
          height: 250.0,
          numberOfHomes: 6,
          nameOfBuilding: "Heelo",
        ),
      ],
    );
  }
}
