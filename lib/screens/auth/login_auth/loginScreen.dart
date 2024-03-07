import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medica/shared/SharedWidget.dart';
import 'package:medica/shared/styles/AppColor.dart';
import 'package:medica/screens/home/home_screen.dart';
import 'package:medica/screens/auth/register_auth/register.dart';
import 'package:medica/screens/auth/login_auth/cubit/loginCubit.dart';
import 'package:medica/screens/auth/login_auth/cubit/loginState.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginErrorState) {
            showtoast(
              context: context,
              Message: " error in email or password",
              color: Colors.red,
            );
          }
          if (state is LoginSuccessgState) {
            //if (state.model?.status == true) {
            // print(state.model?.data!.token);
            // CachHelper.Savedata(key: 'token', value: state.model?.data!.token)
            //     .then((value) {
            //   token = state.model?.data!.token;
            //   print(CachHelper.getdata(key: 'token'));
            // });
            showtoast(
              context: context,
              Message: " login successfully ",
              color: Color.fromARGB(255, 60, 189, 53),
            );
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const Home_Screen(),
              ),
              (route) => false,
            );

            // } else {
            //    showtoast(
            //     context:context,
            //     Message: state.model!.message.toString(),
            //     color: Color.fromARGB(255, 103, 31, 13),
            //   );

            //}
          }
        },
        builder: (context, state) {
          LoginCubit cubit = LoginCubit.get(context);
          return Scaffold(
            body: SingleChildScrollView(
              child: Form(
                key: formstate,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: SizedBox(
                        height: 140,
                        child: Stack(children: [
                          Image.asset('assets/images/onboarding/shape.png'),
                          Image.asset(
                            'assets/images/onboarding/logo.png',
                            height: 150,
                            width: 150,
                            fit: BoxFit.cover,
                          ),
                        ]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: Column(
                        children: [
                          Text("LOGIN",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .copyWith(color: Colors.black)),
                          Text("log in now to brows our hot offers",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(color: Colors.grey)),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0)),
                                hintText: "Email",
                                hintStyle: const TextStyle(fontSize: 20),
                                prefixIcon:
                                    const Icon(Icons.email_outlined, size: 25),
                              ),
                              validator: (String? value) =>
                                  validation(value, "Please enter your email")),
                          const SizedBox(height: 15),
                          TextFormField(
                            obscureText: LoginCubit.get(context).isvisiable,
                            controller: passwordController,
                            validator: (String? value) =>
                                validation(value, "Please enter your password"),
                            decoration: InputDecoration(
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0)),
                              hintText: "Password",
                              hintStyle: const TextStyle(fontSize: 20),
                              prefixIcon: const Icon(Icons.lock, size: 25),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  LoginCubit.get(context).ChangeVisiablityIcon();
                                },
                                icon:
                                    Icon(LoginCubit.get(context).icon, size: 25),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ConditionalBuilder(
                            fallback: (context) =>
                                const Center(child: CircularProgressIndicator()),
                            builder: (BuildContext context) {
                              return SizedBox(
                                height: 50,
                                width: 450,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColor.primaryColor),
                                  onPressed: () {
                                    // Validate the form
                                    if (formstate.currentState!.validate()) {
                                      cubit.userlogin(
                                        email: emailController.text
                                            .trim(), // Get the text value from the controller
                                        password: passwordController.text
                                            .trim(), // Get the text value from the controller
                                      );
                                    }
                                    // print(emailController.text +
                                    //     passwordController.text);
                                  },
                                  child: const Text('LOGIN'),
                                ),
                              );
                            },
                            condition: state is! LoginLoadingState,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(60, 20, 0, 0),
                            child: Row(
                              children: [
                                const Text(
                                  "Don't have account  ",
                                  style: TextStyle(fontSize: 16),
                                ),
                                InkWell(
                                  onTap: () {
                                    navigateToScreen(context, RegisterScreen());
                                    // CachHelper.removeKey(key: 'token')
                                    //     .then((value) {
                                    //   navigateToScreen(context, RegisterScreen());
                                    // });
                                  },
                                  child: const Text(
                                    "register",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: AppColor.primaryColor),
                                  ),
                                ),
                              ],
                            ),
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

validation(String? value, String AlertTxet) {
  if (value == null || value.isEmpty) {
    return AlertTxet;
  } else {
    return null;
  }
}
