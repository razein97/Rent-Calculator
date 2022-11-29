import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:rent_calculator/helpers/sizes_helpers.dart';
import 'package:rent_calculator/providers/building_provider.dart';
import 'package:rent_calculator/providers/transactions_data_provider.dart';

class TransactionsLogDesktop extends StatefulWidget {
  const TransactionsLogDesktop({super.key});

  @override
  State<TransactionsLogDesktop> createState() => _TransactionsLogDesktopState();
}

class _TransactionsLogDesktopState extends State<TransactionsLogDesktop> {
  @override
  void initState() {
    super.initState();
    Provider.of<TransactionsDataProvider>(context, listen: false)
        .getTransactions(
            context.read<BuildingProvider>().unitsDetails.buildingId!,
            context.read<BuildingProvider>().unitsDetails.unitId!,
            context.read<BuildingProvider>().unitsDetails.rentedDate!);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeHelper.displayWidth! * 1,
      height: SizeHelper.displayHeight! * 0.5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            decoration: BoxDecoration(
              border:
                  Border.all(width: 1, color: Theme.of(context).disabledColor),
              borderRadius: const BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            child: Provider.of<TransactionsDataProvider>(context, listen: true)
                        .transactions !=
                    null
                ? Column(
                    children: [
                      Table(
                          // border: TableBorder.all(width: 1.0),
                          defaultVerticalAlignment:
                              TableCellVerticalAlignment.middle,
                          // columnWidths: const {},
                          children: [
                            TableRow(
                              decoration: BoxDecoration(
                                  color: Theme.of(context).disabledColor),
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                      child: Text(
                                    'Previous Reading in KWH',
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                  )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                      child: Text(
                                    'Present Reading in KWH',
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                  )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                      child: Text(
                                    'Difference in KWH',
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                  )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                      child: Text(
                                    'Total Energy Charge',
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                  )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                      child: Text(
                                    'Amenities Charge',
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                  )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                      child: Text(
                                    'Extra Charges',
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                  )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                      child: Text(
                                    'Total Charge',
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                  )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                      child: Text(
                                    'Status',
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                  )),
                                ), // Status options = Pending, Paid, Overdue
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                      child: Text(
                                    'Due Date',
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                  )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                      child: Text(
                                    '',
                                    style: Theme.of(context).textTheme.caption,
                                  )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                      child: Text(
                                    '',
                                    style: Theme.of(context).textTheme.caption,
                                  )),
                                ),
                              ],
                            ),
                            for (var row in context
                                .watch<TransactionsDataProvider>()
                                .transactions!)
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                        child: Text(
                                            row['previous_electricity_unit'])),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                        child: Text(
                                            row['current_electricity_unit'])),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                        child: Text(row[
                                                'current_electricity_unit'] -
                                            row['previous_electricity_unit'])),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                        child: Text(row['electricity_cost'])),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                        child: Text(row['amenities_charge'])),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                        child: Text(row['extra_charges'])),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(child: Text(row['status'])),
                                  ), // Status options = Pending, Paid, Overdue
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                        child: Text(DateFormat.yMd('en-IN')
                                            .format(DateTime
                                                .fromMillisecondsSinceEpoch(
                                                    row['due_date'])))),
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
                    ],
                  )
                : context.watch<TransactionsDataProvider>().transactions == null
                    ? const Center(child: Text('No trasactions to show.'))
                    : const CircularProgressIndicator()),
      ),
    );
  }
}
