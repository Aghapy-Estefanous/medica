import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medica/models/ProfileModel.dart';
import 'package:medica/screens/auth/Profile/cubit/update_profile_cubit.dart';
import 'package:medica/screens/auth/register_auth/Gender.dart';
import 'package:medica/shared/SharedWidget.dart';
import 'package:medica/shared/styles/AppColor.dart';
import 'package:medica/shared/widgets/flutter_toast.dart';

import 'cubit/profile_cubit.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({
    Key? key,
    required this.userProfile,
  }) : super(key: key);

  final ProfileModel? userProfile;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdateProfileCubit(),
      child: Builder(
        builder: (context) {
          return TextButton(
            onPressed: () {
              showModalBottomSheet(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20.0),
                  ),
                ),
                useSafeArea: true,
                enableDrag: true,
                showDragHandle: true,
                context: context,
                isScrollControlled: true,
                builder: (context) {
                  return SingleChildScrollView(
                    child: ProfileForm(userProfile: userProfile),
                  );
                },
              );
            },
            child: Container(
              padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
              decoration: const BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              child: Text(
                'Edit'.tr(),
                style: TextStyle(
                  fontFamily: 'SF Pro',
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 16.0,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ProfileForm extends StatelessWidget {
  final ProfileModel? userProfile;

  ProfileForm({Key? key, this.userProfile}) : super(key: key);

  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  // final TextEditingController _nidController = TextEditingController();
  // final TextEditingController _gender = TextEditingController();
  final GlobalKey<FormState> formstate = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateProfileCubit, UpdateProfileState>(
      listener: (context, state) {
        if (state is UpdateProfileSuccessState) {
          ProfileCubit cubit = ProfileCubit.get(context);
          cubit.userData();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Profile updated successfully'.tr()),
              backgroundColor: Colors.green,
            ),
          );
          Navigator.pop(context);
        } else if (state is UpdateProfileErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formstate,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Text(
                    'update'.tr(),
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTxtFormField(
                  controller: _firstnameController,
                  hint: 'fn'.tr(),
                  icon: Icon(Iconsax.user),
                  text: 'fn'.tr(),
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTxtFormField(
                  controller: _lastnameController,
                  hint: 'ln'.tr(),
                  icon: Icon(Iconsax.user),
                  text: 'ln'.tr(),
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTxtFormField(
                  controller: _emailController,
                  hint: 'email'.tr(),
                  icon: Icon(Iconsax.message),
                  text: 'email'.tr(),
                  keyType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 15,
                ),
                // CustomTxtFormField(
                //   controller: _userNameController,
                //   hint: 'UserName'.tr(),
                //   icon: Icon(Iconsax.calendar),
                //   text: 'UserName'.tr(),
                // ),
                // const SizedBox(
                //   height: 15,
                // ),
                CustomTxtFormField(
                  controller: _phoneController,
                  hint: 'num'.tr(),
                  icon: Icon(Iconsax.call),
                  text: 'num'.tr(),
                  keyType: TextInputType.number,
                ),
                const SizedBox(
                  height: 15,
                ),
                if (state is UpdateProfileLoadingState)
                  CircularProgressIndicator()
                else
                  mySubmitButton(() {
                    if (formstate.currentState!.validate()) {
                      UpdateProfileCubit cubit =
                          UpdateProfileCubit.get(context);
                      cubit.updateProfile(
                        firstName: _firstnameController.text,
                        lastName: _lastnameController.text,
                        // nid: _nidController.text,
                        email: _emailController.text,
                        // username: _userNameController.text,
                        phoneNumber: _phoneController.text,
                        // gender: _gender.text,
                      );
                      // if (state is UpdateProfileSuccessState) {
                      //   showToast(
                      //       text: 'Profile Updated', state: ToastStates.SUCCESS);

                      //   Navigator.pop(context);
                      // }
                    }
                  }, 'Update'.tr(), context),
              ],
            ),
          ),
        );
      },
    );
  }
}
