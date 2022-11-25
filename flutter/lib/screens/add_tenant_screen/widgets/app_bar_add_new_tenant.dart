import 'dart:convert';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';
import 'package:rent_calculator/models/tenant_info_model.dart';
import 'package:rent_calculator/providers/building_provider.dart';
import 'package:rent_calculator/providers/tenants_provider.dart';
import 'package:rent_calculator/routing/router.gr.dart' as auto_router;

class AppBarAddNewTenant extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;
  final int unitID;
  final String title;
  final int buildingId;
  final GlobalKey<FormBuilderState> controller;
  final List<int> amenitiesIntList;

  const AppBarAddNewTenant({
    super.key,
    required this.preferredSize,
    required this.unitID,
    required this.title,
    required this.buildingId,
    required this.controller,
    required this.amenitiesIntList,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      automaticallyImplyLeading: true,
      title: Text('Add Tenant Details to $title'),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
              onPressed: () {
                bool? validated = controller.currentState?.saveAndValidate();

                List<AmenitiesModel> amenities = [];
                if (validated!) {
                  Provider.of<TenantProvider>(context, listen: false).saving =
                      true;
                  Provider.of<TenantProvider>(context, listen: false)
                      .notifyListener();
                  int checkInDate = controller.currentState
                      ?.fields['check_in_date']?.value.millisecondsSinceEpoch;

                  for (int i in amenitiesIntList) {
                    if (controller
                            .currentState!.fields['amenity_name_$i']!.value !=
                        null) {
                      amenities.add(
                        AmenitiesModel(
                          controller
                              .currentState!.fields['amenity_name_$i']!.value
                              .toString(),
                          double.parse(controller
                              .currentState!.fields['amenity_price_$i']!.value),
                        ),
                      );
                    }
                  }

                  double rent = double.parse(
                      controller.currentState!.fields['unit_rent']!.value);

                  double securityDeposit = double.parse(controller
                      .currentState!.fields['security_deposit']!.value);

                  Provider.of<TenantProvider>(context, listen: false)
                      .saveTenantDetailsToDB(
                          buildingId,
                          unitID,
                          rent,
                          securityDeposit,
                          amenities.isNotEmpty ? jsonEncode(amenities) : '',
                          checkInDate)
                      .whenComplete(() => AutoRouter.of(context)
                          .replace(const auto_router.UnitDetailsScreen()));

                  //Update unit rent
                  Provider.of<BuildingProvider>(context, listen: false)
                      .updateUnitRent(buildingId, unitID, rent, checkInDate);

                  //Update unit security deposit
                  Provider.of<BuildingProvider>(context, listen: false)
                      .updateUnitSecurityDeposit(
                          buildingId, unitID, securityDeposit);

                  //Add amenities
                  Provider.of<BuildingProvider>(context, listen: false)
                      .updateUnitAmenities(buildingId, unitID, amenities);
                }
              },
              child: Row(
                children: const [
                  Icon(BoxIcons.bx_save),
                  Text('Save'),
                ],
              )),
        )
      ],
    );
  }
}
