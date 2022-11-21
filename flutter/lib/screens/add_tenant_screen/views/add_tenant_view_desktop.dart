import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:rent_calculator/helpers/sizes_helpers.dart';
import 'package:rent_calculator/screens/add_tenant_screen/widgets/add_tenant_info.dart';
import 'package:rent_calculator/screens/add_tenant_screen/widgets/app_bar_add_new_tenant.dart';

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
                                          Card(
                                            color: Colors.blueGrey,
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  info.profilePhotos!.isNotEmpty
                                                      ? Image.memory(
                                                          width: 100,
                                                          height: 100,
                                                          info.profilePhotos!
                                                              .first.bytes!)
                                                      : Container(
                                                          decoration: BoxDecoration(
                                                              border: Border.all(
                                                                  color: Theme.of(
                                                                          context)
                                                                      .disabledColor,
                                                                  width: 2)),
                                                          width: 100,
                                                          height: 100,
                                                          child: const Icon(
                                                            FontAwesome.user,
                                                            size: 50,
                                                          )),
                                                  Container(
                                                    color: Colors.pink,
                                                    width: 600,
                                                    height: 200,
                                                    child: Column(children: [
                                                      SizedBox(
                                                        width: 600,
                                                        child: Text(
                                                            'Name: ${info.firstName} ${info.lastName == null ? info.lastName : ''}'),
                                                      ),
                                                      SizedBox(
                                                          width: 600,
                                                          child: Text(
                                                              'Address: ${info.streetAddressLine1 != 'null' ? info.streetAddressLine1 : ''}${info.streetAddressLine2 != 'null' ? ', ' : ''}${info.streetAddressLine2 != 'null' ? info.streetAddressLine2 : ''}${info.city != 'null' ? ', ' : ''}${info.city != 'null' ? info.city : ''}${info.state != 'null' ? ', ' : ''}${info.state != 'null' ? info.state : ''}${info.pincode != 'null' ? ', ' : ''}${info.pincode != 'null' ? info.pincode : ''}')),
                                                      SizedBox(
                                                        width: 600,
                                                        child: Text(
                                                            'Phone (Home): ${info.phoneHome != 'null' ? info.phoneHome : 'N/A'}'),
                                                      ),
                                                      SizedBox(
                                                        width: 600,
                                                        child: Text(
                                                            'Phone (Work): ${info.phoneWork != 'null' ? info.phoneWork : 'N/A'}'),
                                                      ),
                                                      Text(
                                                          ' ${info.phoneEmergency}'),
                                                      Text(' ${info.email}'),
                                                    ]),
                                                  )
                                                ]),
                                          )
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
