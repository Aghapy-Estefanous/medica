// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:medica/screens/home/home_screen.dart';
import 'package:medica/shared/SharedWidget.dart';

class ConfirmEmail extends StatefulWidget {
  Widget ScreenName;
  ConfirmEmail({
    Key? key,
    required this.ScreenName,
  }) : super(key: key);

  @override
  State<ConfirmEmail> createState() => _ConfirmEmailState();
}

class _ConfirmEmailState extends State<ConfirmEmail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 200,
            child: Stack(
              alignment: Alignment.topLeft,
              children: [
                Image.asset('assets/images/onboarding/shape.png'),
                Text(
                  'ConfirmEmail',
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
                  Row(
                    children: [
                      SizedBox(
                        width: 100,
                        child: TextField(
                          maxLength: 1,
                        ),
                      )
                    ],
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
                              navigateToScreen(context, widget.ScreenName);
                            },
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                            child: Text(
                              'Confirm ',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
              //       Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

              //     SizedBox(
              //       height: 40,
              //     ),
              //     Container(
              //       decoration: BoxDecoration(
              //           color: const Color.fromRGBO(217, 217, 217, 0.27),
              //           borderRadius: BorderRadius.all(Radius.circular(20))),
              //       child: TextField(
              //         keyboardType: TextInputType.emailAddress,
              //         decoration: InputDecoration(
              //             prefixIcon: Icon(Icons.email_outlined),
              //             border: InputBorder.none,
              //             hintText: 'E-mail'),
              //       ),
              //     ),
              //     SizedBox(
              //       height: 20,
              //     ),
              //     Container(
              //       decoration: BoxDecoration(
              //           color: const Color.fromRGBO(217, 217, 217, 0.27),
              //           borderRadius: BorderRadius.all(Radius.circular(20))),
              //       child: TextField(
              //         decoration: InputDecoration(
              //           prefixIcon: Icon(Icons.lock_outlined),
              //           suffixIcon: IconButton(
              //             alignment: Alignment.centerRight,
              //             icon: Icon(_obscureText
              //                 ? Icons.visibility_off
              //                 : Icons.visibility),
              //             onPressed: () {
              //               setState(() {
              //                 _obscureText = !_obscureText;
              //               });
              //             },
              //           ),
              //           border: InputBorder.none,
              //           hintText: 'Password',
              //         ),
              //         obscureText: _obscureText,
              //       ),
              //     ),
              //     SizedBox(
              //       height: 10,
              //     ),
              //     InkWell(
              //       child: Text(
              //         'Forgot password?',
              //         style: TextStyle(
              //             color: Color.fromRGBO(250, 147, 13, 1),
              //             fontSize: 15,
              //             fontWeight: FontWeight.w500),
              //       ),
              //       onTap: () {
              //         navigateToScreen(context, ForgotPassword());
              //       },
              //     ),
              //     SizedBox(
              //       height: 30,
              //     ),
              //     Container(
              //       decoration: BoxDecoration(
              //         gradient: LinearGradient(
              //           colors: [
              //             Color.fromRGBO(250, 191, 113, 1),
              //             Color.fromRGBO(250, 147, 13, 1),
              //           ], // Define multiple colors for gradient
              //           begin: Alignment.centerLeft,
              //           end: Alignment.centerRight,
              //         ),
              //         borderRadius: BorderRadius.circular(
              //             10.0), // Adjust border radius as needed
              //       ),
              //       child: Row(
              //         children: [
              //           Expanded(
              //             child: TextButton(
              //               onPressed: () {
              //                 navigateandFinish(context, Login());
              //               },
              //               child: Text(
              //                 'Confirm',
              //                 style: TextStyle(color: Colors.white),
              //               ),
              //               style: ButtonStyle(
              //                 shape:
              //                     MaterialStateProperty.all<RoundedRectangleBorder>(
              //                   RoundedRectangleBorder(
              //                     borderRadius: BorderRadius.circular(10.0),
              //                   ),
              //                 ),
              //               ),
              //             ),
              //           ),
              //         ],
              //       ),
              //       // child: Container(
              //       //   constraints: BoxConstraints(
              //       //       minWidth: 150, minHeight: 50), // Adjust size as needed
              //       //   alignment: Alignment.center,
              //       //   child: Text(
              //       //     'ConfirmEmail',
              //       //     style: TextStyle(
              //       //       color: Colors.white, // Text color
              //       //       fontSize: 16.0,
              //       //     ),
              //       //   ),
              //       // ),
              //     ),

              //     // Row(
              //     //   children: [
              //     //     Expanded(
              //     //       child: TextButton(
              //     //         onPressed: () {
              //     //           navigateandFinish(context, Home_Screen());
              //     //         },
              //     //         child: Text(
              //     //           'ConfirmEmail',
              //     //           style: TextStyle(color: Colors.white),
              //     //         ),
              //     //         style: ButtonStyle(
              //     //           backgroundColor: MaterialStateProperty.all<Color>(
              //     //               Color.fromRGBO(250, 147, 13, 1)),
              //     //           shape:
              //     //               MaterialStateProperty.all<RoundedRectangleBorder>(
              //     //             RoundedRectangleBorder(
              //     //               borderRadius: BorderRadius.circular(
              //     //                   10.0), // Adjust the value as needed
              //     //             ),
              //     //           ),
              //     //         ),
              //     //       ),
              //     //     ),
              //     //   ],
              //     // ),
              //     SizedBox(
              //       height: 30,
              //     ),
              //     Row(
              //       children: [
              //         Text("Don't have an account?  ",
              //             style:
              //                 TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
              //         InkWell(
              //           onTap: () {
              //             navigateToScreen(context, Sign_Up());
              //           },
              //           child: Text(
              //             'Create one .',
              //             style: TextStyle(
              //                 color: Color.fromRGBO(250, 147, 13, 1),
              //                 fontSize: 15,
              //                 fontWeight: FontWeight.w500),
              //           ),
              //         ),
              //       ],
              //     )
              //   ]),
              ),
        ],
      ),
    );
  }
}
//ConfirmEmail