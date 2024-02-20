import 'package:flutter/material.dart';
import 'package:medica/pages/Login.dart';
import 'package:medica/screens/splash_screen.dart';
import 'package:medica/screens/onboarding/onboarding.dart';




void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});



  @override
  Widget build(BuildContext context) {

    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home:BoardingScreen());
  }
}
