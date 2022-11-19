import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

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
