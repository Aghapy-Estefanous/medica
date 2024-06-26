import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medica/models/ProfileModel.dart';
import 'package:medica/screens/auth/Profile/update_profile.dart';
import 'package:medica/screens/auth/login_auth/loginScreen.dart';
import 'package:medica/screens/onboarding/onboarding.dart';
import 'package:medica/shared/SharedWidget.dart';
import 'package:medica/shared/styles/AppColor.dart';
import 'package:easy_localization/easy_localization.dart';

import 'cubit/profile_cubit.dart'; // Import this

// Your existing imports

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit()..userData(),
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: BlocBuilder<ProfileCubit, ProfileState>(
              builder: (context, state) {
                if (state is ProfileLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is ProfileData) {
                  var userProfile = state.userProfile;
                  return _buildProfile(userProfile, context);
                } else if (state is ProfileError) {
                  return Center(child: Text(state.message));
                } else {
                  return Center(
                      child: Text(tr('loginMessage'))); // Localized string
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfile(ProfileModel? userProfile, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 10),
        CircleAvatar(
          radius: 70.0,
          backgroundColor: Colors.white,
          child: CircleAvatar(
            radius: 80.0,
            backgroundImage:
                AssetImage('assets/images/Auth/Profile-Avatar-PNG.png'),
            child: Align(
              alignment: Alignment.bottomRight,
              child: CircleAvatar(
                backgroundColor: const Color.fromARGB(162, 218, 216, 216),
                radius: 20.0,
                child: IconButton(
                  highlightColor: AppColor.primaryColor,
                  splashColor: AppColor.primaryColor,
                  icon: Icon(Iconsax.camera4,
                      size: 22.0, color: AppColor.primaryColor),
                  onPressed: () {},
                ),
              ),
            ),
          ),
        ),
        Center(
          child: Container(
            padding: const EdgeInsets.only(top: 16.0),
            child: Text(
              userProfile != null
                  ? tr('nameLabel2', namedArgs: {
                      'first': userProfile.firstName ?? '',
                      'second': userProfile.lastName ?? '',
                    })
                  : tr('helloUserMessage'), // Localized strings
              style: TextStyle(
                fontFamily: 'SF Pro',
                fontWeight: FontWeight.w700,
                fontSize: 24.0,
              ),
            ),
          ),
        ),
        Center(
          child: CustomContainer(
            child: Column(
              children: [
                CustomRow(userProfile?.email, Iconsax.message),
                SizedBox(height: 20),
                CustomRow(userProfile?.nid, Iconsax.card),
                SizedBox(height: 20),
                CustomRow(userProfile?.phoneNumber, Iconsax.mobile),
                SizedBox(height: 20),
                CustomRow(
                    tr('ageMessage',namedArgs: {"age": userProfile?.age.toString() ?? ""}), Iconsax.calendar), // Localized string
                SizedBox(height: 20),
                Row(
                  children: [
                    const SizedBox(width: 20),
                    Icon(Iconsax.location,
                        size: 18.0, color: AppColor.primaryColor),
                    const SizedBox(width: 10),
                    Text(tr('locationMessage'),
                        style: TextStyle(fontSize: 16.0)), // Localized string
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 15),
        Center(
            child:
                bottomsheetwidget(userProfile: userProfile, context: context)),
        CustomContainer(
          child: Column(
            children: [
              RowUseritems(
                  icon: Icons.people,
                  label: tr('shareMessage'),
                  fun: () {}), // Localized string
              RowUseritems(
                  icon: Iconsax.setting_24,
                  label: tr('settingsMessage'),
                  fun: () {}), // Localized string
            ],
          ),
        ),
        const SizedBox(height: 20),
        mylogOutWidget(),
      ],
    );
  }
}

// CustomRow, mylogOutWidget, RowUseritems widgets remain unchanged
class CustomRow extends StatelessWidget {
  final String? txt;
  final IconData iconed;

  CustomRow(this.txt, this.iconed);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 20),
        Icon(iconed, size: 18.0, color: AppColor.primaryColor),
        const SizedBox(width: 10),
        Text(
          txt ?? 'no data',
          style: TextStyle(fontFamily: 'SF Pro', fontSize: 16.0),
        ),
      ],
    );
  }
}

class mylogOutWidget extends StatelessWidget {
  const mylogOutWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is ProfileLoggedOut) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
            (route) => false,
          );
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: InkWell(
            onTap: () {
              context.read<ProfileCubit>().logout();
            },
            child: Row(
              children: [
                IconButton(
                  icon: Icon(
                    Iconsax.logout_14,
                    size: 22,
                    color: AppColor.orangcolorwithOpacity,
                  ),
                  onPressed: () {
                    context.read<ProfileCubit>().logout();
                  },
                ),
                Text(
                  tr('logoutMessage'),
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColor.orangcolorwithOpacity,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class RowUseritems extends StatelessWidget {
  const RowUseritems({
    Key? key,
    required this.icon,
    required this.label,
    required this.fun,
  }) : super(key: key);

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
                color: AppColor.primaryColor,
              ),
              const SizedBox(width: 10),
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
              color: AppColor.primaryColor,
            ),
            onPressed: fun,
          ),
        ],
      ),
    );
  }
}
