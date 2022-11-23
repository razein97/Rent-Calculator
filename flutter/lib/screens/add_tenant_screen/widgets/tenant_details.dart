import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';
import 'package:rent_calculator/helpers/sizes_helpers.dart';
import 'package:rent_calculator/models/tenant_info_model.dart';
import 'package:rent_calculator/providers/tenants_provider.dart';
import 'package:rent_calculator/screens/add_tenant_screen/widgets/add_tenant_info.dart';
import 'package:rent_calculator/screens/add_tenant_screen/widgets/enlarged_view.dart';

class TenantDetails extends StatefulWidget {
  const TenantDetails({super.key});

  @override
  State<TenantDetails> createState() => _TenantDetailsState();
}

class _TenantDetailsState extends State<TenantDetails> {
  int profilePhotoIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(
                width: SizeHelper.displayWidth! * 1,
                child: Text(
                  'Tenant Details',
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.start,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Provider.of<TenantProvider>(context, listen: true)
                      .tenantsDetails
                      .isNotEmpty
                  ? Column(
                      children: [
                        for (TenantInfo info in Provider.of<TenantProvider>(
                                context,
                                listen: true)
                            .tenantsDetails)
                          Column(
                            children: [
                              Card(
                                // elevation: 10,
                                shadowColor: Theme.of(context).dividerColor,
                                // color: Colors.blueGrey,
                                child: Stack(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        info.profilePhotos!.isNotEmpty
                                            ? info.profilePhotos!.length > 1
                                                ? SizedBox(
                                                    width: 200,
                                                    height: 150,
                                                    child: Column(
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            SizedBox(
                                                              height: 100,
                                                              width: 20,
                                                              child:
                                                                  RawMaterialButton(
                                                                      onPressed:
                                                                          () {
                                                                        if (profilePhotoIndex !=
                                                                            0) {
                                                                          profilePhotoIndex -=
                                                                              1;
                                                                        }
                                                                        setState(
                                                                            () {});
                                                                      },
                                                                      child:
                                                                          const Icon(
                                                                        BoxIcons
                                                                            .bx_chevron_left,
                                                                      )),
                                                            ),
                                                            Image.memory(
                                                                width: 100,
                                                                height: 100,
                                                                info
                                                                    .profilePhotos![
                                                                        profilePhotoIndex]
                                                                    .bytes!),
                                                            SizedBox(
                                                              height: 100,
                                                              width: 20,
                                                              child:
                                                                  RawMaterialButton(
                                                                      onPressed:
                                                                          () {
                                                                        if (info.profilePhotos!.length -
                                                                                1 !=
                                                                            profilePhotoIndex) {
                                                                          profilePhotoIndex +=
                                                                              1;
                                                                        }
                                                                        setState(
                                                                            () {});
                                                                      },
                                                                      child: const Icon(
                                                                          BoxIcons
                                                                              .bx_chevron_right)),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          width: 140,
                                                          height: 25,
                                                          child:
                                                              RawMaterialButton(
                                                                  fillColor: Theme.of(
                                                                          context)
                                                                      .disabledColor,
                                                                  onPressed:
                                                                      () {
                                                                    showDialog(
                                                                        context:
                                                                            context,
                                                                        builder: ((context) =>
                                                                            EnlargedView(
                                                                              files: info.profilePhotos!,
                                                                              index: profilePhotoIndex,
                                                                            )));
                                                                  },
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: const [
                                                                      Icon(
                                                                        BoxIcons
                                                                            .bx_search,
                                                                        size:
                                                                            15,
                                                                      ),
                                                                      Text(
                                                                          'Enlarge')
                                                                    ],
                                                                  )),
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                : Column(
                                                    children: [
                                                      SizedBox(
                                                        width: 200,
                                                        height: 100,
                                                        child: Image.memory(
                                                          width: 100,
                                                          height: 100,
                                                          info.profilePhotos!
                                                              .first.bytes!,
                                                          fit: BoxFit.contain,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 140,
                                                        height: 25,
                                                        child:
                                                            RawMaterialButton(
                                                                fillColor: Theme.of(
                                                                        context)
                                                                    .disabledColor,
                                                                onPressed: () {
                                                                  showDialog(
                                                                      context:
                                                                          context,
                                                                      builder: ((context) =>
                                                                          EnlargedView(
                                                                            files:
                                                                                info.profilePhotos!,
                                                                            index:
                                                                                profilePhotoIndex,
                                                                          )));
                                                                },
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: const [
                                                                    Icon(
                                                                      BoxIcons
                                                                          .bx_search,
                                                                      size: 15,
                                                                    ),
                                                                    Text(
                                                                        'Enlarge')
                                                                  ],
                                                                )),
                                                      )
                                                    ],
                                                  )
                                            : const SizedBox(
                                                width: 200,
                                                height: 100,
                                                child: Icon(
                                                  FontAwesome.user,
                                                  size: 50,
                                                ),
                                              ),
                                        Container(
                                          // color: Colors.pink,
                                          padding: const EdgeInsets.all(8),
                                          width: 600,
                                          child: Table(
                                            columnWidths: const {
                                              0: FlexColumnWidth(0.4),
                                            },
                                            // border: TableBorder.all(
                                            //     width: 1),
                                            children: <TableRow>[
                                              TableRow(
                                                children: [
                                                  const Text(
                                                    'Name:',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                      '${info.firstName} ${info.lastName!.isNotEmpty ? info.lastName : ''}'),
                                                ],
                                              ),
                                              TableRow(
                                                children: [
                                                  const Text(
                                                    'Address:',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                      '${info.streetAddressLine1!.isNotEmpty ? info.streetAddressLine1 : ''}${info.streetAddressLine2!.isNotEmpty ? ', ' : ''}${info.streetAddressLine2!.isNotEmpty ? info.streetAddressLine2 : ''}${info.city!.isNotEmpty ? ', ' : ''}${info.city!.isNotEmpty ? info.city : ''}${info.state!.isNotEmpty ? ', ' : ''}${info.state!.isNotEmpty ? info.state : ''}${info.pincode!.isNotEmpty ? ', ' : ''}${info.pincode!.isNotEmpty ? info.pincode : ''}${info.country!.isNotEmpty ? ', ' : ''}${info.country!.isNotEmpty ? info.country : ''}${info.country!.isNotEmpty ? '.' : ''}'),
                                                ],
                                              ),
                                              TableRow(
                                                children: [
                                                  const Text(
                                                    'Phone (Home):',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                      '${info.phoneHome!.isNotEmpty ? info.phoneHome : 'N/A'}'),
                                                ],
                                              ),
                                              TableRow(
                                                children: [
                                                  const Text(
                                                    'Phone (Work):',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                      '${info.phoneWork!.isNotEmpty ? info.phoneWork : 'N/A'}'),
                                                ],
                                              ),
                                              TableRow(
                                                children: [
                                                  const Text(
                                                    'Phone (Emergency):',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                      '${info.phoneEmergency!.isNotEmpty ? info.phoneEmergency : 'N/A'}'),
                                                ],
                                              ),
                                              TableRow(
                                                children: [
                                                  const Text(
                                                    'Email:',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                      '${info.email!.isNotEmpty ? info.email : 'N/A'}'),
                                                ],
                                              ),
                                              TableRow(
                                                children: [
                                                  const Text(''),
                                                  info.tenantDocs!.isNotEmpty
                                                      ? RawMaterialButton(
                                                          fillColor: Theme.of(
                                                                  context)
                                                              .disabledColor,
                                                          onPressed: () {
                                                            showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    ((context) =>
                                                                        EnlargedView(
                                                                          files:
                                                                              info.tenantDocs!,
                                                                          index:
                                                                              0,
                                                                        )));
                                                          },
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: const [
                                                              Icon(
                                                                BoxIcons
                                                                    .bx_file,
                                                                size: 15,
                                                              ),
                                                              Text(
                                                                  'View documents')
                                                            ],
                                                          ),
                                                        )
                                                      : const Text(''),
                                                ],
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    Positioned(
                                      top: 0,
                                      right: 0,
                                      child: Column(
                                        children: [
                                          RawMaterialButton(
                                            fillColor:
                                                Theme.of(context).dividerColor,
                                            constraints: const BoxConstraints(
                                                minWidth: 30, minHeight: 30),
                                            onPressed: () {
                                              Provider.of<TenantProvider>(
                                                      context,
                                                      listen: false)
                                                  .removeTenant(info);
                                            },
                                            child: const Icon(BoxIcons.bx_x),
                                          ),
                                          RawMaterialButton(
                                            fillColor:
                                                Theme.of(context).dividerColor,
                                            constraints: const BoxConstraints(
                                                minWidth: 30, minHeight: 30),
                                            onPressed: () async {
                                              TenantInfo? editedInfo =
                                                  await showDialog(
                                                      barrierDismissible: false,
                                                      context: context,
                                                      builder: (context) =>
                                                          AddTenantInfo(
                                                              tenantInfo:
                                                                  info));

                                              if (editedInfo != null &&
                                                  mounted) {
                                                Provider.of<TenantProvider>(
                                                        context,
                                                        listen: false)
                                                    .updateTenant(
                                                        info, editedInfo);
                                              }
                                            },
                                            child: const Icon(BoxIcons.bx_edit),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10.0,
                              )
                            ],
                          ),
                      ],
                    )
                  : Container(),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                width: SizeHelper.displayWidth! * 1,
                height: 50.0,
                child: RawMaterialButton(
                    fillColor: Theme.of(context).disabledColor,
                    onPressed: () async {
                      TenantInfo? newInfo = await showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (BuildContext context) =>
                              const AddTenantInfo(tenantInfo: null));
                      if (newInfo != null && mounted) {
                        Provider.of<TenantProvider>(context, listen: false)
                            .addTenant(newInfo);
                      }
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Icon(BoxIcons.bx_user_plus),
                        Text('Add a tenant')
                      ],
                    )),
              )
            ],
          )),
    );
  }
}
