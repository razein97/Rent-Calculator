import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:intl/intl.dart';
import 'package:modal_progress_hud_alt/modal_progress_hud_alt.dart';
import 'package:provider/provider.dart';
import 'package:rent_calculator/helpers/sizes_helpers.dart';
import 'package:rent_calculator/providers/tenants_provider.dart';
import 'package:rent_calculator/screens/add_tenant_screen/widgets/app_bar_add_new_tenant.dart';
import 'package:rent_calculator/screens/add_tenant_screen/widgets/tenant_details.dart';

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
  bool saving = false;
  final _formKeyUnitDetails = GlobalKey<FormBuilderState>();
  List<int> amenitiesInt = [];
  int amenitiesCount = 0;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    Provider.of<TenantProvider>(context, listen: false).tenantsDetails = [];
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: Provider.of<TenantProvider>(context, listen: true).saving,
      progressIndicator: Container(
        width: 200,
        height: 200,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            SpinKitCubeGrid(
              color: Colors.blue,
            ),
            Text(
              'saving...',
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.blue,
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.none),
            )
          ],
        ),
      ),
      child: Scaffold(
        appBar: AppBarAddNewTenant(
          preferredSize: const Size(double.infinity, 60),
          unitID: widget.unitID,
          title: widget.unitName,
          buildingId: widget.buildingID,
          controller: _formKeyUnitDetails,
          amenitiesIntList: amenitiesInt,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Tenant Details
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
                          FormBuilder(
                            key: _formKeyUnitDetails,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(
                                      width: 200,
                                      child: FormBuilderTextField(
                                        name: 'unit_rent',
                                        initialValue:
                                            widget.unitRent.toString(),
                                        keyboardType: const TextInputType
                                            .numberWithOptions(decimal: true),
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp(r'^\d+\.?\d{0,2}')),
                                        ],
                                        decoration: const InputDecoration(
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.blue,
                                                  width: 1.0)),
                                          labelText: 'Unit Rent',
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.blue, width: 1.0),
                                          ),
                                        ),
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        validator:
                                            FormBuilderValidators.required(),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 200,
                                      child: FormBuilderTextField(
                                        name: 'security_deposit',
                                        keyboardType: const TextInputType
                                            .numberWithOptions(decimal: true),
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp(r'^\d+\.?\d{0,2}')),
                                        ],
                                        decoration: const InputDecoration(
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.blue,
                                                  width: 1.0)),
                                          labelText: 'Security Deposit',
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.blue, width: 1.0),
                                          ),
                                        ),
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        validator:
                                            FormBuilderValidators.required(),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 200,
                                      child: FormBuilderTextField(
                                        name: 'current_electricity_unit',
                                        keyboardType: const TextInputType
                                            .numberWithOptions(decimal: true),
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp(r'^\d+\.?\d{0,2}')),
                                        ],
                                        decoration: const InputDecoration(
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.blue,
                                                  width: 1.0)),
                                          labelText: 'Current Electricity Unit',
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.blue, width: 1.0),
                                          ),
                                        ),
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        validator:
                                            FormBuilderValidators.required(),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 200,
                                      child: FormBuilderDateTimePicker(
                                        name: 'check_in_date',
                                        inputType: InputType.date,
                                        format: DateFormat('yyyy-MM-dd'),
                                        initialValue: DateTime.now(),
                                        initialDatePickerMode:
                                            DatePickerMode.day,
                                        decoration: const InputDecoration(
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.blue,
                                                  width: 1.0)),
                                          labelText: 'Check In Date',
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.blue, width: 1.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                SizedBox(
                                  width: SizeHelper.displayWidth! * 1,
                                  child: Text(
                                    'Amenities:',
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                amenitiesInt.isNotEmpty
                                    ? Column(
                                        children: [
                                          for (int i in amenitiesInt)
                                            Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    SizedBox(
                                                      width: 600,
                                                      height: 40,
                                                      child:
                                                          FormBuilderTextField(
                                                        name: 'amenity_name_$i',
                                                        textCapitalization:
                                                            TextCapitalization
                                                                .sentences,
                                                        decoration:
                                                            const InputDecoration(
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                                    color: Colors
                                                                        .red,
                                                                    width: 1.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                                    color: Colors
                                                                        .red,
                                                                    width: 1.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                                    color: Colors
                                                                        .blue,
                                                                    width: 1.0),
                                                          ),
                                                          border:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                                    color: Colors
                                                                        .blue,
                                                                    width: 1.0),
                                                          ),
                                                          labelText:
                                                              'Amenity Name',
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 200,
                                                      height: 40.0,
                                                      child:
                                                          FormBuilderTextField(
                                                        valueTransformer:
                                                            (value) =>
                                                                double.parse(
                                                                    value!),
                                                        name:
                                                            'amenity_price_$i',
                                                        keyboardType:
                                                            const TextInputType
                                                                    .numberWithOptions(
                                                                decimal: true),
                                                        inputFormatters: [
                                                          FilteringTextInputFormatter
                                                              .allow(RegExp(
                                                                  r'^\d+\.?\d{0,2}')),
                                                        ],
                                                        decoration:
                                                            const InputDecoration(
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                                  borderSide: BorderSide(
                                                                      color: Colors
                                                                          .blue,
                                                                      width:
                                                                          1.0)),
                                                          labelText:
                                                              'Amenity Price',
                                                          border:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                                    color: Colors
                                                                        .blue,
                                                                    width: 1.0),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    IconButton(
                                                        color: Colors.red,
                                                        focusColor:
                                                            Colors.transparent,
                                                        splashColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        padding:
                                                            EdgeInsets.zero,
                                                        onPressed: () {
                                                          setState(() {
                                                            amenitiesInt
                                                                .remove(i);
                                                          });
                                                        },
                                                        icon: const Icon(
                                                          BoxIcons.bxs_x_circle,
                                                        )),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 10.0,
                                                ),
                                              ],
                                            ),
                                        ],
                                      )
                                    : Container(),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                SizedBox(
                                  width: SizeHelper.displayWidth! * 1,
                                  height: 50.0,
                                  child: RawMaterialButton(
                                      fillColor:
                                          Theme.of(context).disabledColor,
                                      onPressed: () async {
                                        setState(() {
                                          amenitiesInt.add(amenitiesCount += 1);
                                        });
                                      },
                                      child: const Text('Add Amenities')),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              const Center(
                child: SizedBox(width: 900, child: TenantDetails()),
              )
              //  ListView.builder(itemBuilder: )
            ],
          ),
        ),
      ),
    );
  }
}
