import 'package:flutter/material.dart';
import 'package:medica/shared/styles/AppColor.dart'; // Adjust the import path as needed

class ThemeProvider with ChangeNotifier {
  bool _isDarkTheme = false;

  bool get isDarkTheme => _isDarkTheme;

  ThemeData get themeData {
    return _isDarkTheme ? _darkTheme : _lightTheme;
  }

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }

  final ThemeData _lightTheme = ThemeData(
    useMaterial3: false,
    primaryColor: AppColor.primaryColor,
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.blue,
      brightness: Brightness.light,
    ).copyWith(
      primary: AppColor.primaryColor,
      secondary: AppColor.orangcolor,
      brightness: Brightness.light,
    ),
    brightness: Brightness.light,
  );

  final ThemeData _darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black54,
    useMaterial3: false,
    primaryColor: AppColor.orangcolor,
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.grey,
      brightness: Brightness.dark,
    ).copyWith(
      primary: AppColor.orangcolor,
      secondary: Colors.grey,
      brightness: Brightness.dark,
    ),
    brightness: Brightness.dark,
  );
}
