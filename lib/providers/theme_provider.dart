import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode {
    return _themeMode;
  }

  set themeMode(ThemeMode mode) {
    _themeMode = mode;
    notifyListeners();
  }
}
