import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:rent_calculator/helpers/sizes_helpers.dart';
import 'package:rent_calculator/models/tenant_info_model.dart';

class AddTenantInfo extends StatefulWidget {
  final TenantInfo? tenantInfo;

  const AddTenantInfo({super.key, required this.tenantInfo});

  @override
  State<AddTenantInfo> createState() => _AddTenantInfoState();
}

class _AddTenantInfoState extends State<AddTenantInfo> {
  final _formKeyTenantInfo = GlobalKey<FormBuilderState>();
  List<PlatformFile> profilePhotos = [];
  List<PlatformFile> tenantDocs = [];

  @override
  void initState() {
    super.initState();
    if (widget.tenantInfo?.profilePhotos != null) {
      profilePhotos = widget.tenantInfo!.profilePhotos!;
    }

    if (widget.tenantInfo?.tenantDocs != null) {
      tenantDocs = widget.tenantInfo!.tenantDocs!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Container(
        decoration: const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            )),
        height: 50,
        child: const Center(child: Text('ENTER TENANT DETAILS')),
      ),
      titlePadding: EdgeInsets.zero,
      // contentPadding: EdgeInsets.all(10.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),

      actionsAlignment: MainAxisAlignment.spaceAround,
      actionsPadding: const EdgeInsets.only(bottom: 20.0),
      actions: [
        SizedBox(
          width: 200.0,
          height: 50.0,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.green),
            ),
            onPressed: () async {
              bool? validation =
                  _formKeyTenantInfo.currentState?.saveAndValidate();

              TenantInfo info = TenantInfo();
              info.firstName = _formKeyTenantInfo
                  .currentState!.fields['first_name']!.value
                  .toString();
              info.lastName = _formKeyTenantInfo
                  .currentState!.fields['last_name']!.value
                  .toString();
              info.streetAddressLine1 = _formKeyTenantInfo
                  .currentState!.fields['street_address_line_1']!.value
                  .toString();
              info.streetAddressLine2 = _formKeyTenantInfo
                  .currentState!.fields['street_address_line_2']!.value
                  .toString();
              info.city = _formKeyTenantInfo.currentState!.fields['city']!.value
                  .toString();
              info.state = _formKeyTenantInfo
                  .currentState!.fields['state']!.value
                  .toString();
              info.pincode = _formKeyTenantInfo
                  .currentState!.fields['pincode']!.value
                  .toString();
              info.country = _formKeyTenantInfo
                  .currentState!.fields['country']!.value
                  .toString();
              info.phoneHome = _formKeyTenantInfo
                  .currentState!.fields['phone_home']!.value
                  .toString();
              info.phoneWork = _formKeyTenantInfo
                  .currentState!.fields['phone_work']!.value
                  .toString();
              info.phoneEmergency = _formKeyTenantInfo
                  .currentState!.fields['phone_emergency']!.value
                  .toString();
              info.email = _formKeyTenantInfo
                  .currentState!.fields['email']!.value
                  .toString();
              info.notes = _formKeyTenantInfo
                  .currentState!.fields['notes']!.value
                  .toString();
              info.profilePhotos = profilePhotos;
              info.tenantDocs = tenantDocs;

              if (validation!) {
                Navigator.pop(context, info);
              }
            },
            child: const Text('Save'),
          ),
        ),
        SizedBox(
          width: 200.0,
          height: 50.0,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red),
            ),
            onPressed: () {
              Navigator.pop(context, null);
            },
            child: const Text('Cancel'),
          ),
        ),
      ],
      content: SizedBox(
        width: 600,
        height: SizeHelper.displayHeight! * 0.7,
        child: SingleChildScrollView(
          child: FormBuilder(
            key: _formKeyTenantInfo,
            autoFocusOnValidationFailure: true,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  width: 600,
                  child: Text(
                    'Full Name',
                    style: Theme.of(context).textTheme.titleMedium,
                    textAlign: TextAlign.start,
                  ),
                ),
                const SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 250,
                      child: FormBuilderTextField(
                        name: 'first_name',
                        initialValue: widget.tenantInfo?.firstName ?? '',
                        textCapitalization: TextCapitalization.sentences,
                        decoration: const InputDecoration(
                          errorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 1.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 1.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 1.0),
                          ),
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 1.0),
                          ),
                          labelText: 'First Name',
                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.minLength(2,
                              errorText: 'Min 2 Characters'),
                          FormBuilderValidators.maxLength(50,
                              errorText: 'Max 50 Characters'),
                        ]),
                      ),
                    ),
                    SizedBox(
                      width: 250,
                      child: FormBuilderTextField(
                        name: 'last_name',
                        initialValue: widget.tenantInfo?.lastName ?? '',
                        textCapitalization: TextCapitalization.sentences,
                        decoration: const InputDecoration(
                          errorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 1.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 1.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 1.0),
                          ),
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 1.0),
                          ),
                          labelText: 'Last Name',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                SizedBox(
                    width: 600,
                    child: Text('Address',
                        style: Theme.of(context).textTheme.titleMedium)),
                const SizedBox(height: 10.0),
                SizedBox(
                  width: 600,
                  child: FormBuilderTextField(
                    name: 'street_address_line_1',
                    initialValue: widget.tenantInfo?.streetAddressLine1 ?? '',
                    textCapitalization: TextCapitalization.sentences,
                    decoration: const InputDecoration(
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 1.0),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 1.0),
                      ),
                      labelText: 'Street Address Line 1',
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                SizedBox(
                  width: 600,
                  child: FormBuilderTextField(
                    name: 'street_address_line_2',
                    initialValue: widget.tenantInfo?.streetAddressLine2 ?? '',
                    textCapitalization: TextCapitalization.sentences,
                    decoration: const InputDecoration(
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 1.0),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 1.0),
                      ),
                      labelText: 'Street Address Line 2',
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 250,
                      child: FormBuilderTextField(
                        name: 'city',
                        initialValue: widget.tenantInfo?.city ?? '',
                        textCapitalization: TextCapitalization.sentences,
                        decoration: const InputDecoration(
                          errorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 1.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 1.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 1.0),
                          ),
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 1.0),
                          ),
                          labelText: 'City',
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 250,
                      child: FormBuilderTextField(
                        name: 'state',
                        initialValue: widget.tenantInfo?.state ?? '',
                        textCapitalization: TextCapitalization.sentences,
                        decoration: const InputDecoration(
                          errorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 1.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 1.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 1.0),
                          ),
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 1.0),
                          ),
                          labelText: 'State / Province',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 250,
                      child: FormBuilderTextField(
                        name: 'pincode',
                        initialValue: widget.tenantInfo?.pincode ?? '',
                        textCapitalization: TextCapitalization.sentences,
                        decoration: const InputDecoration(
                          errorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 1.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 1.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 1.0),
                          ),
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 1.0),
                          ),
                          labelText: 'Postal / Zip Code',
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 250,
                      child: FormBuilderTextField(
                        name: 'country',
                        initialValue: widget.tenantInfo?.country ?? '',
                        textCapitalization: TextCapitalization.sentences,
                        decoration: const InputDecoration(
                          errorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 1.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 1.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 1.0),
                          ),
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 1.0),
                          ),
                          labelText: 'Country',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                SizedBox(
                  width: 600,
                  child: Text(
                    'Contact',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                const SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 250,
                      child: FormBuilderTextField(
                        name: 'phone_home',
                        initialValue: widget.tenantInfo?.phoneHome ?? '',
                        textCapitalization: TextCapitalization.sentences,
                        decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 1.0)),
                          labelText: 'Phone',
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 1.0),
                          ),
                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.match(
                              r"^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$",
                              errorText: "Enter a valid phone number")
                        ]),
                      ),
                    ),
                    SizedBox(
                      width: 250,
                      child: FormBuilderTextField(
                        name: 'phone_work',
                        initialValue: widget.tenantInfo?.phoneWork ?? '',
                        textCapitalization: TextCapitalization.sentences,
                        decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 1.0)),
                          labelText: 'Work',
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 1.0),
                          ),
                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.match(
                              r"^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$",
                              errorText: "Enter a valid phone number")
                        ]),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 250,
                      child: FormBuilderTextField(
                        name: 'phone_emergency',
                        initialValue: widget.tenantInfo?.phoneEmergency ?? '',
                        textCapitalization: TextCapitalization.sentences,
                        decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 1.0)),
                          labelText: 'Emergency',
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 1.0),
                          ),
                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.match(
                              r"^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$",
                              errorText: "Enter a valid phone number")
                        ]),
                      ),
                    ),
                    SizedBox(
                      width: 250,
                      child: FormBuilderTextField(
                        name: 'email',
                        initialValue: widget.tenantInfo?.email ?? '',
                        textCapitalization: TextCapitalization.sentences,
                        decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 1.0)),
                          labelText: 'Email',
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 1.0),
                          ),
                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.email(),
                        ]),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                SizedBox(
                  width: 600,
                  child: Text(
                    'Notes',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                const SizedBox(height: 10.0),
                SizedBox(
                  width: 600,
                  child: FormBuilderTextField(
                    maxLines: null,
                    name: 'notes',
                    initialValue: widget.tenantInfo?.notes ?? '',
                    textCapitalization: TextCapitalization.sentences,
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue, width: 1.0)),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 1.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                profilePhotos.isNotEmpty
                    ? Wrap(
                        alignment: WrapAlignment.start,
                        children: [
                          for (var photo in profilePhotos)
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  padding: EdgeInsets.zero,
                                  // color: Colors.white,
                                  width: 100,
                                  height: 130,
                                  child: Stack(
                                    alignment: AlignmentDirectional.center,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Image.memory(
                                            photo.bytes!,
                                            width: 100,
                                            height: 100,
                                          ),
                                          Expanded(
                                            child: Text(
                                              photo.name,
                                              style: const TextStyle(
                                                  fontSize: 10.0),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Positioned(
                                        right: 0,
                                        top: 0,
                                        height: 30,
                                        width: 30,
                                        child: IconButton(
                                            color: Colors.red,
                                            focusColor: Colors.transparent,
                                            splashColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            padding: EdgeInsets.zero,
                                            onPressed: () {
                                              profilePhotos.remove(photo);
                                              setState(() {});
                                            },
                                            icon: const Icon(
                                              BoxIcons.bxs_x_circle,
                                            )),
                                      )
                                    ],
                                  )),
                            )
                        ],
                      )
                    : Container(),
                const SizedBox(height: 5.0),
                SizedBox(
                  width: SizeHelper.displayWidth! * 1,
                  height: 50.0,
                  child: ElevatedButton(
                      onPressed: () async {
                        FilePickerResult? result =
                            await FilePicker.platform.pickFiles(
                          withData: true,
                          type: FileType.custom,
                          allowedExtensions: ['jpg', 'png', 'jpeg'],
                        );
                        if (result != null) {
                          PlatformFile file = result.files.first;
                          profilePhotos.add(file);
                          setState(() {});
                        } else {
                          // User canceled the picker
                        }
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          Icon(BoxIcons.bx_image_add),
                          Text('Add photo')
                        ],
                      )),
                ),
                const SizedBox(height: 10.0),
                tenantDocs.isNotEmpty
                    ? Wrap(
                        alignment: WrapAlignment.start,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          for (var doc in tenantDocs)
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  padding: EdgeInsets.zero,
                                  width: 100,
                                  height: 150,
                                  child: Stack(
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          doc.extension != 'pdf'
                                              ? Image.memory(
                                                  doc.bytes!,
                                                  width: 100,
                                                  height: 100,
                                                )
                                              : const SizedBox(
                                                  width: 100,
                                                  height: 100,
                                                  child: Icon(
                                                    BoxIcons.bxs_file_pdf,
                                                    size: 70,
                                                  ),
                                                ),
                                          Expanded(
                                            child: Text(
                                              doc.name,
                                              style: const TextStyle(
                                                  fontSize: 10.0),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Positioned(
                                        right: 0,
                                        top: 0,
                                        height: 30,
                                        width: 30,
                                        child: IconButton(
                                          color: Colors.red,
                                          focusColor: Colors.transparent,
                                          splashColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          padding: EdgeInsets.zero,
                                          onPressed: () {
                                            tenantDocs.remove(doc);
                                            setState(() {});
                                          },
                                          icon: const Icon(
                                            BoxIcons.bxs_x_circle,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )),
                            )
                        ],
                      )
                    : Container(),
                const SizedBox(height: 5.0),
                SizedBox(
                  width: SizeHelper.displayWidth! * 1,
                  height: 50.0,
                  child: ElevatedButton(
                      onPressed: () async {
                        FilePickerResult? result =
                            await FilePicker.platform.pickFiles(
                          withData: true,
                          type: FileType.custom,
                          allowedExtensions: [
                            'pdf',
                            'png',
                            'jpg',
                            'jpeg',
                          ],
                          allowMultiple: true,
                        );
                        if (result != null) {
                          for (PlatformFile file in result.files) {
                            tenantDocs.add(file);
                          }
                          setState(() {});
                        } else {
                          // User canceled the picker
                        }
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Icon(BoxIcons.bxs_file_plus),
                          Text('Add documents')
                        ],
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
