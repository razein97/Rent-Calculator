import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  //Toast Colors
  static const Color toastError = Color.fromRGBO(243, 57, 80, 1);
  static const Color toastDefault = Color.fromRGBO(60, 60, 60, 1);
  static const Color toastSuccess = Color.fromRGBO(117, 208, 15, 1);
  //Toast font size ratio
  static const double toastFontSizeRatio = 0.020;

  //Light theme colors

  static const Color _scaffoldBackgroundColorLight = Colors.white;
  static const Color _textColorLight = Colors.black;
  static const Color _primaryColorLight = Colors.white;

  static final TextTheme _lightTextTheme = TextTheme(
    headline1: GoogleFonts.roboto(
        color: _textColorLight,
        fontSize: 96,
        fontWeight: FontWeight.w300,
        letterSpacing: -1.5),
    headline2: GoogleFonts.roboto(
        color: _textColorLight,
        fontSize: 60,
        fontWeight: FontWeight.w300,
        letterSpacing: -0.5),
    headline3: GoogleFonts.roboto(
        color: _textColorLight, fontSize: 48, fontWeight: FontWeight.w400),
    headline4: GoogleFonts.roboto(
        color: _textColorLight,
        fontSize: 34,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25),
    headline5: GoogleFonts.roboto(
        color: _textColorLight, fontSize: 24, fontWeight: FontWeight.w400),
    headline6: GoogleFonts.roboto(
        color: _textColorLight,
        fontSize: 20,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15),
    subtitle1: GoogleFonts.roboto(
        color: _textColorLight,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15),
    subtitle2: GoogleFonts.roboto(
        color: _textColorLight,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1),
    bodyText1: GoogleFonts.notoSans(
        color: _textColorLight,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5),
    bodyText2: GoogleFonts.notoSans(
        color: _textColorLight,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25),
    button: GoogleFonts.notoSans(
        color: _textColorLight,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.25),
    caption: GoogleFonts.notoSans(
        color: _textColorLight,
        fontSize: 12,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.4),
    overline: GoogleFonts.notoSans(
        color: _textColorLight,
        fontSize: 10,
        fontWeight: FontWeight.w400,
        letterSpacing: 1.5),
  );

  //Dark theme colors
  static const Color _scaffoldBackgroundColorDark =
      Color.fromRGBO(33, 33, 33, 1);
  static const Color _textColorDark = Color.fromRGBO(224, 224, 224, 1);
  static const Color _primaryColorDark = Color.fromRGBO(13, 13, 13, 1);
  static const Color _cardColorDark = Color.fromRGBO(25, 26, 26, 1);

  static final TextTheme _darkTextTheme = TextTheme(
    headline1: GoogleFonts.roboto(
        color: _textColorDark,
        fontSize: 96,
        fontWeight: FontWeight.w300,
        letterSpacing: -1.5),
    headline2: GoogleFonts.roboto(
        color: _textColorDark,
        fontSize: 60,
        fontWeight: FontWeight.w300,
        letterSpacing: -0.5),
    headline3: GoogleFonts.roboto(
        color: _textColorDark, fontSize: 48, fontWeight: FontWeight.w400),
    headline4: GoogleFonts.roboto(
        color: _textColorDark,
        fontSize: 34,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25),
    headline5: GoogleFonts.roboto(
        color: _textColorDark, fontSize: 24, fontWeight: FontWeight.w400),
    headline6: GoogleFonts.roboto(
        color: _textColorDark,
        fontSize: 20,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15),
    subtitle1: GoogleFonts.roboto(
        color: _textColorDark,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15),
    subtitle2: GoogleFonts.roboto(
        color: _textColorDark,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1),
    bodyText1: GoogleFonts.notoSans(
        color: _textColorDark,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5),
    bodyText2: GoogleFonts.notoSans(
        color: _textColorDark,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25),
    button: GoogleFonts.notoSans(
        color: _textColorDark,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.25),
    caption: GoogleFonts.notoSans(
        color: _textColorDark,
        fontSize: 12,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.4),
    overline: GoogleFonts.notoSans(
        color: _textColorDark,
        fontSize: 10,
        fontWeight: FontWeight.w400,
        letterSpacing: 1.5),
  );

  //Light Theme Data
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: _scaffoldBackgroundColorLight,
    brightness: Brightness.light,
    textTheme: _lightTextTheme,
    primaryColor: _primaryColorLight,
    buttonColor: Color.fromRGBO(3, 93, 196, 1),
    disabledColor: Colors.grey[200],
    visualDensity: VisualDensity.adaptivePlatformDensity,
    toggleableActiveColor: const Color.fromRGBO(168, 192, 223, 1),
    iconTheme: const IconThemeData(color: _primaryColorDark),
    dialogBackgroundColor: const Color.fromRGBO(244, 244, 244, 1),
    canvasColor: _primaryColorLight,
    buttonTheme:
        const ButtonThemeData(buttonColor: Color.fromRGBO(61, 14, 68, 1)),
  );

  //Dark theme Data
  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: _scaffoldBackgroundColorDark,
    brightness: Brightness.dark,
    textTheme: _darkTextTheme,
    primaryColor: _primaryColorDark,
    cardColor: _cardColorDark,
    buttonTheme:
        const ButtonThemeData(buttonColor: Color.fromRGBO(61, 14, 68, 1)),
    buttonColor: Color.fromRGBO(13, 108, 215, 1),
    disabledColor: const Color.fromRGBO(50, 50, 50, 1),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    toggleableActiveColor: const Color.fromRGBO(7, 36, 69, 1),
    iconTheme: const IconThemeData(color: _primaryColorLight),
    dialogBackgroundColor: const Color.fromRGBO(40, 40, 40, 1),
    highlightColor: Colors.grey.withAlpha(50),
    canvasColor: _cardColorDark,
    textSelectionTheme: const TextSelectionThemeData(
      selectionColor: Colors.blue,
      selectionHandleColor: Color.fromRGBO(0, 76, 197, 1),
    ),
  );
}
