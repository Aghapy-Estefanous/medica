// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import 'package:medica/screens/auth/ConfirmEmailS/cubit/confirm_email_cubit.dart';
import 'package:medica/screens/home/home_screen.dart';
import 'package:medica/shared/SharedWidget.dart';

class ConfirmEmail extends StatelessWidget {
  Widget ScreenName;
  String Email;
  ConfirmEmail({
    Key? key,
    required this.ScreenName,
    required this.Email,
  }) : super(key: key);

  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  // TextEditingController emailController = TextEditingController();
  // TextEditingController otpController = TextEditingController();
  String otp = '';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ConfirmEmailCubit(),
      child: BlocConsumer<ConfirmEmailCubit, ConfirmEmailState>(
        listener: (context, state) {
          if (state is ConfirmEmailErrorState) {
            showtoast(
              context: context,
              Message: "Invalid OTP or expired",
              color: Colors.red,
            );
          }
          if (state is ConfirmEmailSuccessgState) {
            showtoast(
              context: context,
              Message: "OTP correct",
              color: Color.fromARGB(255, 60, 189, 53),
            );
            navigateandFinish(context, ScreenName);
          }
        },
        builder: (context, state) {
          ConfirmEmailCubit cubit = ConfirmEmailCubit.get(context);
          return Scaffold(
            body: Form(
              key: formstate,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: SizedBox(
                        child: Image.asset(
                      'assets/images/Auth/logoFinal.png',
                      height: 130,
                      width: 200,
                      fit: BoxFit.cover,
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Enter the OTP",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(color: Colors.black)),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                            "we have sent a verification code for your email $Email please enter code digits",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(color: Colors.grey, fontSize: 18)),
                        const SizedBox(
                          height: 15,
                        ),
                        OtpTextField(
                          borderRadius: BorderRadius.circular(15),
                          // filled: true,
                          // fillColor: Color.fromRGBO(217, 217, 217, 1), 
                          numberOfFields: 6,
                          // borderWidth: 4.0,
                          borderColor: Color(0xFF512DA8),
                          //set to true to show as box or false to show as dash
                          showFieldAsBox: true,

                          //runs when a code is typed in
                          onCodeChanged: (String code) {
                            //handle validation or checks here
                          },
                          //runs when every textfield is filled
                          onSubmit: (String verificationCode) {
                            otp = verificationCode;
                            print(otp);
                          }, // end onSubmit
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ConditionalBuilder(
                          fallback: (context) =>
                              const Center(child: CircularProgressIndicator()),
                          builder: (BuildContext context) {
                            return mySubmitButton(() {
                              if (formstate.currentState!.validate()) {
                                cubit.Email(
                                  Email: Email,
                                  OTP: otp,
                                );
                              }
                            }, 'Enter the OTP', context);
                          },
                          condition: state is! ConfirmEmailLoadingState,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
