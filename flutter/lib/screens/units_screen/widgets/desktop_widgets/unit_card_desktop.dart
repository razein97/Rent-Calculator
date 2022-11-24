import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';
import 'package:rent_calculator/providers/building_provider.dart';
import 'package:rent_calculator/routing/router.gr.dart' as auto_router;
import 'package:rent_calculator/screens/units_screen/widgets/desktop_widgets/available_dialog_widget_desktop.dart';
import 'package:rent_calculator/screens/units_screen/widgets/desktop_widgets/edit_rent_widget_desktop.dart';

class UnitCardDesktop extends StatelessWidget {
  final int buildingID;
  final String nameOfUnit;
  final bool rentedStatus;
  final int unitID;
  final double width;
  final double height;
  final double rent;
  const UnitCardDesktop(
      {super.key,
      required this.nameOfUnit,
      required this.width,
      required this.height,
      required this.rentedStatus,
      required this.buildingID,
      required this.rent,
      required this.unitID});

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
                .push(auto_router.UnitDetailsScreen(unitName: nameOfUnit))
            : showDialog(
                context: context,
                builder: (BuildContext context) => AvailableDialogWidgetDesktop(
                      buildingID: buildingID,
                      unitID: unitID,
                      unitName: nameOfUnit,
                      unitRent: rent,
                    ));
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
                    child: Icon(
                      rentedStatus
                          ? FontAwesome.house_chimney
                          : FontAwesome.house_chimney_user,
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
                      onPressed: () => showDialog(
                          context: context,
                          builder: (BuildContext context) =>
                              EditRentWidgetDesktop(
                                rent: rent,
                                unitName: nameOfUnit,
                                buildingID: buildingID,
                                unitID: unitID,
                              )),
                      child: const Icon(BoxIcons.bx_dots_vertical_rounded),
                    ),
                  ),
                ],
              ),
            ),
            Text(nameOfUnit),
            Text('Rent: $rent'),
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
