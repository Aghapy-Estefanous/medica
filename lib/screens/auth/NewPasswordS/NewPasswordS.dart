// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import 'package:medica/screens/auth/NewPasswordS/cubit/new_password_cubit.dart';
import 'package:medica/screens/auth/login_auth/loginScreen.dart';
import 'package:medica/shared/SharedWidget.dart';
import 'package:medica/shared/styles/AppColor.dart';

class NewPassword extends StatelessWidget {
  String Email;

  NewPassword({
    Key? key,
    required this.Email,
  }) : super(key: key);
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewPasswordCubit(),
      child: BlocConsumer<NewPasswordCubit, NewPasswordState>(
          listener: (context, state) {
        if (state is NewPasswordErrorState) {
          showtoast(
            context: context,
            Message: state.error.toString(),
            color: Colors.red,
          );
        }
        if (state is NewPasswordSuccessState) {
          showtoast(
            context: context,
            Message: "Password changed, Login with your new password!",
            color: Color.fromARGB(255, 60, 189, 53),
          );
          navigateandFinish(context, LoginScreen());
        }
      }, builder: (context, state) {
        NewPasswordCubit cubit = NewPasswordCubit.get(context);
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 200,
                  child: Image.asset('assets/images/Auth/logoFinal.png'),
                ),
                SafeArea(
                  minimum: EdgeInsets.all(10),
                  child: Form(
                    key: formstate,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // __________________ password
                          TextFormField(
                            controller: passwordController,
                            obscureText: cubit.isvisiable,
                            validator: (value) {
                              return Validate_password(value);
                              // return errmess;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide.none,
                              ),
                              fillColor: Color.fromRGBO(217, 217, 217, 0.27),
                              filled: true,
                              prefixIcon: Icon(
                                Iconsax.lock,
                              ),
                              suffixIcon: IconButton(
                                alignment: Alignment.centerRight,
                                icon: Icon(
                                  cubit.icon,
                                  color: AppColor.secondaryTextColor,
                                ),
                                onPressed: () {
                                  cubit.ChangeVisiablityIcon();
                                },
                              ),
                              hintText: 'Password',
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          //__________________Confirm password
                          TextFormField(
                            controller: confirmPassController,
                            obscureText: cubit.isvisiable2,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please confirm your password';
                              } else if (value != passwordController.text) {
                                return 'Password doesn\'t match';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide.none,
                              ),
                              fillColor: Color.fromRGBO(217, 217, 217, 0.27),
                              filled: true,
                              // iconColor: AppColor.secondaryTextColor,
                              prefixIcon: Icon(Iconsax.lock),
                              suffixIcon: IconButton(
                                alignment: Alignment.centerRight,
                                icon: Icon(
                                  cubit.icon2,
                                  color: AppColor.secondaryTextColor,
                                ),
                                onPressed: () {
                                  cubit.ChangeVisiablityIcon2();
                                },
                              ),
                              hintText: ' confirm Password',
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ConditionalBuilder(
                            fallback: (context) => const Center(
                                child: CircularProgressIndicator()),
                            builder: (BuildContext context) {
                              return mySubmitButton(() {
                                if (formstate.currentState!.validate()) {
                                  cubit.NewPass(
                                      email: Email,
                                      newPassword:
                                          passwordController.text.trim(),
                                      confirmPassword:
                                          confirmPassController.text.trim());
                                }
                              }, 'Confirm New Password', context);
                            },
                            condition: state is! NewPasswordLoadingState,
                          ),
                        ]),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
