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
      automaticallyImplyLeading: true,
      title: Text(title),
    );
  }
}
