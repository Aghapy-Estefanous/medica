import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shop_app/shared/styles/constColors.dart';

ThemeData liteTheme() {
  return ThemeData(
      textTheme:const  TextTheme(
          bodyMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      )),
      colorScheme:ColorScheme.light(background: Colors.white) ,
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
                selectedItemColor: baseColor,
                unselectedItemColor: Color.fromARGB(255, 169, 169, 169),
              ),
              
      );
}
ThemeData darkTheme(){
  return  ThemeData(
     colorScheme:ColorScheme.dark(background: const Color.fromARGB(255, 49, 48, 48)) ,
              scaffoldBackgroundColor: HexColor('4C4C4C'),

              appBarTheme: AppBarTheme(
                  elevation: 0.0,
                  titleTextStyle: const TextStyle(
                    color: Colors.white,
                  ),
                  backgroundColor: Colors.white,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: HexColor('4C4C4C'),
                    statusBarBrightness: Brightness.light,
                  ),
                  iconTheme:const IconThemeData(
                    color: Colors.white,
                  )),
              textTheme:const  TextTheme(
                  bodyMedium: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600
                    ,
                color: Colors.white,
              )),
              //herrrrrrrrrrrrrre parsing
              primarySwatch:baseColor as MaterialColor ,

              // useMaterial3: true,
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                backgroundColor: HexColor('4C4C4C'),
                selectedItemColor: Colors.amber,
                unselectedItemColor: Color.fromARGB(255, 169, 169, 169),
              ),
            );
          
}
