import 'package:flutter/material.dart';
import 'package:medica/screens/auth/ConfirmEmailS/EmailS.dart';
import 'package:medica/screens/auth/NewPasswordS/NewPasswordS.dart';
import 'package:medica/screens/auth/SignUpS/SignUpS.dart';
import 'package:medica/screens/home/home_screen.dart';
import 'package:medica/shared/SharedWidget.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 200,
            child: Image.asset('assets/images/Auth/icon-icon.png'),
          ),
          SafeArea(
            minimum: EdgeInsets.all(10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              // Padding(
              //   padding: const EdgeInsets.all(20.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       SizedBox(),
              //       Image.asset('assets/images/pngfind 3.png'),
              //     ],
              //   ),
              // ),
              SizedBox(
                height: 40,
              ),
              Container(
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(217, 217, 217, 0.27),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email_outlined),
                      border: InputBorder.none,
                      hintText: 'E-mail'),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(217, 217, 217, 0.27),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock_outlined),
                    suffixIcon: IconButton(
                      alignment: Alignment.centerRight,
                      icon: Icon(_obscureText
                          ? Icons.visibility_off
                          : Icons.visibility),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    ),
                    border: InputBorder.none,
                    hintText: 'Password',
                  ),
                  obscureText: _obscureText,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                child: Text(
                  'Forgot password?',
                  style: TextStyle(
                      color: Color.fromRGBO(250, 147, 13, 1),
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
                onTap: () {
                  navigateToScreen(context, Email(ScreenName: NewPassword()));
                },
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(250, 191, 113, 1),
                      Color.fromRGBO(250, 147, 13, 1),
                    ], // Define multiple colors for gradient
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(
                      10.0), // Adjust border radius as needed
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          navigateandFinish(context, Home_Screen());
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Row(
              //   children: [
              //     Expanded(
              //       child: TextButton(
              //         onPressed: () {
              //           navigateandFinish(context, Home_Screen());
              //         },
              //         child: Text(
              //           'Login',
              //           style: TextStyle(color: Colors.white),
              //         ),
              //         style: ButtonStyle(
              //           backgroundColor: MaterialStateProperty.all<Color>(
              //               Color.fromRGBO(250, 147, 13, 1)),
              //           shape:
              //               MaterialStateProperty.all<RoundedRectangleBorder>(
              //             RoundedRectangleBorder(
              //               borderRadius: BorderRadius.circular(
              //                   10.0), // Adjust the value as needed
              //             ),
              //           ),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Text("Don't have an account?  ",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
                  InkWell(
                    onTap: () {
                      navigateToScreen(context, Sign_Up());
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
              )
            ]),
          ),
        ],
      ),
    );
  }
}
//login