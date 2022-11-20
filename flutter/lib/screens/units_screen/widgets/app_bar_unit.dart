import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:rent_calculator/helpers/database_helpers.dart';
import 'package:rent_calculator/providers/building_provider.dart';
import 'package:rent_calculator/widgets/text_input_container.dart';

class AppBarUnits extends StatefulWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;
  final int buildingID;
  final String title;

  const AppBarUnits({
    super.key,
    required this.preferredSize,
    required this.buildingID,
    required this.title,
  });

  @override
  State<AppBarUnits> createState() => _AppBarUnitsState();
}

class _AppBarUnitsState extends State<AppBarUnits> {
  final _formKey = GlobalKey<FormState>();

  final _scrollController = ScrollController();
  final _textNameEditingController = TextEditingController();
  final _textRentEditingController = TextEditingController();

  @override
  void dispose() {
    super.dispose();

    _scrollController.dispose();
    _textNameEditingController.dispose();
    _textRentEditingController.dispose();
  }

  @override
  void initState() {
    super.initState();

    // if(Provider.of<BuildingProvider>(context, listen: true).unitsInBuilding > 0){
    //   _textNameEditingController
    // }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
      title: Text(widget.title),
      actions: [
        IconButton(
            onPressed: () async => {
                  if (Provider.of<BuildingProvider>(context, listen: false)
                          .unitsInBuilding >
                      0)
                    {
                      _textNameEditingController.value = TextEditingValue(
                          text:
                              'Unit No. ${Provider.of<BuildingProvider>(context, listen: false).unitsInBuilding + 1}')
                    }
                  else
                    {
                      _textNameEditingController.value =
                          const TextEditingValue(text: 'Unit No. 1')
                    },
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        titlePadding: EdgeInsets.zero,
                        title: Container(
                          color: Colors.blue,
                          height: 50,
                          child: const Center(child: Text('Add a new unit')),
                        ),
                        content: StatefulBuilder(builder: (context, setState) {
                          return SizedBox(
                            width: 500,
                            child: Form(
                              key: _formKey,
                              child: SingleChildScrollView(
                                controller: _scrollController,
                                child: Center(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      TextInputContainer(
                                        textEditingController:
                                            _textNameEditingController,
                                        labelInputText: 'Unit Name',
                                        inputType: TextInputType.text,
                                        inputFormatter: const [],
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      TextInputContainer(
                                        textEditingController:
                                            _textRentEditingController,
                                        labelInputText: 'Rent Amount',
                                        inputType: const TextInputType
                                            .numberWithOptions(decimal: true),
                                        inputFormatter: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp(r'^\d+\.?\d{0,2}')),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                        actions: [
                          OutlinedButton(
                              onPressed: () async {
                                double rent = 0.00;
                                if (_textRentEditingController
                                    .text.isNotEmpty) {
                                  rent = double.parse(
                                      _textRentEditingController.text);
                                }

                                await Provider.of<BuildingProvider>(context,
                                        listen: false)
                                    .createUnit(widget.buildingID,
                                        _textNameEditingController.text, rent)
                                    .whenComplete(() {
                                  _textNameEditingController.clear();
                                  _textRentEditingController.clear();

                                  Navigator.pop(context);
                                });
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Icon(Icons.done),
                                  Text('Save')
                                ],
                              )),
                          OutlinedButton(
                              onPressed: () {
                                _textNameEditingController.clear();
                                _textRentEditingController.clear();
                                Navigator.pop(context);
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Icon(Icons.close),
                                  Text('Cancel')
                                ],
                              )),
                        ],
                      );
                    },
                  )
                },
            icon: const Icon(Icons.add))
      ],
    );
  }
}
