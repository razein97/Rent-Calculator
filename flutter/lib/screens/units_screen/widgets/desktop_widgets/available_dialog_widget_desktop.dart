import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:rent_calculator/routing/router.gr.dart' as auto_router;

class AvailableDialogWidgetDesktop extends StatelessWidget {
  final int buildingID;
  final int unitID;
  final String unitName;
  final double unitRent;
  const AvailableDialogWidgetDesktop(
      {super.key,
      required this.buildingID,
      required this.unitID,
      required this.unitName,
      required this.unitRent});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Container(
        decoration: const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            )),
        height: 50,
        child: const Center(child: Text('NO TENANT DETAILS FOUND')),
      ),
      titlePadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      actionsAlignment: MainAxisAlignment.spaceAround,
      actionsPadding: const EdgeInsets.symmetric(vertical: 30.0),
      actions: [
        SizedBox(
          width: 200.0,
          height: 50.0,
          child: ElevatedButton(
            onPressed: () {
              AutoRouter.of(context).popAndPush(auto_router.AddTenantScreen(
                  buildingID: buildingID,
                  unitID: unitID,
                  unitName: unitName,
                  unitRent: unitRent));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Icon(
                  BoxIcons.bx_user_plus,
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
                Icon(
                  FontAwesome.eye,
                  size: 15,
                ),
                Text('View Unit History'),
              ],
            ),
          ),
        ),
      ],
      content: SizedBox(
        width: 600.0,
        height: 400.0,
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          const Text(
            'There were no tenant details found.\n Please add some or view the previous details of the unit.',
            textAlign: TextAlign.center,
          ),
          Column(
            children: [
              SvgPicture.asset(
                'assets/images/no_data_cuate.svg',
                width: 500,
                height: 300,
                // fit: BoxFit.cover,
              ),
              const Text('Image by storyset on Freepik.com',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 10.0,
                    fontWeight: FontWeight.w200,
                  )),
            ],
          ) // Special Image
        ]),
      ),
    );
  }
}
