import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:medica/models/login_model.dart';
import 'package:medica/screens/auth/login_auth/cubit/loginCubit.dart';
import 'package:medica/screens/auth/login_auth/cubit/loginState.dart';
import 'package:medica/shared/styles/AppColor.dart';
import 'package:medica/screens/onboarding/onboarding.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medica/home_layout.dart';

class Splash_screen extends StatelessWidget {
  const Splash_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => LoginCubit(),
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccessgState) {
              if (state.model?.succeeded == true) {
                SharedPreferences.getInstance().then((prefs) {
                  prefs.setString('token', state.model?.data!.token ?? '');
                });
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
            } else if (state is LoginErrorState) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => BoardingScreen()),
                (route) => false,
              );
            }
          },
          builder: (context, state) {
            _attemptAutoLogin(context);
            return Center(
              child: AnimatedSplashScreen(
                duration: 1000,
                splashIconSize: MediaQuery.sizeOf(context).width * 0.8,
                splash: Image.asset(
                  'assets/images/onboarding/logo.png',
                  fit: BoxFit.cover,
                ),
                nextScreen: BoardingScreen(),
                splashTransition: SplashTransition.fadeTransition,
                backgroundColor: AppColor.primaryColor,
              ),
            );
          },
        ),
      ),
    );
  }

  void _attemptAutoLogin(BuildContext context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var value = sharedPreferences.getString('saveModel');
    if (value != null) {
      SaveModel saveModel = SaveModel.fromJson(jsonDecode(value));
      LoginCubit cubit = LoginCubit.get(context);
      cubit.userlogin(userName: saveModel.name!, password: saveModel.password!);
    } else {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => BoardingScreen()),
        (route) => false,
      );
    }
  }
}
