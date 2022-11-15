import 'package:flutter/material.dart';

class TextInputContainer extends StatelessWidget {
  final TextEditingController textEditingController;
  final String labelInputText;
  final TextInputType inputType;

  const TextInputContainer(
      {super.key,
      required this.textEditingController,
      required this.labelInputText,
      required this.inputType});

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
        decoration: InputDecoration(
          // labelStyle: Theme.of(context)
          //     .textTheme
          //     .bodyText1
          //     .copyWith(
          //       fontSize: SizeHelper.displayHeight * 0.022,
          //     ),
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
