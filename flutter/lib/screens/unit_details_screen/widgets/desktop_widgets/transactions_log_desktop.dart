import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:rent_calculator/helpers/sizes_helpers.dart';

class TransactionsLogDesktop extends StatelessWidget {
  const TransactionsLogDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: SizeHelper.displayWidth! * 1,
        height: SizeHelper.displayHeight! * 0.5,
        child: Table(
            // border: TableBorder.all(width: 1.0),
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            // columnWidths: const {},
            children: <TableRow>[
              TableRow(
                decoration:
                    BoxDecoration(color: Theme.of(context).disabledColor),
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(
                        child: Text(
                      'Previous Reading in KWH',
                      style: Theme.of(context).textTheme.titleSmall,
                    )),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(
                        child: Text(
                      'Present Reading in KWH',
                      style: Theme.of(context).textTheme.titleSmall,
                    )),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(
                        child: Text(
                      'Difference in KWH',
                      style: Theme.of(context).textTheme.titleSmall,
                    )),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(
                        child: Text(
                      'Total Energy Charge',
                      style: Theme.of(context).textTheme.titleSmall,
                    )),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(
                        child: Text(
                      'Amenities Charge',
                      style: Theme.of(context).textTheme.titleSmall,
                    )),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(
                        child: Text(
                      'Total Charge',
                      style: Theme.of(context).textTheme.titleSmall,
                    )),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(
                        child: Text(
                      'Status',
                      style: Theme.of(context).textTheme.titleSmall,
                    )),
                  ), // Status options = Pending, Paid, Overdue
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(
                        child: Text(
                      'Due Date',
                      style: Theme.of(context).textTheme.titleSmall,
                    )),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(
                        child: Text(
                      '',
                      style: Theme.of(context).textTheme.caption,
                    )),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(
                        child: Text(
                      '',
                      style: Theme.of(context).textTheme.caption,
                    )),
                  ),
                ],
              ),
              TableRow(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(child: Text('41497')),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(child: Text('41449')),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(child: Text('48')),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(child: Text('432')),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(child: Text('40')),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(child: Text('472')),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(child: Text('Pending')),
                  ), // Status options = Pending, Paid, Overdue
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(child: Text('15-10-2022')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text('View Bill'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                        child: IconButton(
                      onPressed: () {},
                      icon: const Icon(BoxIcons.bx_edit),
                    )),
                  ),
                ],
              ),
            ]),
      ),
    );
  }
}
