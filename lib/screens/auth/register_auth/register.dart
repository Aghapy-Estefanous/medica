import 'dart:ffi';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medica/shared/SharedWidget.dart';
import 'package:medica/shared/styles/AppColor.dart';
import 'package:medica/screens/auth/login_auth/loginScreen.dart';
import 'package:medica/screens/auth/register_auth/cubit/register_State.dart';
import 'package:medica/screens/auth/register_auth/cubit/register_cubit.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController nidController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccessState) {
          navigateToScreen(context, LoginScreen());
          // if (state.model!.status == false) {
          //   showSnackBar(
          //     context,
          //     message: state.model!.message.toString(),
          //     snackColor: const Color(0xFFB71C1C),
          //   );
          // } else {
          //   showSnackBar(
          //     context,
          //     message: state.model!.message.toString(),
          //     snackColor: baseColor,
          //   );
          //   CachHelper.Savedata(key: 'token', value: state.model?.data!.token)
          //       .then(
          //     (value) {
          //       token = state.model?.data!.token;
          //       print('from register token value is :$value');
          //       print('from register token from model is :$token');
          //       Navigator.pushAndRemoveUntil(
          //         context,
          //         MaterialPageRoute(
          //           builder: (context) => const ShopLayout(),
          //         ),
          //         (route) => false,
          //       );
          //       // navigateToScreen(context, const ShopLayout());
          //     },
          //   );
          // }
        }
      },
      builder: (context, state) {
        RegisterCubit cubit = RegisterCubit.get(context);
        return Scaffold(
          //  appBar: MyAppBarWidget(context, ""),
          body: SingleChildScrollView(
              child: Form(
                  key: formstate,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
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
                        /////
                        // Align(
                        //   alignment: Alignment.topLeft,
                        //   child: ,
                        // child: SizedBox(
                        //     height: 140,
                        //     child: Stack(
                        //       children: [
                        //         Image.asset(
                        //             'assets/images/onboarding/shape.png'),
                        //         Image.asset(
                        //           'assets/images/onboarding/logo.png',
                        //           height: 140,
                        //           width: 130,
                        //           fit: BoxFit.cover,
                        //         ),
                        //         Positioned(
                        //           left: 5,
                        //           top: 5,
                        //           child: Container(
                        //             height: 32,
                        //             width: 32,
                        //             decoration: BoxDecoration(
                        //               border: Border.all(
                        //                 color: Colors.white.withOpacity(0.5),
                        //                 width: 1.2,
                        //               ),
                        //               borderRadius:
                        //                   BorderRadius.circular(8.0),
                        //             ),
                        //             child: const Icon(
                        //               Icons.arrow_back_ios,
                        //               color: AppColor.whiteColor,
                        //             ),
                        //           ),
                        //         ),
                        //       ],
                        //     )),
                        //  ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Register",
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
                                      .copyWith(
                                          color: Colors.grey, fontSize: 18)),
                              const SizedBox(
                                height: 15,
                              ),

                              // TextFormField(
                              //     controller: nameController,
                              //     keyboardType: TextInputType.emailAddress,
                              //     decoration: InputDecoration(
                              //       filled: true,
                              //       border: OutlineInputBorder(
                              //           borderRadius: BorderRadius.circular(15.0)),
                              //       hintText: "name",
                              //       hintStyle: const TextStyle(fontSize: 20),
                              //       prefixIcon: const Icon(Icons.person, size: 25),
                              //     ),
                              //     validator: (String? value) =>
                              //         validation(value, "Please enter your name")),
                              // const SizedBox(
                              //   height: 15,
                              // ),
                              TextFormField(
                                controller: usernameController,
                                validator: (String? value) {
                                  if (value == null || value.isEmpty)
                                    return "Please enter your user name";
                                  else if (value!.length < 4) {
                                    return "name lenght at least 4 chars ";
                                  }
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide.none,
                                  ),
                                  fillColor:
                                      Color.fromRGBO(217, 217, 217, 0.27),
                                  filled: true,
                                  prefixIcon: Icon(Iconsax.user),
                                  hintText: 'name',
                                ),
                              ),
                              const SizedBox(height: 15),
                              //______________NID
                              TextFormField(
                                controller: nidController,
                                validator: (value) {
                                  if (value == null ||
                                      value.isEmpty ||
                                      value.length != 14)
                                    return 'Please enter your national ID (14 numbers)';
                                  return null;
                                },
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      // Use OutlineInputBorder for border customization
                                      borderRadius: BorderRadius.circular(
                                          20), // Set the border radius
                                      borderSide: BorderSide
                                          .none, // Optional: remove side border
                                    ),
                                    fillColor:
                                        Color.fromRGBO(217, 217, 217, 0.27),
                                    filled: true,
                                    prefixIcon: Icon(Iconsax.security_safe),
                                    hintText: 'National ID'),
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                        decimal: false, signed: false),
                              ),

                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: emailController,
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
                                  fillColor:
                                      Color.fromRGBO(217, 217, 217, 0.27),
                                  filled: true,
                                  prefixIcon: Icon(Icons.email_outlined),
                                  hintText: 'Email',
                                ),
                              ),

                              //************************email filed*************************
                              const SizedBox(height: 15),
                              //************************password filed*************************
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
                                  fillColor:
                                      Color.fromRGBO(217, 217, 217, 0.27),
                                  filled: true,
                                  prefixIcon: Icon(Iconsax.lock),
                                  suffixIcon: IconButton(
                                    alignment: Alignment.centerRight,
                                    icon: Icon(Icons.visibility_off),
                                    onPressed: () {
                                      cubit.ChangeVisiablityIcon();
                                    },
                                  ),
                                  hintText: 'Password',
                                ),
                              ),
                              //************************password filed*************************

                              const SizedBox(height: 15),

                              TextFormField(
                                  controller: confirmPassController,
                                  obscureText: cubit.isvisiable,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please confirm your password';
                                    } else if (value !=
                                        passwordController.text) {
                                      return 'Password doesn\'t match';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide.none,
                                    ),
                                    fillColor:
                                        Color.fromRGBO(217, 217, 217, 0.27),
                                    filled: true,
                                    prefixIcon: Icon(Iconsax.lock),
                                    suffixIcon: IconButton(
                                      alignment: Alignment.centerRight,
                                      icon: Icon(Icons.visibility_off),
                                      onPressed: () {
                                        cubit.ChangeVisiablityIcon();
                                      },
                                    ),
                                    hintText: ' confirm Password',
                                  ),
                                  onFieldSubmitted: (value) {
                                  cubit.postRegiserData(
                                        nid: nidController.text,
                                        username: usernameController.text,
                                        name: usernameController.text,
                                        gender: genderController.text,
                                        email: emailController.text,
                                        password: passwordController.text,
                                        confirmPassword:
                                            confirmPassController.text,
                                      );
                                  }),
                              const SizedBox(height: 15),

                              ConditionalBuilder(
                                fallback: (context) => const Center(
                                    child: CircularProgressIndicator()),
                                builder: (BuildContext context) {
                                  return
                                      // SizedBox(
                                      //   height: 50,
                                      //   width: 450,
                                      //   child: ElevatedButton(
                                      //     style: ElevatedButton.styleFrom(
                                      //         backgroundColor:
                                      //             AppColor.primaryColor),
                                      //     onPressed: () {
                                      //       // Validate the form
                                      //       if (formstate.currentState!
                                      //           .validate()) {
                                      //         cubit.postRegiserData(
                                      //           nid: nidController.text,
                                      //           username: usernameController.text,
                                      //           // name: nameController.text,
                                      //           gender: genderController.text,
                                      //           email: emailController.text,
                                      //           password: passwordController.text,
                                      //           confirmPassword:
                                      //               confirmPassController.text,
                                      //         );
                                      //         print(nidController.text +
                                      //             passwordController.text +
                                      //             confirmPassController.text);
                                      //       }
                                      //     },
                                      //     child: const Text('REGISTER'),
                                      //   ),
                                      // );
                                      mySubmitButton(() {
                                    // Validate the form
                                    if (formstate.currentState!.validate()) {
                                      cubit.postRegiserData(
                                        nid: nidController.text,
                                        username: usernameController.text,
                                        name: usernameController.text,
                                        gender: genderController.text,
                                        email: emailController.text,
                                        password: passwordController.text,
                                        confirmPassword:
                                            confirmPassController.text,
                                      );
                                      print(nidController.text +
                                          passwordController.text +
                                          confirmPassController.text);
                                    }
                                  }, "Register", context);
                                },
                                condition: state is! RegisterLoadingState,
                              ),
                              // const SizedBox(
                              //   height: 20,
                              // ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  const Text(" Already have an account?  ",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500)),
                                  InkWell(
                                    onTap: () {
                                      navigateToScreen(context, LoginScreen());

                                      //           // CachHelper.removeKey(key: 'token')
                                      //           //     .then((value) {
                                      //           //   navigateToScreen(context, RegisterScreen());
                                      //           // });
                                    },
                                    child: const Text(
                                      'Login',
                                      style: TextStyle(
                                          color: AppColor.orangcolor,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ],
                              ),
                             
                            ],
                          ),
                        ),
                      ]))),
        );
      },
    );
  }
}
