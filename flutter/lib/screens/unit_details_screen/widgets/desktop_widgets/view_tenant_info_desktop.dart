import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:rent_calculator/helpers/sizes_helpers.dart';
import 'package:rent_calculator/models/tenant_info_model.dart';
import 'package:rent_calculator/screens/add_tenant_screen/widgets/enlarged_view.dart';

class ViewTenantInfoDesktop extends StatefulWidget {
  final TenantInfo? tenantInfo;
  const ViewTenantInfoDesktop({super.key, required this.tenantInfo});

  @override
  State<ViewTenantInfoDesktop> createState() => _ViewTenantInfoDesktopState();
}

class _ViewTenantInfoDesktopState extends State<ViewTenantInfoDesktop> {
  final _formKeyTenantInfo = GlobalKey<FormBuilderState>();
  List<PlatformFile> profilePhotos = [];
  List<PlatformFile> tenantDocs = [];
  int profilePhotoIndex = 0;
  bool isReadOnly = true;

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
        child: const Center(child: Text('TENANT DETAILS')),
      ),
      titlePadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      actionsAlignment: MainAxisAlignment.spaceAround,
      actionsPadding: const EdgeInsets.only(bottom: 20.0),
      actions: [
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
            child: const Text('Close'),
          ),
        ),
      ],
      content: SizedBox(
        width: 600,
        height: SizeHelper.displayHeight! * 0.7,
        child: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              width: 600,
              child: FormBuilder(
                key: _formKeyTenantInfo,
                autoFocusOnValidationFailure: true,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              widget.tenantInfo!.profilePhotos!.isNotEmpty
                                  ? widget.tenantInfo!.profilePhotos!.length > 1
                                      ? OutlinedButton(
                                          onPressed: () {
                                            showDialog(
                                                context: context,
                                                builder: ((context) =>
                                                    EnlargedView(
                                                      files: widget.tenantInfo!
                                                          .profilePhotos!,
                                                      index: profilePhotoIndex,
                                                    )));
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                height: 100,
                                                width: 20,
                                                child: RawMaterialButton(
                                                    onPressed: () {
                                                      if (profilePhotoIndex !=
                                                          0) {
                                                        profilePhotoIndex -= 1;
                                                      }
                                                      setState(() {});
                                                    },
                                                    child: const Icon(
                                                      BoxIcons.bx_chevron_left,
                                                    )),
                                              ),
                                              Image.memory(
                                                  fit: BoxFit.contain,
                                                  width: 150,
                                                  height: 150,
                                                  widget
                                                      .tenantInfo!
                                                      .profilePhotos![
                                                          profilePhotoIndex]
                                                      .bytes!),
                                              SizedBox(
                                                height: 100,
                                                width: 20,
                                                child: RawMaterialButton(
                                                    onPressed: () {
                                                      if (widget
                                                                  .tenantInfo!
                                                                  .profilePhotos!
                                                                  .length -
                                                              1 !=
                                                          profilePhotoIndex) {
                                                        profilePhotoIndex += 1;
                                                      }
                                                      setState(() {});
                                                    },
                                                    child: const Icon(BoxIcons
                                                        .bx_chevron_right)),
                                              ),
                                            ],
                                          ),
                                        )
                                      : OutlinedButton(
                                          onPressed: () {
                                            showDialog(
                                                context: context,
                                                builder: ((context) =>
                                                    EnlargedView(
                                                      files: widget.tenantInfo!
                                                          .profilePhotos!,
                                                      index: profilePhotoIndex,
                                                    )));
                                          },
                                          child: Image.memory(
                                            width: 150,
                                            height: 150,
                                            widget.tenantInfo!.profilePhotos!
                                                .first.bytes!,
                                            fit: BoxFit.contain,
                                          ),
                                        )
                                  : Container(
                                      width: 150,
                                      height: 150,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1,
                                            color:
                                                Theme.of(context).dividerColor),
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(5),
                                        ),
                                      ),
                                      child: const Icon(
                                        FontAwesome.user,
                                        size: 50,
                                      ),
                                    ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              widget.tenantInfo!.tenantDocs!.isNotEmpty
                                  ? SizedBox(
                                      width: 200,
                                      child: OutlinedButton(
                                          onPressed: () {
                                            showDialog(
                                                context: context,
                                                builder: ((context) =>
                                                    EnlargedView(
                                                      files: widget.tenantInfo!
                                                          .tenantDocs!,
                                                      index: 0,
                                                    )));
                                          },
                                          child: const Text('View Documents')),
                                    )
                                  : Container(),
                            ]),
                        SizedBox(
                          width: 350,
                          child: Column(
                            children: [
                              SizedBox(
                                width: 350,
                                child: Text(
                                  'Full Name',
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                  textAlign: TextAlign.start,
                                ),
                              ),
                              const SizedBox(height: 10.0),
                              SizedBox(
                                width: 350,
                                child: FormBuilderTextField(
                                  readOnly: isReadOnly,
                                  name: 'first_name',
                                  initialValue:
                                      widget.tenantInfo?.firstName ?? '',
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                  decoration: const InputDecoration(
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.red, width: 1.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.red, width: 1.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.blue, width: 1.0),
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.blue, width: 1.0),
                                    ),
                                    labelText: 'First Name',
                                  ),
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(),
                                    FormBuilderValidators.minLength(2,
                                        errorText: 'Min 2 Characters'),
                                    FormBuilderValidators.maxLength(50,
                                        errorText: 'Max 50 Characters'),
                                  ]),
                                ),
                              ),
                              const SizedBox(height: 10.0),
                              SizedBox(
                                width: 350,
                                child: FormBuilderTextField(
                                  readOnly: isReadOnly,
                                  name: 'last_name',
                                  initialValue:
                                      widget.tenantInfo?.lastName ?? '',
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                  decoration: const InputDecoration(
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.red, width: 1.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.red, width: 1.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.blue, width: 1.0),
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.blue, width: 1.0),
                                    ),
                                    labelText: 'Last Name',
                                  ),
                                ),
                              ),
                            ],
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
                        readOnly: isReadOnly,
                        name: 'street_address_line_1',
                        initialValue:
                            widget.tenantInfo?.streetAddressLine1 ?? '',
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
                          labelText: 'Street Address Line 1',
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    SizedBox(
                      width: 600,
                      child: FormBuilderTextField(
                        readOnly: isReadOnly,
                        name: 'street_address_line_2',
                        initialValue:
                            widget.tenantInfo?.streetAddressLine2 ?? '',
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
                            readOnly: isReadOnly,
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
                            readOnly: isReadOnly,
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
                            readOnly: isReadOnly,
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
                            readOnly: isReadOnly,
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
                            readOnly: isReadOnly,
                            name: 'phone_home',
                            initialValue: widget.tenantInfo?.phoneHome ?? '',
                            textCapitalization: TextCapitalization.sentences,
                            decoration: const InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blue, width: 1.0)),
                              labelText: 'Phone',
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.blue, width: 1.0),
                              ),
                            ),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
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
                            readOnly: isReadOnly,
                            name: 'phone_work',
                            initialValue: widget.tenantInfo?.phoneWork ?? '',
                            textCapitalization: TextCapitalization.sentences,
                            decoration: const InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blue, width: 1.0)),
                              labelText: 'Work',
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.blue, width: 1.0),
                              ),
                            ),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
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
                            readOnly: isReadOnly,
                            name: 'phone_emergency',
                            initialValue:
                                widget.tenantInfo?.phoneEmergency ?? '',
                            textCapitalization: TextCapitalization.sentences,
                            decoration: const InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blue, width: 1.0)),
                              labelText: 'Emergency',
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.blue, width: 1.0),
                              ),
                            ),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
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
                            readOnly: isReadOnly,
                            name: 'email',
                            initialValue: widget.tenantInfo?.email ?? '',
                            textCapitalization: TextCapitalization.sentences,
                            decoration: const InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blue, width: 1.0)),
                              labelText: 'Email',
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.blue, width: 1.0),
                              ),
                            ),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
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
                        readOnly: isReadOnly,
                        maxLines: null,
                        name: 'notes',
                        initialValue: widget.tenantInfo?.notes ?? '',
                        textCapitalization: TextCapitalization.sentences,
                        decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 1.0)),
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 1.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
