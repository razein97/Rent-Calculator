import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class AppBarAddNewTenant extends StatefulWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;
  final int unitID;
  final String title;
  const AppBarAddNewTenant(
      {super.key,
      required this.preferredSize,
      required this.unitID,
      required this.title});

  @override
  State<AppBarAddNewTenant> createState() => _AppBarAddNewTenantState();
}

class _AppBarAddNewTenantState extends State<AppBarAddNewTenant> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      automaticallyImplyLeading: true,
      title: Text('Add Tenant Details to ${widget.title}'),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
              onPressed: () {},
              child: Row(
                children: const [
                  Icon(BoxIcons.bx_save),
                  Text('Save'),
                ],
              )),
        )
      ],
    );
  }
}
