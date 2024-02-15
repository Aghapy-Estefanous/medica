import 'package:flutter/material.dart';
import 'package:medica/pages/Login.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';


class Splash_screen extends StatelessWidget {
  const Splash_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        duration: 1000,
        splashIconSize: 260,
        splash: Image.asset(
          'assets/images/onboarding/logo.png',
          fit: BoxFit.cover,
        ),
        nextScreen: Login(),
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: Color.fromARGB(255, 9, 29, 75),
      ),
    );
  }
}
