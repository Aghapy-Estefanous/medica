import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medica/screens/static_pages/Cares/cubit/care_cubit.dart';
import 'package:medica/shared/cubit/Cubit.dart';
import 'package:medica/core/api/dioConsumer.dart';
import 'package:medica/screens/splash_screen.dart';
import 'package:medica/shared/styles/AppColor.dart';
import 'screens/auth/Profile/cubit/profile_cubit.dart';
import 'package:medica/shared/cubit/blocObservser.dart';
import 'package:medica/shared/network/local/sharedPref.dart';
import 'package:medica/shared/network/remote/Dio_helper.dart';
import 'screens/auth/Profile/cubit/update_profile_cubit.dart';
import 'package:medica/screens/medical_history/medical_history.dart';
import 'package:medica/screens/auth/login_auth/cubit/loginCubit.dart';
import 'package:medica/screens/calculateResultTest/valuesOfTests.dart';
import 'package:medica/screens/auth/ConfirmEmailS/cubit/email_cubit.dart';
import 'package:medica/screens/static_pages/testing/cubit/tests_cubit.dart';
import 'package:medica/screens/auth/register_auth/cubit/register_cubit.dart';
import 'package:medica/screens/auth/NewPasswordS/cubit/new_password_cubit.dart';
import 'package:medica/screens/auth/ConfirmEmailS/cubit/confirm_email_cubit.dart';

import 'screens/splash_screen.dart';

const BaseAPI = 'http://medicalsystem.runasp.net';

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
        BlocProvider(create: (context) => TestsCubit()),
        BlocProvider(create: (context) => ProfileCubit()),
        BlocProvider(create: (context) => UpdateProfileCubit()),
        BlocProvider(create: (context) => CareCubit()),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileCubit cubit = ProfileCubit.get(context);
    cubit.userData();
    return BlocProvider(
      create: (context) => AppCubit(DioConsumer(dio: Dio()))
        ..getdata()
        ..GetAllDepartments()
        ..GetAllClinics()
        ..getALLDiseases2()
        ..getBasicData()
        ..GetAllClinics()
        ..getAllUserDiseases(),
      child: MaterialApp(
        theme: ThemeData(
          useMaterial3: false,
          primaryColor: AppColor.primaryColor,
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: AppColor.primaryColor,
            secondary: AppColor.orangcolor,
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: CalculateTestVitResultScreen(),
      ),
    );
  }
}
