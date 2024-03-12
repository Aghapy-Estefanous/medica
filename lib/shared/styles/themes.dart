import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medica/shared/styles/AppColor.dart';

ThemeData liteTheme() {
  return ThemeData(
      primaryColor: AppColor.primaryColor,
      highlightColor: AppColor.highlightColor,
      buttonTheme: ButtonThemeData(
        hoverColor: AppColor.primaryColor,
        buttonColor: AppColor.orangcolor,
      ),
      textTheme: const TextTheme(
          bodyLarge: TextStyle(fontSize: 20),
          bodySmall: TextStyle(fontSize: 10, color: AppColor.dividerColor),
          bodyMedium: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          )),
      dividerTheme: DividerThemeData(
        thickness: 1,
        color: AppColor.dividerColor,
      ),
      colorScheme: ColorScheme.light(background: Colors.white),
      appBarTheme: const AppBarTheme(
        scrolledUnderElevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        titleTextStyle: TextStyle(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarBrightness: Brightness.dark,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: AppColor.primaryColor,
        unselectedItemColor: Color.fromARGB(255, 169, 169, 169),
      ),
      navigationBarTheme: NavigationBarThemeData(
          backgroundColor: AppColor.whiteColor,
          indicatorColor: AppColor.primaryColor,
          surfaceTintColor: AppColor.dividerColor));
}

ThemeData darkTheme() {
  return ThemeData(
    colorScheme:
        ColorScheme.dark(background: const Color.fromARGB(255, 49, 48, 48)),
    // scaffoldBackgroundColor: HexColor('4C4C4C'),

    appBarTheme: AppBarTheme(
        elevation: 0.0,
        titleTextStyle: const TextStyle(
          color: Colors.white,
        ),
        backgroundColor: Colors.white,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColor.brawn,
          statusBarBrightness: Brightness.light,
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        )),
    textTheme: const TextTheme(
        bodyMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    )),
    //herrrrrrrrrrrrrre parsing
    primarySwatch: AppColor.orangcolor as MaterialColor,

    // useMaterial3: true,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColor.primaryColor,
      selectedItemColor: Colors.amber,
      unselectedItemColor: Color.fromARGB(255, 169, 169, 169),
    ),
  );
}
