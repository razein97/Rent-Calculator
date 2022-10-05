import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rent_calculator/helpers/database_helpers.dart';
import 'package:rent_calculator/screens/home_screen/widgets/text_input_container.dart';

class AppBarHome extends StatefulWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;
  final String title;
  const AppBarHome(
      {super.key, required this.preferredSize, required this.title});

  @override
  State<AppBarHome> createState() => _AppBarHomeState();
}

class _AppBarHomeState extends State<AppBarHome> {
  final _formKey = GlobalKey<FormState>();

  final _scrollController = ScrollController();
  final _textNameEditingController = TextEditingController();
  final _textAddressEditingController = TextEditingController();
  final _textCompEditingController = TextEditingController();

  @override
  void dispose() {
    super.dispose();

    _scrollController.dispose();
    _textAddressEditingController.dispose();
    _textCompEditingController.dispose();
    _textNameEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool saving = false;
    return AppBar(
      title: const Text("Rent Calculator"),
      actions: [
        IconButton(
            onPressed: () async => {
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (BuildContext context) {
                      int compartments = 0;
                      return AlertDialog(
                        titlePadding: EdgeInsets.zero,
                        title: Container(
                          color: Colors.blue,
                          height: 50,
                          child:
                              const Center(child: Text('Add a new building')),
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
                                          labelInputText: 'Building Name',
                                          inputType: TextInputType.text,
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        TextInputContainer(
                                          textEditingController:
                                              _textAddressEditingController,
                                          labelInputText:
                                              'Address of the building',
                                          inputType: TextInputType.text,
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),

                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                                'Number of compartments:'),
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                                border: Border.all(
                                                  color: Colors.grey.shade600,
                                                ),
                                              ),
                                              width: 100,
                                              height: 44,
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                        child: Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 8.0),
                                                      child: Text(compartments
                                                          .toString()),
                                                    )),
                                                    Column(
                                                      children: [
                                                        SizedBox(
                                                          width: 30,
                                                          height: 21,
                                                          child:
                                                              RawMaterialButton(
                                                            fillColor:
                                                                Colors.blue,
                                                            shape:
                                                                const RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .only(
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              5.0),
                                                                      bottomLeft:
                                                                          Radius.circular(
                                                                              0),
                                                                      bottomRight:
                                                                          Radius.circular(
                                                                              0),
                                                                    ),
                                                                    side: BorderSide(
                                                                        color: Colors
                                                                            .blue,
                                                                        width:
                                                                            0.5)),
                                                            onPressed: () =>
                                                                setState(() {
                                                              compartments += 1;
                                                            }),
                                                            child: const Icon(Icons
                                                                .arrow_drop_up),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 30,
                                                          height: 21,
                                                          child:
                                                              RawMaterialButton(
                                                            fillColor:
                                                                Colors.blue,
                                                            shape:
                                                                const RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .only(
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              0),
                                                                      bottomLeft:
                                                                          Radius.circular(
                                                                              0),
                                                                      bottomRight:
                                                                          Radius.circular(
                                                                              5.0),
                                                                    ),
                                                                    side: BorderSide(
                                                                        color: Colors
                                                                            .blue,
                                                                        width:
                                                                            0.5)),
                                                            // onLongPress: () =>
                                                            //     Future.delayed(
                                                            //         const Duration(
                                                            //             milliseconds:
                                                            //                 1),
                                                            //         () {
                                                            //   var timer = Timer
                                                            //       .periodic(
                                                            //           //milliseconds: 500 = increase speed
                                                            //           const Duration(
                                                            //               milliseconds:
                                                            //                   500),
                                                            //           (Timer t) =>
                                                            //               setState(
                                                            //                   () {
                                                            //                 if (compartments ==
                                                            //                     0) {
                                                            //                   compartments = 0;
                                                            //                 } else {
                                                            //                   compartments -= 1;
                                                            //                 }
                                                            //               }));
                                                            // }),
                                                            onPressed: () =>
                                                                setState(() {
                                                              if (compartments ==
                                                                  0) {
                                                                compartments =
                                                                    0;
                                                              } else {
                                                                compartments -=
                                                                    1;
                                                              }
                                                            }),
                                                            child: const Icon(Icons
                                                                .arrow_drop_down),
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  ]),
                                            ),
                                          ],
                                        )
                                        // TextInputContainer(
                                        //   textEditingController:
                                        //       _textCompEditingController,
                                        //   labelInputText:
                                        //       'Number of Compartments',
                                        //   inputType: TextInputType.number,
                                        // )
                                      ],
                                    ),
                                  )),
                            ),
                          );
                        }),
                        actions: [
                          OutlinedButton(
                              onPressed: () async {
                                await DatabaseHelpers.createBuilding(
                                  _textNameEditingController.text,
                                  _textAddressEditingController.text,
                                  compartments,
                                ).then((value) {
                                  _textNameEditingController.clear();
                                  _textAddressEditingController.clear();
                                  _textCompEditingController.clear();
                                  compartments = 0;

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
