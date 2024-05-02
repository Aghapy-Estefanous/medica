import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:medica/home_layout.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medica/shared/SharedWidget.dart';
import 'package:medica/shared/styles/AppColor.dart';
import 'package:medica/screens/home/home_screen.dart';
import 'package:medica/shared/network/local/sharedPref.dart';
import 'package:medica/screens/auth/ConfirmEmailS/EmailS.dart';
import 'package:medica/screens/auth/register_auth/register.dart';
import 'package:medica/screens/auth/NewPasswordS/NewPasswordS.dart';
import 'package:medica/screens/auth/login_auth/cubit/loginCubit.dart';
import 'package:medica/screens/auth/login_auth/cubit/loginState.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

var TOKEN;

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginErrorState) {
            //  print(LoginCubit.get(context).CURRENT_USER);
            showtoast(
              context: context,
              Message: " error pass or user",
              color: Colors.red,
            );
          } else if (state is LoginSuccessgState) {
            if (state.model?.succeeded == true) {
              // TOKEN=state.model?.data!.token;
              // print(state.model?.data!.token);
              CachHelper.Savedata(key: 'token', value: state.model?.data!.token)
                  .then((value) {
                var token = state.model?.data!.token;
                print(CachHelper.getdata(key: 'token'));
              });
              showtoast(
                context: context,
                Message: state.model!.message.toString(),
                color: Color.fromARGB(255, 60, 189, 53),
              );
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeLayout(),
                ),
                (route) => false,
              );
            } else {
              showtoast(
                context: context,
                Message: state.model!.message.toString(),
                color: Color.fromARGB(255, 145, 48, 24),
              );
            }
          }
        },
        builder: (context, state) {
          LoginCubit cubit = LoginCubit.get(context);
          return Scaffold(
            body: SingleChildScrollView(
              child: Form(
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
                          Text("LOGIN",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(color: Colors.black)),
                          const SizedBox(
                            height: 5,
                          ),
                          Text("Login now! Your health is our priority",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(color: Colors.grey, fontSize: 18)),
                          const SizedBox(
                            height: 15,
                          ),
                          //************************username filed*************************
                          TextFormField(
                            controller: usernameController,
                            // validator: (value) {
                            //   if (value == null || value.isEmpty) {
                            //     return 'Please enter your email';
                            //   } else if (!RegExp(
                            //           r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            //       .hasMatch(value))
                            //     return 'please enter a valid email adress';
                            //   return null;
                            // },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide.none,
                              ),
                              fillColor: Color.fromRGBO(217, 217, 217, 0.27),
                              filled: true,
                              prefixIcon: const Icon(Iconsax.user),
                              hintText: 'User Name',
                            ),
                          ),

                          //************************email filed*************************
                          const SizedBox(height: 15),
                          //************************password filed*************************
                          TextFormField(
                            controller: passwordController,
                            obscureText: LoginCubit.get(context).isvisiable,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              } else if (!RegExp(
                                      r'^(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[^\w\d]).{6,}$')
                                  .hasMatch(value)) {
                                return 'must have at least one digit,upper-lower\ncase ,non-alphanumeric char,';
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
                                icon: Icon(Icons.visibility_off),
                                onPressed: () {
                                  LoginCubit.get(context)
                                      .ChangeVisiablityIcon();
                                },
                              ),
                              hintText: 'Password',
                            ),
                          ),
                          const SizedBox(height: 15),
                          //************************password filed*************************
                          InkWell(
                            child: Text(
                              ' Forgot password?',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500),
                            ),
                            onTap: () {
                              navigateToScreen(
                                  context,
                                  Email(
                                      ScreenName: NewPassword(
                                    Email: '',
                                  )));
                            },
                          ),
                          //.............................
                          const SizedBox(height: 15),
                          ConditionalBuilder(
                            fallback: (context) => const Center(
                                child: CircularProgressIndicator()),
                            builder: (BuildContext context) {
                              return mySubmitButton(() {
                                if (formstate.currentState!.validate()) {
                                  cubit.userlogin(
                                    userName: usernameController.text.trim(),
                                    password: passwordController.text.trim(),
                                  );
                                }
                              }, "Login", context);
                            },
                            condition: state is! LoginLoadingState,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              const Text(" Don't have an account?  ",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500)),
                              InkWell(
                                onTap: () {
                                  navigateToScreen(context, RegisterScreen());
                                },
                                child: Text(
                                  'Create one .',
                                  style: TextStyle(
                                      color: AppColor.highlightColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
