import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medica/screens/splash_screen.dart';
import 'package:medica/shared/cubit/Cubit.dart';
import 'package:medica/shared/styles/themes.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: MaterialApp(
          theme: liteTheme(),
          debugShowCheckedModeBanner: false,
          home: Splash_screen()),
    );
  }
}
