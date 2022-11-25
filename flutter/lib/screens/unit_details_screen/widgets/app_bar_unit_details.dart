import 'package:auto_route/auto_route.dart';
import 'package:rent_calculator/routing/router.gr.dart' as auto_router;
import 'package:flutter/material.dart';
import 'package:rent_calculator/values/temp_values.dart';

class AppBarUnitDetails extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;
  final String title;

  const AppBarUnitDetails(
      {super.key, required this.preferredSize, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      automaticallyImplyLeading: true,
      title: Text(title),
      actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.edit))],
    );
  }
}
