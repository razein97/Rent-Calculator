import 'package:flutter/material.dart';
import 'package:rent_calculator/screens/units_screen/widgets/desktop_widgets/unit_card_desktop.dart';
import 'package:sqlite3/common.dart';

class NotEmptyUnitDesktop extends StatefulWidget {
  final ResultSet? units;

  const NotEmptyUnitDesktop({
    super.key,
    required this.units,
  });

  @override
  State<NotEmptyUnitDesktop> createState() => _NotEmptyUnitDesktop();
}

class _NotEmptyUnitDesktop extends State<NotEmptyUnitDesktop> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: Wrap(alignment: WrapAlignment.start, children: [
            for (var row in widget.units!)
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: UnitCardDesktop(
                    buildingID: row['building_id'],
                    nameOfUnit: row['unit_name'],
                    unitID: row['id'],
                    rent: row['rent'],
                    rentedStatus: row['rented_status'] == 1 ? true : false,
                    rentedDate: row['rented_date'],
                    width: 300,
                    height: 250),
              )
          ]),
        ),
      ),
    );
  }
}
