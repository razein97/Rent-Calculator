import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_calculator/helpers/sizes_helpers.dart';
import 'package:rent_calculator/providers/building_provider.dart';
import 'package:rent_calculator/screens/home_screen/widgets/building_card.dart';
import 'package:sqlite3/common.dart';

class NotEmptyHome extends StatefulWidget {
  const NotEmptyHome({
    super.key,
  });

  @override
  State<NotEmptyHome> createState() => _NotEmptyHomeState();
}

class _NotEmptyHomeState extends State<NotEmptyHome> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: Wrap(alignment: WrapAlignment.start, children: [
            for (var row in Provider.of<BuildingProvider>(context, listen: true)
                .buildings)
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: BuildingCard(
                    buildingId: row['id'],
                    numberOfHomes: row['units'] ?? 0,
                    nameOfBuilding: row['name'],
                    width: 300,
                    height: 250),
              )
          ]),
        ),
      ),
    );
  }
}
