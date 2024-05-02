import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:medica/home_layout.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medica/shared/cubit/Cubit.dart';
import 'package:medica/core/api/dioConsumer.dart';
import 'package:medica/shared/styles/themes.dart';
import 'package:medica/screens/splash_screen.dart';
import 'package:medica/screens/home/home_screen.dart';
import 'package:medica/shared/cubit/blocObservser.dart';
import 'package:medica/screens/static_pages/testing.dart';
import 'package:medica/shared/network/local/sharedPref.dart';
import 'package:medica/screens/reservation/ticketScreen.dart';
import 'package:medica/shared/network/remote/Dio_helper.dart';
import 'package:medica/screens/auth/login_auth/loginScreen.dart';
import 'package:medica/screens/details_screen/details_clinics.dart';
import 'package:medica/screens/medical_history/medical_history.dart';
import 'package:medica/screens/auth/login_auth/cubit/loginCubit.dart';
import 'package:medica/screens/medical_history/medical_testsScreen.dart';
import 'package:medica/screens/auth/ConfirmEmailS/cubit/email_cubit.dart';
import 'package:medica/screens/auth/register_auth/cubit/register_cubit.dart';
import 'package:medica/screens/auth/NewPasswordS/cubit/new_password_cubit.dart';
import 'package:medica/screens/auth/NewPasswordS/cubit/new_password_cubit.dart';
import 'package:medica/screens/auth/ConfirmEmailS/cubit/confirm_email_cubit.dart';


final BaseAPI = 'http://medicalsystem-001-site1.ftempurl.com';

main() async {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  dio_helper.init();
  await CachHelper.init();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit()), // Your login provider
        BlocProvider(create: (context) => RegisterCubit()),
        BlocProvider(create: (context) => NewPasswordCubit()),
        BlocProvider(create: (context) => EmailCubit()),
        BlocProvider(create: (context) => ConfirmEmailCubit()),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(DioConsumer(dio: Dio()))..getdata()..GetAllDepartments(),
      child: MaterialApp(
          //  theme: liteTheme(),
          debugShowCheckedModeBanner: false,
          home:Splash_screen()),
    );
  }
}
