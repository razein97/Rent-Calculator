import 'package:flutter/material.dart';
import 'package:rent_calculator/screens/units_screen/widgets/unit_card.dart';
import 'package:sqlite3/common.dart';

class NotEmptyUnit extends StatefulWidget {
  final ResultSet? units;

  const NotEmptyUnit({
    super.key,
    required this.units,
  });

  @override
  State<NotEmptyUnit> createState() => _NotEmptyUnit();
}

class _NotEmptyUnit extends State<NotEmptyUnit> {
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
                child: UnitCard(
                    nameOfUnit: row['unit_name'],
                    rent: row['rent'],
                    rentedStatus: row['rented_status'] == 1 ? true : false,
                    width: 300,
                    height: 250),
              )
          ]),
        ),
      ),
    );
  }
}
