import 'package:flutter/material.dart';

class SizeHelper {
  static MediaQueryData? _mediaQueryData;
  static double? displayHeight;
  static double? displayWidth;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    displayHeight = _mediaQueryData?.size.height;
    displayWidth = _mediaQueryData?.size.width;
  }
}
