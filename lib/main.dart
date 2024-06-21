import 'package:dio/dio.dart';
import 'screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medica/shared/cubit/Cubit.dart';
import 'package:medica/core/api/dioConsumer.dart';
import 'package:medica/shared/styles/AppColor.dart';
import 'package:provider/provider.dart';
import 'screens/auth/Profile/cubit/profile_cubit.dart';
import 'package:medica/shared/cubit/blocObservser.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:medica/shared/network/local/sharedPref.dart';
import 'package:medica/shared/network/remote/Dio_helper.dart';
import 'screens/auth/Profile/cubit/update_profile_cubit.dart';
import 'package:medica/screens/auth/login_auth/cubit/loginCubit.dart';
import 'package:medica/screens/static_pages/Cares/cubit/care_cubit.dart';
import 'package:medica/screens/auth/ConfirmEmailS/cubit/email_cubit.dart';
import 'package:medica/screens/static_pages/testing/cubit/tests_cubit.dart';
import 'package:medica/screens/auth/register_auth/cubit/register_cubit.dart';
import 'package:medica/screens/auth/NewPasswordS/cubit/new_password_cubit.dart';
import 'package:medica/screens/auth/ConfirmEmailS/cubit/confirm_email_cubit.dart';

import 'shared/styles/ThemeProvider.dart';

const BaseAPI = 'https://medicalsystem.runasp.net';

main() async {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
   await EasyLocalization.ensureInitialized();
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
      child:  ChangeNotifierProvider(
        create: (_) => ThemeProvider(),
        child: EasyLocalization(
            supportedLocales: [Locale('en'), Locale('ar')],
            path: 'assets/localization',
            fallbackLocale: Locale('en'),
            startLocale: Locale('en'),
            saveLocale: true,
            child: MainApp()),
      ),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    ProfileCubit cubit = ProfileCubit.get(context);
    cubit.userData();
    return BlocProvider(
      create: (context) => AppCubit(DioConsumer(dio: Dio()))
        ..checkConnectivity()
        ..getAllReservation()
        ..GetAllDepartments()
        ..GetAllClinics()
        ..getALLDiseases2()
        ..getBasicData()
        ..GetAllClinics()
        ..getAllUserDiseases(),
      child: MaterialApp(

          localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: themeProvider.themeData,
        // theme: ThemeData(
        //   useMaterial3: false,
        //   primaryColor: AppColor.primaryColor,
        //   colorScheme: ColorScheme.fromSwatch().copyWith(
        //     primary: AppColor.primaryColor,
        //     secondary: AppColor.orangcolor,
        //   ),
        // ),
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
