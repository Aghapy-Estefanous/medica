import 'package:flutter/material.dart';
import 'package:medica/screens/auth/login_auth/cubit/loginCubit.dart';
import 'package:medica/screens/auth/login_auth/cubit/loginState.dart';
import 'package:medica/shared/styles/AppColor.dart';
import 'package:medica/screens/onboarding/onboarding.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medica/home_layout.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _checkToken(context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: AnimatedSplashScreen(
                duration: 1000,
                splashIconSize: MediaQuery.sizeOf(context).width * 0.8,
                splash: Image.asset(
                  'assets/images/onboarding/logo.png',
                  fit: BoxFit.cover,
                ),
                nextScreen:
                    Container(), // Empty container, will be replaced by navigation logic
                splashTransition: SplashTransition.fadeTransition,
                backgroundColor: AppColor.primaryColor,
              ),
            );
          } else {
            return Container(); // Empty container, will be replaced by navigation logic
          }
        },
      ),
    );
  }

  Future<void> _checkToken(BuildContext context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('Token');
    print('Token from splash $token');

    if (token != null) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const HomeLayout()),
        (route) => false,
      );
    } else {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => BoardingScreen()),
        (route) => false,
      );
    }
  }
}
