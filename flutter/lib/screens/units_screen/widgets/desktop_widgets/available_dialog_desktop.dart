import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AvailableDialogDesktop extends StatelessWidget {
  const AvailableDialogDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: SizedBox(
        width: 600.0,
        height: 400.0,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text('NO TENANT DETAILS FOUND'),
                const Text(
                  'There were no tenant details found. Please add some or view the previous details of the unit.',
                  textAlign: TextAlign.center,
                ),
                Container(
                  color: Colors.amber,
                  width: 300,
                  height: 200,
                ), // Special Image
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 200.0,
                      height: 50.0,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            FaIcon(
                              FontAwesomeIcons.userPlus,
                              size: 15.0,
                            ),
                            Text('Add Tenant'),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 200.0,
                      height: 50.0,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            FaIcon(
                              FontAwesomeIcons.eye,
                              size: 15,
                            ),
                            Text('View Unit History'),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ]),
        ),
      ),
    );
  }
}
