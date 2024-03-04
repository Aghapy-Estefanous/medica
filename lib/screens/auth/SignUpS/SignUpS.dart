import 'package:flutter/material.dart';
import 'package:medica/screens/auth/ConfirmEmailS/EmailS.dart';
import 'package:medica/screens/auth/loginS/loginS.dart';
import 'package:medica/shared/SharedWidget.dart';

class Sign_Up extends StatefulWidget {
  const Sign_Up({super.key});

  @override
  State<Sign_Up> createState() => _Sign_UpState();
}

class _Sign_UpState extends State<Sign_Up> {
  bool _obscureText = true;
  bool _obscureText2 = true;
  String pass = '';
  bool gender = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 200,
              child: Stack(
                alignment: Alignment.topLeft,
                children: [
                  Image.asset('assets/images/onboarding/shape.png'),
                  Text(
                    'Sign_Up',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
            SafeArea(
              minimum: EdgeInsets.all(10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                    // _______________Name
                    Container(
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(217, 217, 217, 0.27),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: TextField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person_outline_sharp),
                            border: InputBorder.none,
                            hintText: 'Full Name'),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    //______________NID
                    Container(
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(217, 217, 217, 0.27),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: TextField(
                        keyboardType: TextInputType.numberWithOptions(
                            decimal: false, signed: false),
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.local_police_outlined),
                            border: InputBorder.none,
                            hintText: 'National ID'),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // ____________Email
                    // Container(
                    //   decoration: BoxDecoration(
                    //       color: const Color.fromRGBO(217, 217, 217, 0.27),
                    //       borderRadius: BorderRadius.all(Radius.circular(20))),
                    //   child: TextField(
                    //     keyboardType: TextInputType.emailAddress,
                    //     decoration: InputDecoration(
                    //         prefixIcon: Icon(Icons.email_outlined),
                    //         border: InputBorder.none,
                    //         hintText: 'E-mail'),
                    //   ),
                    // ),

                    // SizedBox(
                    //   height: 10,
                    // ),
                    // __________________ password
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
                        onChanged: (value) => pass = value,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    //__________________Confirm password
                    Container(
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(217, 217, 217, 0.27),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock_outlined),
                          suffixIcon: IconButton(
                            alignment: Alignment.centerRight,
                            icon: Icon(_obscureText2
                                ? Icons.visibility_off
                                : Icons.visibility),
                            onPressed: () {
                              setState(() {
                                _obscureText2 = !_obscureText2;
                              });
                            },
                          ),
                          border: InputBorder.none,
                          hintText: 'Confirm Password',
                        ),
                        obscureText: _obscureText2,
                        onChanged: (value) {
                          if (value == pass) ;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    //____________Gender
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Gender : Male',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w700),
                        ),
                        Switch(
                            value: gender,
                            onChanged: (value) => setState(() {
                                  gender = !gender;
                                })),
                      ],
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
                                navigateToScreen(
                                    context, Email(ScreenName: Login()));
                              },
                              child: Text(
                                'Sign Up',
                                style: TextStyle(color: Colors.white),
                              ),
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
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
                    //         onPressed: () {},
                    //         child: Text(
                    //           'Sign_Up',
                    //           style: TextStyle(color: Colors.white),
                    //         ),
                    //         style: ButtonStyle(
                    //           backgroundColor: MaterialStateProperty.all<Color>(
                    //               Color.fromRGBO(250, 147, 13, 1)),
                    //           shape: MaterialStateProperty.all<RoundedRectangleBorder>(
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
                        Text("Already have an account?  ",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500)),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Login .',
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
      ),
    );
  }
}
//Sign_Up