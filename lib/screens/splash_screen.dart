import 'package:flutter/material.dart';
import 'package:medica/screens/login/Login.dart';
import 'package:medica/styles/AppColor.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';


class Splash_screen extends StatelessWidget {
  const Splash_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        duration: 1000,
        splashIconSize: MediaQuery.sizeOf(context).width*0.8,
        splash: Image.asset(
          'assets/images/onboarding/logo.png',
          fit: BoxFit.cover,
        ),
        nextScreen: const Login(),
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: AppColor.primaryColor,
      ),
    );
  }
}
