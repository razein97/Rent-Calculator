import 'dart:math';

import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';
import 'package:rent_calculator/helpers/sizes_helpers.dart';
import 'package:rent_calculator/models/tenant_info_model.dart';
import 'package:rent_calculator/providers/building_provider.dart';
import 'package:rent_calculator/providers/tenants_provider.dart';
import 'package:rent_calculator/screens/unit_details_screen/widgets/desktop_widgets/edit_tenant_info.dart';
import 'package:rent_calculator/values/temp_values.dart';

class TentantDetailsDesktop extends StatefulWidget {
  const TentantDetailsDesktop({super.key});

  @override
  State<TentantDetailsDesktop> createState() => _TentantDetailsDesktopState();
}

class _TentantDetailsDesktopState extends State<TentantDetailsDesktop> {
  @override
  void initState() {
    super.initState();
    Provider.of<TenantProvider>(context, listen: false)
        .getTenantDetailsFromDB(TempValues.curBuildingID, TempValues.curUnitID);
    Provider.of<BuildingProvider>(context, listen: false)
        .getUnitDetails(TempValues.curBuildingID, TempValues.curUnitID);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: SizeHelper.displayWidth! * 1,
        height: SizeHelper.displayHeight! * 0.4,
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                // color: Colors.amber,
                width: SizeHelper.displayWidth! * 0.6,
                height: SizeHelper.displayHeight,
                child: Column(children: [
                  Expanded(
                      child: Provider.of<TenantProvider>(context, listen: true)
                              .tenantsDetails
                              .isNotEmpty
                          ? ListView(
                              children: [
                                for (TenantInfo tenant
                                    in Provider.of<TenantProvider>(context,
                                            listen: true)
                                        .tenantsDetails)
                                  Card(
                                    child: ListTile(
                                      leading: tenant.profilePhotos!.isNotEmpty
                                          ? SizedBox(
                                              width: 50,
                                              height: 50,
                                              child: FadeInImage(
                                                image: MemoryImage(
                                                  tenant.profilePhotos!.first
                                                      .bytes!,
                                                ),
                                                placeholder: const AssetImage(
                                                    'assets/images/Placeholder_view_vector.svg.png'),
                                              ),
                                            )
                                          : const SizedBox(
                                              width: 50,
                                              height: 50,
                                              child: Icon(
                                                  BoxIcons.bx_user_circle)),
                                      title: Text(
                                          'Name: ${tenant.firstName} ${tenant.lastName}'),
                                      subtitle: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              'Address: ${tenant.streetAddressLine1!.isNotEmpty ? tenant.streetAddressLine1 : ''}${tenant.streetAddressLine2!.isNotEmpty ? ', ' : ''}${tenant.streetAddressLine2!.isNotEmpty ? tenant.streetAddressLine2 : ''}${tenant.city!.isNotEmpty ? ', ' : ''}${tenant.city!.isNotEmpty ? tenant.city : ''}${tenant.state!.isNotEmpty ? ', ' : ''}${tenant.state!.isNotEmpty ? tenant.state : ''}${tenant.pincode!.isNotEmpty ? ', ' : ''}${tenant.pincode!.isNotEmpty ? tenant.pincode : ''}${tenant.country!.isNotEmpty ? ', ' : ''}${tenant.country!.isNotEmpty ? tenant.country : ''}${tenant.country!.isNotEmpty ? '.' : ''}'),
                                          Text(
                                              'Phone(Home): ${tenant.phoneHome!.isNotEmpty ? tenant.phoneHome : 'N/A'}'),
                                          Text(
                                              'Phone(Emergency): ${tenant.phoneEmergency!.isNotEmpty ? tenant.phoneEmergency : 'N/A'}'),
                                        ],
                                      ),
                                      trailing: IconButton(
                                          onPressed: () async {
                                            TenantInfo? editedInfo =
                                                await showDialog(
                                                    barrierDismissible: false,
                                                    context: context,
                                                    builder: (BuildContext
                                                            context) =>
                                                        EditTenantInfo(
                                                            tenantInfo:
                                                                tenant));

                                            if (editedInfo != null && mounted) {
                                              editedInfo.tenantID =
                                                  tenant.tenantID;
                                              editedInfo.buildingID =
                                                  tenant.buildingID;
                                              editedInfo.unitID = tenant.unitID;

                                              Provider.of<TenantProvider>(
                                                      context,
                                                      listen: false)
                                                  .updateTenantDetailsInDB(
                                                      editedInfo.tenantID!,
                                                      editedInfo.buildingID!,
                                                      editedInfo.unitID!,
                                                      editedInfo)
                                                  .whenComplete(() => Provider
                                                          .of<TenantProvider>(
                                                              context,
                                                              listen: false)
                                                      .updateTenant(
                                                          tenant, editedInfo));
                                            }
                                          },
                                          icon: const Icon(BoxIcons.bx_edit)),
                                    ),
                                  )
                              ],
                            )
                          : Card(
                              child: SizedBox(
                                  width: SizeHelper.displayWidth,
                                  height: SizeHelper.displayHeight,
                                  child: const Text('No Tenant Details')),
                            ))
                ]),
              ),
              SizedBox(
                width: SizeHelper.displayWidth! * 0.4,
                height: SizeHelper.displayHeight,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Card(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                  'Rent: ${context.watch<BuildingProvider>().unitsDetails.rent}'),
                              Text(
                                  'Security Deposit: ${context.watch<BuildingProvider>().unitsDetails.securityDeposit}'),
                            ]),
                      ),
                      context
                                  .watch<BuildingProvider>()
                                  .unitsDetails
                                  .amenities !=
                              null
                          ? Card(
                              child: Table(
                                // columnWidths: const {
                                //   0: FlexColumnWidth(0.4),
                                // },
                                border: TableBorder.all(
                                    width: 1,
                                    color: Theme.of(context).disabledColor),
                                children: <TableRow>[
                                  const TableRow(children: [
                                    Text(
                                      'Amenity Name',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'Amenity Price',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ]),
                                  for (AmenitiesModel amenitiesModel in context
                                      .watch<BuildingProvider>()
                                      .unitsDetails
                                      .amenities!)
                                    TableRow(children: [
                                      Text(
                                        amenitiesModel.amenityName,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.normal),
                                      ),
                                      Text(
                                        amenitiesModel.amenityPrice.toString(),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ])
                                ],
                              ),
                            )
                          : Container(),
                      const Text('Status'),
                      const Text('Due: ')
                    ]),
              )
            ]));
  }
}
