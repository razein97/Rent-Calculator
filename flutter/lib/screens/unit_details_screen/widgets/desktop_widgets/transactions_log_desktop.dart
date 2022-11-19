import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rent_calculator/helpers/sizes_helpers.dart';

class TransactionsLogDesktop extends StatelessWidget {
  const TransactionsLogDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeHelper.displayWidth! * 1,
      height: SizeHelper.displayHeight! * 0.5,
      child: Table(
          // border: TableBorder.all(width: 1.0),
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          columnWidths: {},
          children: <TableRow>[
            TableRow(
              decoration: BoxDecoration(color: Colors.grey[200]),
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(child: Text('Previous Reading in KWH')),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(child: Text('Present Reading in KWH')),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(child: Text('Difference in KWH')),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(child: Text('Total Energy Charge')),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(child: Text('Amenities Charge')),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(child: Text('Total Charge')),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(child: Text('Status')),
                ), // Status options = Pending, Paid, Overdue
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(child: Text('Due Date')),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(child: Text('')),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(child: Text('')),
                ),
              ],
            ),
            TableRow(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(child: Text('41497')),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(child: Text('41449')),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(child: Text('48')),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(child: Text('432')),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(child: Text('40')),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(child: Text('472')),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(child: Text('Pending')),
                ), // Status options = Pending, Paid, Overdue
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(child: Text('15-10-2022')),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('View Bill'),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                      child: IconButton(
                    onPressed: () {},
                    icon: FaIcon(FontAwesomeIcons.penToSquare),
                  )),
                ),
              ],
            ),
          ]),
    );
  }
}
