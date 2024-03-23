import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medica/shared/cubit/Cubit.dart';
import 'package:medica/shared/cubit/State.dart';
import 'package:medica/shared/styles/AppColor.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
            bottomNavigationBar: NavigationBar(
          
              height: 75,
              backgroundColor: Colors.white,
              indicatorColor: AppColor.primaryColor,
              //onDestinationSelected
              animationDuration: Duration(milliseconds: 1100),
              //onDestinationSelected: cubit.currentIndex,
              destinations: cubit.BottomNavItems,
              selectedIndex: cubit.currentIndex,

              onDestinationSelected: (int index) {
                cubit.ChangeBottomNavigateBar(index: index);
              },
            ),
            //body: Screen[_currentNavBarIndex],

            //  BottomNavigationBar(
            //   items: cubit.BottomNavItems,
            //   currentIndex: cubit.currentIndex,

            //   onTap: (int index) {
            //     cubit.ChangeBottomNavigateBar(index: index);
            //   },
            // ),
            body: cubit.Screen[cubit.currentIndex]);
      },
    );
  }
}
