import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medica/screens/auth/NewPasswordS/cubit/new_password_cubit.dart';
import 'package:medica/screens/auth/login_auth/loginScreen.dart';
import 'package:medica/shared/SharedWidget.dart';
// import 'package:medica/screens/auth/loginS/loginS.dart';

class NewPassword extends StatelessWidget {
  NewPassword({super.key});
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewPasswordCubit, NewPasswordState>(
        listener: (context, state) {
      if (state is NewPasswordSuccessState) {
        navigateToScreen(context, LoginScreen());
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
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            } else if (!RegExp(
                                    r'^(?=.*[A-Z])(?=.*[0-9])(?=.*[^\w\d]).{5,}$')
                                .hasMatch(value)) {
                              return 'Password must have at least one uppercase letter, one digit, and one non-alphanumeric character.';
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
                            prefixIcon: Icon(Iconsax.lock),
                            suffixIcon: IconButton(
                              alignment: Alignment.centerRight,
                              icon: Icon(cubit.icon),
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
                            prefixIcon: Icon(Iconsax.lock),
                            suffixIcon: IconButton(
                              alignment: Alignment.centerRight,
                              icon: Icon(cubit.icon2),
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
                        mySubmitButton(() {
                          navigateandFinish(context, LoginScreen());
                        }, 'Confirm', context)
                      ]),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
