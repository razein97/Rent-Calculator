import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rent_calculator/routing/router.gr.dart' as auto_router;
import 'package:rent_calculator/screens/units_screen/widgets/desktop_widgets/available_dialog_desktop.dart';

class UnitCardDesktop extends StatelessWidget {
  final String nameOfUnit;
  final bool rentedStatus;
  final double rent;
  final double width;
  final double height;
  const UnitCardDesktop(
      {super.key,
      required this.nameOfUnit,
      required this.width,
      required this.height,
      required this.rentedStatus,
      required this.rent});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: Theme.of(context).brightness == Brightness.dark
          ? const Color.fromRGBO(42, 43, 45, 1)
          : Colors.amber,
      shape: const RoundedRectangleBorder(
          side: BorderSide(color: Color.fromARGB(255, 68, 68, 68), width: 0.2),
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      onPressed: () {
        rentedStatus
            ? AutoRouter.of(context)
                .push(auto_router.UnitDetailsView(unitName: nameOfUnit))
            : showDialog(
                context: context,
                builder: (BuildContext context) =>
                    const AvailableDialogDesktop());
      },
      child: SizedBox(
        // color: Colors.blue.shade400,
        width: width,
        height: height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RawMaterialButton(
                    onPressed: null,
                    child: FaIcon(
                      rentedStatus
                          ? FontAwesomeIcons.houseChimneyUser
                          : FontAwesomeIcons.houseChimneyWindow,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(
                    width: 40.0,
                    child: RawMaterialButton(
                      shape: const RoundedRectangleBorder(
                          side: BorderSide(
                              color: Color.fromRGBO(66, 66, 68, 1), width: 0.2),
                          borderRadius: BorderRadius.all(Radius.circular(5.0))),
                      onPressed: () {},
                      child: const FaIcon(FontAwesomeIcons.ellipsis),
                    ),
                  ),
                ],
              ),
            ),
            Text(nameOfUnit),
            Text(rent.toString()),
            Container(
                decoration: BoxDecoration(
                  border: Border.all(
                      color: rentedStatus ? Colors.red : Colors.green),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    rentedStatus ? 'Unavailable' : 'Available',
                    style: TextStyle(
                        color: rentedStatus ? Colors.red : Colors.green),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
