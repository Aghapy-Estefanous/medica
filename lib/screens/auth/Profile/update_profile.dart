import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medica/models/ProfileModel.dart';
import 'package:medica/screens/auth/Profile/cubit/update_profile_cubit.dart';
import 'package:medica/screens/auth/register_auth/Gender.dart';
import 'package:medica/shared/SharedWidget.dart';
import 'package:medica/shared/styles/AppColor.dart';

class bottomsheetwidget extends StatelessWidget {
  const bottomsheetwidget({
    super.key,
    required this.userProfile,
    required this.context,
  });

  final ProfileModel? userProfile;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    TextEditingController _firstnameController = TextEditingController();
    TextEditingController _lastnameController = TextEditingController();
    TextEditingController _ageController = TextEditingController();
    TextEditingController _phoneController = TextEditingController();
    TextEditingController _emailController = TextEditingController();
    TextEditingController _nidController = TextEditingController();
    TextEditingController _gender = TextEditingController();
    GlobalKey<FormState> formstate = GlobalKey<FormState>();

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
          isScrollControlled:
              true, // This makes the modal bottom sheet full screen
          builder: (context) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize
                      .min, // To make the bottom sheet wrap its content
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Form(
                        key: formstate,
                        child: Column(
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
                              // validator: (String? value) {
                              //   if (value!.isEmpty) {
                              //     return 'nameError'.tr();
                              //   } else if (value.length < 3) {
                              //     return 'name length must be at least 3 chars ';
                              //   }
                              //   return null;
                              // },
                              controller: _firstnameController,
                              hint: 'fn'.tr(),
                              icon: Icon(Iconsax.user),
                              text: 'fn'.tr(),
                              // initialValue:
                              //     userProfile?.firstName ?? 'FirstName',
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            CustomTxtFormField(
                              // validator: (String? value) {
                              //   if (value!.isEmpty) {
                              //     return 'Please enter your last name';
                              //   } else if (value.length < 3) {
                              //     return 'name length must be at least 3 chars ';
                              //   }
                              //   return null;
                              // },
                              controller: _lastnameController,
                              hint: 'ln'.tr(),
                              icon: Icon(Iconsax.user),
                              text: 'ln'.tr(),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            CustomTxtFormField(
                              // validator: (String? value) {
                              //   if (value!.isEmpty) {
                              //     return 'Please enter your E-mail';
                              //   } else if (RegExp(
                              //               r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              //           .hasMatch(value) ==
                              //       false) {
                              //     return 'Please enter a valid E-mail';
                              //   }
                              //   return null;
                              // },
                              controller: _emailController,
                              hint: 'email'.tr(),
                              icon: Icon(Iconsax.message),
                              text: 'email'.tr(),
                              keyType: TextInputType.emailAddress,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            CustomTxtFormField(
                              // validator: (String? value) {
                              //   if (value!.isEmpty) {
                              //     return 'ageError'.tr();
                              //   }
                              //   return null;
                              // },
                              controller: _ageController,
                              hint: 'age'.tr(),
                              icon: Icon(Iconsax.calendar),
                              text: 'age'.tr(),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            CustomTxtFormField(
                              // validator: (String? value) {
                              //   if (value!.isEmpty) {
                              //     return 'Please enter your phone number';
                              //   } else if (value.length < 11) {
                              //     return 'phone length must be at least 11 number ';
                              //   }
                              //   return null;
                              // },
                              controller: _phoneController,
                              hint: 'num'.tr(),
                              icon: Icon(Iconsax.call),
                              text: 'num'.tr(),
                              keyType: TextInputType.number,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            CustomTxtFormField(
                              // validator: (String? value) {
                              //   if (value!.isEmpty) {
                              //     return 'Please enter your NID';
                              //   }
                              //   return null;
                              // },
                              controller: _nidController,
                              hint: 'nid'.tr(),
                              icon: Icon(Iconsax.card),
                              text: 'nid'.tr(),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              'Select your gender :'.tr(),
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            GenderSelector(_gender),
                            const SizedBox(
                              height: 25,
                            ),
                            BlocBuilder<UpdateProfileCubit, UpdateProfileState>(
                              builder: (context, state) {
                                return mySubmitButton(() {
                                  // if (formstate.currentState!.validate()) {}
                                  UpdateProfileCubit cubit =
                                      UpdateProfileCubit.get(context);
                                  cubit.updateProfile(
                                    firstName: _firstnameController.text,
                                    lastName: _lastnameController.text,
                                    nid: _nidController.text,
                                    email: _emailController.text,
                                    age: _ageController.text,
                                    phoneNumber: _phoneController.text,
                                    gender: _gender.text,
                                  );
                                }, 'Update'.tr(), context);
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
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
  }
}
