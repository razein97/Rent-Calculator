import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:rent_calculator/helpers/sizes_helpers.dart';

class CreateBillWidget extends StatelessWidget {
  final double curElectricUnit;

  const CreateBillWidget({super.key, required this.curElectricUnit});

  @override
  Widget build(BuildContext context) {
    final _formKeyCreateBill = GlobalKey<FormBuilderState>();

    return AlertDialog(
      title: Container(
        decoration: const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            )),
        height: 50,
        child: const Center(child: Text('Create A New Bill')),
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
          child: OutlinedButton(
            onPressed: () async {},
            child: const Text('Save'),
          ),
        ),
        SizedBox(
          width: 200.0,
          height: 50.0,
          child: OutlinedButton(
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
          key: _formKeyCreateBill,
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 250,
                  child: FormBuilderTextField(
                    name: 'first_name',
                    initialValue: curElectricUnit.toString(),
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
                      labelText: 'First Name',
                    ),
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp(r'^\d+\.?\d{0,2}')),
                    ],
                  ),
                ),
                SizedBox(
                  width: 250,
                  child: FormBuilderTextField(
                    name: 'last_name',
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
                      labelText: 'Last Name',
                    ),
                  ),
                ),
              ],
            ),
          ]),
        )),
      ),
    );
  }
}
