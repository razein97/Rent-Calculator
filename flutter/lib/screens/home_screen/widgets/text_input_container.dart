import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextInputContainer extends StatelessWidget {
  final TextEditingController textEditingController;
  final String labelInputText;
  final TextInputType inputType;
  final List<TextInputFormatter> inputFormatter;

  const TextInputContainer(
      {super.key,
      required this.textEditingController,
      required this.labelInputText,
      required this.inputType,
      required this.inputFormatter});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      //color: Colors.blue,
      child: TextFormField(
        controller: textEditingController,
        autofocus: false,
        keyboardType: inputType,
        onEditingComplete: () {},
        inputFormatters: inputFormatter,
        decoration: InputDecoration(
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue, width: 1.0)),
          labelText: labelInputText,
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 1.0),
          ),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter some text.';
          }
          return null;
        },
      ),
    );
  }
}
