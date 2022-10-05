import 'package:flutter/material.dart';

class EmptyHome extends StatelessWidget {
  const EmptyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      // color: Colors.amber,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Text(
            'Welcome to Rent Calculator',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'Use the + button to add a building.',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }
}
