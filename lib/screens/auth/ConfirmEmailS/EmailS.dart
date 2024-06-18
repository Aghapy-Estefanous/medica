// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:medica/screens/auth/ConfirmEmailS/ConfirmEmailS.dart';
import 'package:medica/screens/auth/ConfirmEmailS/cubit/email_cubit.dart';
import 'package:medica/screens/auth/register_auth/register.dart';
import 'package:medica/shared/SharedWidget.dart';

class Email extends StatelessWidget {
  final Widget ScreenName;
  Email({
    Key? key,
    required this.ScreenName,
  }) : super(key: key);

  bool v = false;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EmailCubit(),
      child: BlocConsumer<EmailCubit, EmailState>(
        listener: (context, state) {
          if (state is EmailErrorState) {
            showtoast(
              context: context,
              Message: state.error,
              color: Colors.red,
            );
          }
          if (state is EmailSuccessgState) {
            showtoast(
              context: context,
              Message: "OTP sent",
              color: Color.fromARGB(255, 60, 189, 53),
            );
            navigateandFinish(
                context,
                ConfirmEmail(
                    ScreenName: ScreenName, Email: emailController.text));
          }
        },
        builder: (context, state) {
          EmailCubit cubit = EmailCubit.get(context);
          return Scaffold(
            body: Form(
              key: formstate,
              child: Column(
                children: [
                  LogoWidget(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Enter your E-mail",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(color: Colors.black)),
                          const SizedBox(
                            height: 5,
                          ),
                          Text("Enter a correct email to receive the OTP",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(color: Colors.grey, fontSize: 18)),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                // Use OutlineInputBorder for border customization
                                borderRadius: BorderRadius.circular(
                                    20), // Set the border radius
                                borderSide: BorderSide
                                    .none, // Optional: remove side border
                              ),
                              fillColor: Color.fromRGBO(217, 217, 217, 0.27),
                              filled: true,
                              prefixIcon: Icon(Icons.email_outlined),
                              hintText: 'E-mail',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter an email address';
                              } else if (!RegExp(
                                      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                  .hasMatch(value)) {
                                return 'Please enter a valid email address';
                              }
                              v = true;
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 30,
                          ),

                          ConditionalBuilder(
                            fallback: (context) => const Center(
                                child: CircularProgressIndicator()),
                            builder: (BuildContext context) {
                              return mySubmitButton(() {
                                if (formstate.currentState!.validate()) {
                                  cubit.Email(
                                    email: emailController.text.trim(),
                                  );
                                }
                              }, 'ConfirmEmail', context);
                            },
                            condition: state is! EmailLoadingState,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          // mySubmitButton(() {
                          //   navigateandFinish(context,
                          //       ConfirmEmail(ScreenName: ScreenName));
                          // }, 'Confirm E-mail', context),
                          // SizedBox(
                          //   height: 30,
                          // ),
                          Row(
                            children: [
                              Text("Don't have an account?  ",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500)),
                              InkWell(
                                onTap: () {
                                  navigateandFinish(context, RegisterScreen());
                                },
                                child: Text(
                                  'Create one .',
                                  style: TextStyle(
                                      color: Color.fromRGBO(250, 147, 13, 1),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                        ]),
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
