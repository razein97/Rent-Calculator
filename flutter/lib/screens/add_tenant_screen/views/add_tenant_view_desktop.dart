import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_validator/form_validator.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
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
  final _textFirstNameEditingController = TextEditingController();
  final _textLastNameEditingController = TextEditingController();

  List<TextEditingController> _textEditingControllers = [];
  List<Widget> _tenantDetails = [];

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
                              SizedBox(
                                width: SizeHelper.displayWidth! * 1,
                                height: 50.0,
                                child: ElevatedButton(
                                    onPressed: () {
                                      showDialog(
                                          barrierDismissible: false,
                                          context: context,
                                          builder: (BuildContext context) =>
                                              const AddTenantInfo(
                                                  tenantInfo: null));
                                    },
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: const [
                                        FaIcon(FontAwesomeIcons.plus),
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
}
