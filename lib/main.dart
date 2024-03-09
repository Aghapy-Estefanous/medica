import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medica/shared/cubit/Cubit.dart';
import 'package:medica/shared/styles/themes.dart';
import 'package:medica/screens/splash_screen.dart';
import 'package:medica/screens/see_all/see_all.dart';
import 'package:medica/shared/cubit/blocObservser.dart';
import 'package:medica/screens/reservation/ticketScreen.dart';
import 'package:medica/shared/network/remote/Dio_helper.dart';
import 'package:medica/screens/auth/login_auth/loginScreen.dart';
import 'package:medica/screens/details_screen/details_clinics.dart';
import 'package:medica/screens/auth/login_auth/cubit/loginCubit.dart';
import 'package:medica/screens/auth/register_auth/cubit/register_cubit.dart';

main() {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  dio_helper.init();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit()), // Your login provider
        BlocProvider(
            create: (context) => RegisterCubit()), // Your register provider
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
      create: (context) => AppCubit(),
      child: MaterialApp(
          theme: liteTheme(),
          debugShowCheckedModeBanner: false,
          home: TicketScreen()) //Splash_screen()),
    );
  }
}
