import 'package:flutter/material.dart';

class EmptyUnitDesktop extends StatelessWidget {
  const EmptyUnitDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      // color: Colors.amber,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Text(
            '',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'Use the + button to add a units.',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }
}
