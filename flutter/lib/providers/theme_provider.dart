import 'package:flutter/material.dart';
import 'package:rent_calculator/styles.dart';
import 'package:rent_calculator/values/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:system_theme/system_theme.dart';

class ThemeDataProvider extends ChangeNotifier {
  ThemeData? _appTheme;
  bool? systemTheme;
  bool? lightTheme;
  bool? darkTheme;

  getTheme() => _appTheme;

  void getCurrentThemeSystem() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String theme =
        prefs.getString(SharedPreferencesConstants.themeData) ?? 'systemTheme';

    _updateTheme(theme);

    notifyListeners();
  }

  void setTheme(String themeValue) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(SharedPreferencesConstants.themeData, themeValue);

    _updateTheme(themeValue);
    notifyListeners();
  }

  void _updateTheme(String themeValue) {
    if (themeValue == 'systemTheme') {
      systemTheme = true;
      lightTheme = false;
      darkTheme = false;
      if (SystemTheme.isDarkMode) {
        _appTheme = AppTheme.darkTheme;
      } else {
        _appTheme = AppTheme.lightTheme;
      }
    } else if (themeValue == 'lightTheme') {
      _appTheme = AppTheme.lightTheme;
      systemTheme = false;
      lightTheme = true;
      darkTheme = false;
    } else {
      _appTheme = AppTheme.darkTheme;
      systemTheme = false;
      lightTheme = false;
      darkTheme = true;
    }
  }
}
