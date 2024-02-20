import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medica/screens/auth/login/login.dart';
import 'package:medica/shared/SharedWidget.dart';
import 'package:medica/shared/cubit/Cubit.dart';
import 'package:medica/shared/cubit/State.dart';


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
            appBar: AppBar(
              title: const Text("Shop App", style:  TextStyle(
                     // color: Color.fromARGB(255, 72, 77, 79),
                      fontWeight: FontWeight.w800,
                      fontSize: 20,
                    ), 
                    ),
                  actions: [
                    IconButton(onPressed: (){
                   navigateToScreen(context,Login());
                    }, icon:const Icon(Icons.search)),
                  //  IconButton(onPressed: (){cubit.ChangeThemeMode();},
                  //   icon: Icon(Icons.brightness_6_outlined))
                  ],
            ),
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