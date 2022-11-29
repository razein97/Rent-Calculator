import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';
import 'package:rent_calculator/helpers/sizes_helpers.dart';
import 'package:rent_calculator/models/tenant_info_model.dart';
import 'package:rent_calculator/providers/building_provider.dart';
import 'package:rent_calculator/providers/tenants_provider.dart';
import 'package:rent_calculator/screens/unit_details_screen/widgets/desktop_widgets/create_bill_dialog.dart';
import 'package:rent_calculator/screens/unit_details_screen/widgets/desktop_widgets/delete_dialog.dart';
import 'package:rent_calculator/screens/unit_details_screen/widgets/desktop_widgets/edit_tenant_info.dart';
import 'package:rent_calculator/screens/unit_details_screen/widgets/desktop_widgets/view_tenant_info_desktop.dart';

class TentantDetailsDesktopWidget extends StatefulWidget {
  const TentantDetailsDesktopWidget({super.key});

  @override
  State<TentantDetailsDesktopWidget> createState() =>
      _TentantDetailsDesktopWidgetState();
}

class _TentantDetailsDesktopWidgetState
    extends State<TentantDetailsDesktopWidget> {
  @override
  void initState() {
    super.initState();
    Provider.of<TenantProvider>(context, listen: false).getTenantDetailsFromDB(
        context.read<BuildingProvider>().unitsDetails.buildingId!,
        context.read<BuildingProvider>().unitsDetails.unitId!);
    Provider.of<BuildingProvider>(context, listen: false).getUnitDetails(
        context.read<BuildingProvider>().unitsDetails.buildingId!,
        context.read<BuildingProvider>().unitsDetails.unitId!);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: SizeHelper.displayWidth! * 1,
        height: SizeHelper.displayHeight! * 0.4,
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: SizeHelper.displayWidth! * 0.55,
                height: SizeHelper.displayHeight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 1, color: Theme.of(context).disabledColor),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    child: Column(children: [
                      Expanded(
                          child: Provider.of<TenantProvider>(context,
                                      listen: true)
                                  .tenantsDetails
                                  .isNotEmpty
                              ? ListView(
                                  children: [
                                    for (TenantInfo tenant
                                        in Provider.of<TenantProvider>(context,
                                                listen: true)
                                            .tenantsDetails)
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 1,
                                              color: Theme.of(context)
                                                  .disabledColor),
                                          // borderRadius: const BorderRadius.all(
                                          //   Radius.circular(5),
                                          // ),
                                        ),
                                        child: ListTile(
                                          onTap: () {
                                            showDialog(
                                              context: context,
                                              builder: (context) =>
                                                  ViewTenantInfoDesktop(
                                                      tenantInfo: tenant),
                                            );
                                          },
                                          leading: tenant
                                                  .profilePhotos!.isNotEmpty
                                              ? SizedBox(
                                                  width: 50,
                                                  height: 50,
                                                  child: FadeInImage(
                                                    image: MemoryImage(
                                                      tenant.profilePhotos!
                                                          .first.bytes!,
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
                                          subtitle: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Name: ${tenant.firstName} ${tenant.lastName}',
                                              ),
                                              Text(
                                                  'Address: ${tenant.streetAddressLine1!.isNotEmpty ? tenant.streetAddressLine1 : ''}${tenant.streetAddressLine2!.isNotEmpty ? ', ' : ''}${tenant.streetAddressLine2!.isNotEmpty ? tenant.streetAddressLine2 : ''}${tenant.city!.isNotEmpty ? ', ' : ''}${tenant.city!.isNotEmpty ? tenant.city : ''}${tenant.state!.isNotEmpty ? ', ' : ''}${tenant.state!.isNotEmpty ? tenant.state : ''}${tenant.pincode!.isNotEmpty ? ', ' : ''}${tenant.pincode!.isNotEmpty ? tenant.pincode : ''}${tenant.country!.isNotEmpty ? ', ' : ''}${tenant.country!.isNotEmpty ? tenant.country : ''}${tenant.country!.isNotEmpty ? '.' : ''}'),
                                              Text(
                                                  'Phone(Home): ${tenant.phoneHome!.isNotEmpty ? tenant.phoneHome : 'N/A'}'),
                                              Text(
                                                  'Phone(Emergency): ${tenant.phoneEmergency!.isNotEmpty ? tenant.phoneEmergency : 'N/A'}'),
                                            ],
                                          ),
                                          trailing: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              RawMaterialButton(
                                                  onPressed: () async {
                                                    TenantInfo? editedInfo =
                                                        await showDialog(
                                                            barrierDismissible:
                                                                false,
                                                            context: context,
                                                            builder: (BuildContext
                                                                    context) =>
                                                                EditTenantInfo(
                                                                    tenantInfo:
                                                                        tenant));

                                                    if (editedInfo != null &&
                                                        mounted) {
                                                      editedInfo.tenantID =
                                                          tenant.tenantID;
                                                      editedInfo.buildingID =
                                                          tenant.buildingID;
                                                      editedInfo.unitID =
                                                          tenant.unitID;

                                                      Provider.of<
                                                                  TenantProvider>(
                                                              context,
                                                              listen: false)
                                                          .updateTenantDetailsInDB(
                                                              editedInfo
                                                                  .tenantID!,
                                                              editedInfo
                                                                  .buildingID!,
                                                              editedInfo
                                                                  .unitID!,
                                                              editedInfo)
                                                          .whenComplete(() => Provider
                                                                  .of<TenantProvider>(
                                                                      context,
                                                                      listen:
                                                                          false)
                                                              .updateTenant(
                                                                  tenant,
                                                                  editedInfo));
                                                    }
                                                  },
                                                  child: const Icon(
                                                      BoxIcons.bx_edit_alt)),
                                              RawMaterialButton(
                                                  onPressed: () async {
                                                    bool delete =
                                                        await showDialog(
                                                            barrierDismissible:
                                                                false,
                                                            context: context,
                                                            builder: (BuildContext
                                                                    context) =>
                                                                DeleteDialog(
                                                                  tenantName:
                                                                      '${tenant.firstName} ${tenant.lastName}',
                                                                ));

                                                    if (delete && mounted) {
                                                      Provider.of<TenantProvider>(
                                                              context,
                                                              listen: false)
                                                          .removeTenant(tenant);
                                                    }
                                                  },
                                                  child: const Icon(
                                                      FontAwesome.trash_can))
                                            ],
                                          ),
                                        ),
                                      ),
                                  ],
                                )
                              : Card(
                                  child: SizedBox(
                                      width: SizeHelper.displayWidth,
                                      height: SizeHelper.displayHeight,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            'No Tenant Details',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge,
                                          ),
                                        ],
                                      )),
                                )),
                      MaterialButton(
                        color: Theme.of(context).buttonColor,
                        // style: Theme.of(context).buttonColor,
                        onPressed: () async {
                          TenantInfo? newInfo = await showDialog(
                              context: context,
                              builder: (BuildContext context) =>
                                  const EditTenantInfo(tenantInfo: null));

                          if (newInfo != null && mounted) {
                            newInfo.buildingID = context
                                .read<BuildingProvider>()
                                .unitsDetails
                                .buildingId!;
                            newInfo.unitID = context
                                .read<BuildingProvider>()
                                .unitsDetails
                                .unitId!;

                            Provider.of<TenantProvider>(context, listen: false)
                                .saveTenantDetailsToDB(
                                    context
                                        .read<BuildingProvider>()
                                        .unitsDetails
                                        .buildingId!,
                                    context
                                        .read<BuildingProvider>()
                                        .unitsDetails
                                        .unitId!,
                                    context
                                        .read<BuildingProvider>()
                                        .unitsDetails
                                        .rent!,
                                    context
                                        .read<BuildingProvider>()
                                        .unitsDetails
                                        .securityDeposit!,
                                    [newInfo],
                                    context
                                        .read<BuildingProvider>()
                                        .unitsDetails
                                        .amenities!,
                                    DateTime.now().millisecondsSinceEpoch)
                                .whenComplete(() => context
                                    .read<TenantProvider>()
                                    .getTenantDetailsFromDB(
                                        context
                                            .read<BuildingProvider>()
                                            .unitsDetails
                                            .buildingId!,
                                        context
                                            .read<BuildingProvider>()
                                            .unitsDetails
                                            .unitId!));
                          }
                        },
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(BoxIcons.bx_plus),
                              Text('Add a tenant'),
                            ]),
                      )
                    ]),
                  ),
                ),
              ),
              SizedBox(
                width: SizeHelper.displayWidth! * 0.45,
                height: SizeHelper.displayHeight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 1, color: Theme.of(context).disabledColor),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    width: SizeHelper.displayWidth,
                    // height: SizeHelper.displayHeight,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1,
                                    color: Theme.of(context).disabledColor),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(5),
                                ),
                              ),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                        'Rent: ${context.watch<BuildingProvider>().unitsDetails.rent}'),
                                    Text(
                                        'Security Deposit: ${context.watch<BuildingProvider>().unitsDetails.securityDeposit}'),
                                  ]),
                            ),
                          ),
                          context
                                      .watch<BuildingProvider>()
                                      .unitsDetails
                                      .amenities !=
                                  null
                              ? Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    // width: SizeHelper.displayWidth! * 0.3,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1,
                                          color:
                                              Theme.of(context).disabledColor),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(5),
                                      ),
                                    ),
                                    child: Table(
                                      // columnWidths: const {
                                      //   0: FlexColumnWidth(0.4),
                                      // },
                                      border: TableBorder.all(
                                          width: 1,
                                          color:
                                              Theme.of(context).disabledColor),
                                      children: <TableRow>[
                                        const TableRow(children: [
                                          Center(
                                            child: Padding(
                                              padding: EdgeInsets.all(4.0),
                                              child: Text(
                                                'Amenity Name',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                          Center(
                                            child: Padding(
                                              padding: EdgeInsets.all(4.0),
                                              child: Text(
                                                'Amenity Price',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ]),
                                        for (AmenitiesModel amenitiesModel
                                            in context
                                                .watch<BuildingProvider>()
                                                .unitsDetails
                                                .amenities!)
                                          TableRow(children: [
                                            Center(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(4.0),
                                                child: Text(
                                                  amenitiesModel.amenityName,
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.normal),
                                                ),
                                              ),
                                            ),
                                            Center(
                                              child: Text(
                                                amenitiesModel.amenityPrice
                                                    .toString(),
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                            ),
                                          ])
                                      ],
                                    ),
                                  ),
                                )
                              : Container(),
                          const Center(child: Text('Due: ')),
                          Center(
                            child: SizedBox(
                              width: SizeHelper.displayWidth! * 0.3,
                              child: RawMaterialButton(
                                fillColor: Theme.of(context).disabledColor,
                                onPressed: () async {
                                  TenantInfo? newInfo = await showDialog(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          CreateBillWidget(
                                            curElectricUnit: context
                                                .read<BuildingProvider>()
                                                .unitsDetails
                                                .electricityUnit!,
                                          ));

                                  if (newInfo != null && mounted) {
                                    newInfo.buildingID = context
                                        .read<BuildingProvider>()
                                        .unitsDetails
                                        .buildingId!;
                                    newInfo.unitID = context
                                        .read<BuildingProvider>()
                                        .unitsDetails
                                        .unitId!;

                                    Provider.of<TenantProvider>(context,
                                            listen: false)
                                        .saveTenantDetailsToDB(
                                            context
                                                .read<BuildingProvider>()
                                                .unitsDetails
                                                .buildingId!,
                                            context
                                                .read<BuildingProvider>()
                                                .unitsDetails
                                                .unitId!,
                                            context
                                                .read<BuildingProvider>()
                                                .unitsDetails
                                                .rent!,
                                            context
                                                .read<BuildingProvider>()
                                                .unitsDetails
                                                .securityDeposit!,
                                            [newInfo],
                                            context
                                                .read<BuildingProvider>()
                                                .unitsDetails
                                                .amenities!,
                                            DateTime.now()
                                                .millisecondsSinceEpoch)
                                        .whenComplete(() => context
                                            .read<TenantProvider>()
                                            .getTenantDetailsFromDB(
                                                context
                                                    .read<BuildingProvider>()
                                                    .unitsDetails
                                                    .buildingId!,
                                                context
                                                    .read<BuildingProvider>()
                                                    .unitsDetails
                                                    .unitId!));
                                  }
                                },
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(BoxIcons.bx_plus),
                                      Text('Create Bill'),
                                    ]),
                              ),
                            ),
                          )
                        ]),
                  ),
                ),
              )
            ]));
  }
}
