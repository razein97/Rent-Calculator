import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:rent_calculator/helpers/sizes_helpers.dart';

class DeleteDialog extends StatelessWidget {
  final String tenantName;
  const DeleteDialog({super.key, required this.tenantName});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Container(
        decoration: const BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            )),
        height: 50,
        child: const Center(child: Text('Delete Tenant')),
      ),
      titlePadding: EdgeInsets.zero,
      // contentPadding: EdgeInsets.all(10.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),

      actionsAlignment: MainAxisAlignment.spaceAround,
      actionsPadding: const EdgeInsets.only(bottom: 20.0),
      actions: [
        SizedBox(
          width: 200.0,
          height: 50.0,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.green),
            ),
            onPressed: () {
              Navigator.pop(context, true);
            },
            child: const Text('Yes'),
          ),
        ),
        SizedBox(
          width: 200.0,
          height: 50.0,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red),
            ),
            onPressed: () {
              Navigator.pop(context, false);
            },
            child: const Text('No'),
          ),
        ),
      ],
      content: SizedBox(
        width: 600,
        height: SizeHelper.displayHeight! * 0.3,
        child: Column(children: [
          const Icon(
            BoxIcons.bx_error,
            size: 40,
          ),
          Text(
            'Are you sure that you want to delete $tenantName.',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Text(
            'Note: This action cannot be undone.',
            style: Theme.of(context).textTheme.subtitle1,
          )
        ]),
      ),
    );
  }
}
