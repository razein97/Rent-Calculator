import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:rent_calculator/providers/building_provider.dart';
import 'package:rent_calculator/widgets/text_input_container.dart';

class EditRentWidgetDesktop extends StatefulWidget {
  final int buildingID;
  final String unitName;
  final double rent;
  final int unitID;
  const EditRentWidgetDesktop({
    super.key,
    required this.rent,
    required this.buildingID,
    required this.unitName,
    required this.unitID,
  });

  @override
  State<EditRentWidgetDesktop> createState() => _EditRentWidgetDesktopState();
}

class _EditRentWidgetDesktopState extends State<EditRentWidgetDesktop> {
  final _formKey = GlobalKey<FormState>();
  final _textRentEditingController = TextEditingController();
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    if (widget.rent > 0) {
      _textRentEditingController.value =
          TextEditingValue(text: widget.rent.toString());
    }
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
    _textRentEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      actionsAlignment: MainAxisAlignment.spaceAround,
      actions: [
        SizedBox(
          width: 200.0,
          height: 50.0,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.green),
            ),
            onPressed: () async {
              double rent = 0.00;
              if (_textRentEditingController.text.isNotEmpty) {
                rent = double.parse(_textRentEditingController.text);
              }
              if (rent != widget.rent) {
                await Provider.of<BuildingProvider>(context, listen: false)
                    .updateUnitRent(widget.buildingID, widget.unitID, rent)
                    .whenComplete(() {
                  _textRentEditingController.clear();

                  Navigator.pop(context);
                });
              } else {
                Navigator.pop(context);
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
              _textRentEditingController.clear();
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
        ),
      ],
      title: Container(
        decoration: const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            )),
        height: 50,
        child: const Center(child: Text('EDIT RENT DETAILS')),
      ),
      content: SizedBox(
        width: 600.0,
        height: 400.0,
        child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SizedBox(
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Center(
                      child: Column(
                    children: [
                      TextInputContainer(
                        textEditingController: _textRentEditingController,
                        labelInputText: 'Rent Amount',
                        inputType: const TextInputType.numberWithOptions(
                            decimal: true),
                        inputFormatter: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'^\d+\.?\d{0,2}')),
                        ],
                      ),
                    ],
                  )),
                ),
              ),
            )),
      ),
    );
  }
}
