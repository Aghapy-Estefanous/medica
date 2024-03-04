import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medica/shared/cubit/Cubit.dart';
import 'package:medica/shared/cubit/State.dart';
import 'package:medica/shared/SharedWidget.dart';
import 'package:medica/screens/auth/loginS/loginS.dart';


class ShopLayout extends StatelessWidget {
  const ShopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.BottomNavItems,
            currentIndex: cubit.currentIndex,
           
            onTap: (int index) {
              cubit.ChangeBottomNavigateBar(index: index);
            },
          ),
          body:cubit.Screen[cubit.currentIndex]
        );
      },
    );
  }
}