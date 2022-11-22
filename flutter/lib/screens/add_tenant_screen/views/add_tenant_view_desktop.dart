import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_platform_alert/flutter_platform_alert.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:rent_calculator/helpers/sizes_helpers.dart';
import 'package:rent_calculator/screens/add_tenant_screen/widgets/add_tenant_info.dart';
import 'package:rent_calculator/screens/add_tenant_screen/widgets/app_bar_add_new_tenant.dart';
import 'package:rent_calculator/screens/add_tenant_screen/widgets/enlarged_view.dart';

class AddTenantViewDesktop extends StatefulWidget {
  final int buildingID;
  final int unitID;
  final String unitName;
  final double unitRent;

  const AddTenantViewDesktop(
      {super.key,
      required this.buildingID,
      required this.unitID,
      required this.unitName,
      required this.unitRent});

  @override
  State<AddTenantViewDesktop> createState() => _AddTenantViewDesktopState();
}

class _AddTenantViewDesktopState extends State<AddTenantViewDesktop> {
  final _formKeyTenantView = GlobalKey<FormBuilderState>();

  List<TenantInfo> tenantDetails = [];
  int profilePhotoIndex = 0;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarAddNewTenant(
        preferredSize: const Size(double.infinity, 60),
        unitID: widget.unitID,
        title: widget.unitName,
      ),
      body: FormBuilder(
        key: _formKeyTenantView,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Tenant Details
              // _addCard()
              const SizedBox(
                height: 30.0,
              ),
              Center(
                child: SizedBox(
                  width: 900,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          SizedBox(
                            width: SizeHelper.displayWidth! * 1,
                            child: Text(
                              'Unit Details:',
                              style: Theme.of(context).textTheme.titleLarge,
                              textAlign: TextAlign.start,
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 200,
                                height: 50.0,
                                child: FormBuilderTextField(
                                  name: 'unit_rent',
                                  initialValue: widget.unitRent.toString(),
                                  keyboardType:
                                      const TextInputType.numberWithOptions(
                                          decimal: true),
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp(r'^\d+\.?\d{0,2}')),
                                  ],
                                  decoration: const InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.blue, width: 1.0)),
                                    labelText: 'Unit Rent',
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.blue, width: 1.0),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 200,
                                height: 50.0,
                                child: FormBuilderTextField(
                                  name: 'security_deposit',
                                  keyboardType:
                                      const TextInputType.numberWithOptions(
                                          decimal: true),
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp(r'^\d+\.?\d{0,2}')),
                                  ],
                                  decoration: const InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.blue, width: 1.0)),
                                    labelText: 'Security Deposit',
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.blue, width: 1.0),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 200,
                                height: 50.0,
                                child: FormBuilderTextField(
                                  name: 'current_electricity_unit',
                                  keyboardType:
                                      const TextInputType.numberWithOptions(
                                          decimal: true),
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp(r'^\d+\.?\d{0,2}')),
                                  ],
                                  decoration: const InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.blue, width: 1.0)),
                                    labelText: 'Current Electricity Unit',
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.blue, width: 1.0),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              Center(
                child: SizedBox(
                    width: 900,
                    child: Card(
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
                              tenantDetails.isNotEmpty
                                  ? Column(
                                      children: [
                                        for (TenantInfo info in tenantDetails)
                                          Column(
                                            children: [
                                              Card(
                                                // elevation: 10,
                                                shadowColor: Theme.of(context)
                                                    .dividerColor,
                                                // color: Colors.blueGrey,
                                                child: Stack(
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        info.profilePhotos!
                                                                .isNotEmpty
                                                            ? info.profilePhotos!
                                                                        .length >
                                                                    1
                                                                ? SizedBox(
                                                                    width: 200,
                                                                    height: 150,
                                                                    child:
                                                                        Column(
                                                                      children: [
                                                                        Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            SizedBox(
                                                                              height: 100,
                                                                              width: 20,
                                                                              child: RawMaterialButton(
                                                                                  onPressed: () {
                                                                                    if (profilePhotoIndex != 0) {
                                                                                      profilePhotoIndex -= 1;
                                                                                    }
                                                                                    setState(() {});
                                                                                  },
                                                                                  child: const Icon(
                                                                                    BoxIcons.bx_chevron_left,
                                                                                  )),
                                                                            ),
                                                                            Image.memory(
                                                                                width: 100,
                                                                                height: 100,
                                                                                info.profilePhotos![profilePhotoIndex].bytes!),
                                                                            SizedBox(
                                                                              height: 100,
                                                                              width: 20,
                                                                              child: RawMaterialButton(
                                                                                  onPressed: () {
                                                                                    if (info.profilePhotos!.length - 1 != profilePhotoIndex) {
                                                                                      profilePhotoIndex += 1;
                                                                                    }
                                                                                    setState(() {});
                                                                                  },
                                                                                  child: const Icon(BoxIcons.bx_chevron_right)),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                              140,
                                                                          height:
                                                                              25,
                                                                          child: RawMaterialButton(
                                                                              fillColor: Theme.of(context).disabledColor,
                                                                              onPressed: () {
                                                                                showDialog(
                                                                                    context: context,
                                                                                    builder: ((context) => EnlargedView(
                                                                                          files: info.profilePhotos!,
                                                                                          index: profilePhotoIndex,
                                                                                        )));
                                                                              },
                                                                              child: Row(
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: const [
                                                                                  Icon(
                                                                                    BoxIcons.bx_search,
                                                                                    size: 15,
                                                                                  ),
                                                                                  Text('Enlarge')
                                                                                ],
                                                                              )),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  )
                                                                : Column(
                                                                    children: [
                                                                      SizedBox(
                                                                        width:
                                                                            200,
                                                                        height:
                                                                            100,
                                                                        child: Image
                                                                            .memory(
                                                                          width:
                                                                              100,
                                                                          height:
                                                                              100,
                                                                          info
                                                                              .profilePhotos!
                                                                              .first
                                                                              .bytes!,
                                                                          fit: BoxFit
                                                                              .contain,
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            140,
                                                                        height:
                                                                            25,
                                                                        child: RawMaterialButton(
                                                                            fillColor: Theme.of(context).disabledColor,
                                                                            onPressed: () {
                                                                              showDialog(
                                                                                  context: context,
                                                                                  builder: ((context) => EnlargedView(
                                                                                        files: info.profilePhotos!,
                                                                                        index: profilePhotoIndex,
                                                                                      )));
                                                                            },
                                                                            child: Row(
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: const [
                                                                                Icon(
                                                                                  BoxIcons.bx_search,
                                                                                  size: 15,
                                                                                ),
                                                                                Text('Enlarge')
                                                                              ],
                                                                            )),
                                                                      )
                                                                    ],
                                                                  )
                                                            : const SizedBox(
                                                                width: 200,
                                                                height: 100,
                                                                child: Icon(
                                                                  FontAwesome
                                                                      .user,
                                                                  size: 50,
                                                                ),
                                                              ),
                                                        Container(
                                                          // color: Colors.pink,
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8),
                                                          width: 600,
                                                          child: Table(
                                                            columnWidths: const {
                                                              0: FlexColumnWidth(
                                                                  0.4),
                                                            },
                                                            // border: TableBorder.all(
                                                            //     width: 1),
                                                            children: <
                                                                TableRow>[
                                                              TableRow(
                                                                children: [
                                                                  const Text(
                                                                      'Name:'),
                                                                  Text(
                                                                      '${info.firstName} ${info.lastName != 'null' ? info.lastName : ''}'),
                                                                ],
                                                              ),
                                                              TableRow(
                                                                children: [
                                                                  const Text(
                                                                      'Address:'),
                                                                  Text(
                                                                      '${info.streetAddressLine1 != 'null' ? info.streetAddressLine1 : ''}${info.streetAddressLine2 != 'null' ? ', ' : ''}${info.streetAddressLine2 != 'null' ? info.streetAddressLine2 : ''}${info.city != 'null' ? ', ' : ''}${info.city != 'null' ? info.city : ''}${info.state != 'null' ? ', ' : ''}${info.state != 'null' ? info.state : ''}${info.pincode != 'null' ? ', ' : ''}${info.pincode != 'null' ? info.pincode : ''}'),
                                                                ],
                                                              ),
                                                              TableRow(
                                                                children: [
                                                                  const Text(
                                                                      'Phone (Home):'),
                                                                  Text(
                                                                      '${info.phoneHome != 'null' ? info.phoneHome : 'N/A'}'),
                                                                ],
                                                              ),
                                                              TableRow(
                                                                children: [
                                                                  const Text(
                                                                      'Phone (Work):'),
                                                                  Text(
                                                                      '${info.phoneWork != 'null' ? info.phoneWork : 'N/A'}'),
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
                                                                      '${info.phoneEmergency != 'null' ? info.phoneEmergency : 'N/A'}'),
                                                                ],
                                                              ),
                                                              TableRow(
                                                                children: [
                                                                  const Text(
                                                                      'Email:'),
                                                                  Text(
                                                                      '${info.email != 'null' ? info.email : 'N/A'}'),
                                                                ],
                                                              ),
                                                              TableRow(
                                                                children: [
                                                                  const Text(
                                                                      ''),
                                                                  info.tenantDocs!
                                                                          .isNotEmpty
                                                                      ? RawMaterialButton(
                                                                          fillColor:
                                                                              Theme.of(context).disabledColor,
                                                                          onPressed:
                                                                              () {
                                                                            showDialog(
                                                                                context: context,
                                                                                builder: ((context) => EnlargedView(
                                                                                      files: info.tenantDocs!,
                                                                                      index: 0,
                                                                                    )));
                                                                          },
                                                                          child:
                                                                              Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: const [
                                                                              Icon(
                                                                                BoxIcons.bx_file,
                                                                                size: 15,
                                                                              ),
                                                                              Text('View documents')
                                                                            ],
                                                                          ),
                                                                        )
                                                                      : const Text(
                                                                          ''),
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
                                                      child: RawMaterialButton(
                                                        fillColor:
                                                            Theme.of(context)
                                                                .dividerColor,
                                                        constraints:
                                                            const BoxConstraints(
                                                                minWidth: 30,
                                                                minHeight: 30),
                                                        onPressed: () {
                                                          setState(() {
                                                            tenantDetails
                                                                .remove(info);
                                                          });
                                                        },
                                                        child: const Icon(
                                                            BoxIcons.bx_x),
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
                                child: ElevatedButton(
                                    onPressed: () async {
                                      TenantInfo info = await showDialog(
                                          barrierDismissible: false,
                                          context: context,
                                          builder: (BuildContext context) =>
                                              const AddTenantInfo(
                                                  tenantInfo: null));

                                      tenantDetails.add(info);
                                      setState(() {});
                                    },
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: const [
                                        Icon(BoxIcons.bx_user_plus),
                                        Text('Add a tenant')
                                      ],
                                    )),
                              )
                            ],
                          )),
                    )),
              )
              //  ListView.builder(itemBuilder: )
            ],
          ),
        ),
      ),
    );
  }
}

class TenantInfo {
  String? firstName;
  String? lastName;
  String? streetAddressLine1;
  String? streetAddressLine2;
  String? city;
  String? state;
  String? pincode;
  String? phoneHome;
  String? phoneWork;
  String? phoneEmergency;
  String? email;
  String? notes;
  List<PlatformFile>? profilePhotos;
  List<PlatformFile>? tenantDocs;
}
