import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
// import 'package:medica/screens/auth/login_auth/cubit/profile_cubit.dart';
import 'package:medica/screens/onboarding/onboarding.dart';
import 'package:medica/shared/SharedWidget.dart';
import 'package:medica/shared/styles/AppColor.dart';

import 'cubit/profile_cubit.dart';
import 'testpdf.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(),
      child: Scaffold(
        // backgroundColor: AppColor.brawn,
        body: Container(
          height: 650,
          margin: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  child: CircleAvatar(
                    radius: 70.0,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 80.0,
                      backgroundImage: const AssetImage(
                        'assets/images/homeRepaire2.jpg',
                      ),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: CircleAvatar(
                          backgroundColor:
                              const Color.fromARGB(162, 218, 216, 216),
                          radius: 20.0,
                          child: IconButton(
                            highlightColor: AppColor.primaryColor,
                            splashColor: AppColor.primaryColor,
                            icon: Icon(
                              Iconsax.camera4,
                              size: 22.0,
                              color: AppColor.primaryColor,
                            ),
                            onPressed: () {
                              saveFileToDevice(
                                  'images/backgrounds/software.pdf');
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: const Text(
                      'Hi Sir David',
                      style: TextStyle(
                        fontFamily: 'SF Pro',
                        fontWeight: FontWeight.w700,
                        fontSize: 24.0,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        Icon(
                          Iconsax.call,
                          size: 18.0,
                          color: AppColor.primaryColor,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          '01126427055',
                          style: TextStyle(
                            fontFamily: 'SF Pro',
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        Icon(
                          Iconsax.location,
                          size: 18.0,
                          color: AppColor.primaryColor,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'المركز , المنطقة',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Center(
                  child: TextButton(
                    onPressed: () {
                      print('im pressed');
                    },
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                      decoration: const BoxDecoration(
                        color: Color(0xFFEF476F),
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      child: const Text(
                        'تعديل البيانات',
                        style: TextStyle(
                          fontFamily: 'SF Pro',
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ),
                ),
                RowUseritems(
                  icon: Iconsax.money_send,
                  label: 'طريقة الدفع',
                  fun: () {},
                ),
                RowUseritems(
                  icon: Icons.people,
                  label: "ارسل لاصدقائك",
                  fun: () {},
                ),
                RowUseritems(
                  icon: Iconsax.setting_24,
                  label: 'الاعدادات',
                  fun: () {},
                ),
                const SizedBox(height: 20),
                mylogOutWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class mylogOutWidget extends StatelessWidget {
  const mylogOutWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is ProfileLoggedOut) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => BoardingScreen()),
            (route) => false,
          );
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              IconButton(
                icon: Icon(
                  Iconsax.logout_14,
                  size: 22,
                  weight: 300,
                  color: AppColor.orangcolorwithOpacity,
                  grade: 20,
                ),
                onPressed: () {
                  context.read<ProfileCubit>().logout();
                },
              ),
              Text(
                'تسجيل الخروج',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColor.orangcolorwithOpacity,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class RowUseritems extends StatelessWidget {
  const RowUseritems({
    super.key,
    required this.icon,
    required this.label,
    required this.fun,
  });

  final void Function() fun;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0, right: 18, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                icon,
                size: 21,
                weight: 100,
                color: AppColor.primaryColor,
                grade: 20,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                label,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
          IconButton(
            icon: Icon(
              Icons.arrow_forward_ios,
              size: 22,
              weight: 300,
              color: AppColor.primaryColor,
              grade: 20,
            ),
            onPressed: fun,
          ),
        ],
      ),
    );
  }
}
