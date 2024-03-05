// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:medica/screens/auth/ConfirmEmailS/ConfirmEmailS.dart';
import 'package:medica/screens/auth/SignUpS/SignUpS.dart';
import 'package:medica/shared/SharedWidget.dart';

class Email extends StatefulWidget {
  final Widget ScreenName;
  Email({
    Key? key,
    required this.ScreenName,
  }) : super(key: key);

  @override
  State<Email> createState() => _EmailState();
}

class _EmailState extends State<Email> {
  bool v = false;
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
                  'Email',
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
            child: Form(
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
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          // Use OutlineInputBorder for border customization
                          borderRadius: BorderRadius.circular(
                              20), // Set the border radius
                          borderSide:
                              BorderSide.none, // Optional: remove side border
                        ),
                        fillColor: Color.fromRGBO(217, 217, 217, 0.27),
                        filled: true,
                        prefixIcon: Icon(Icons.email_outlined),
                        hintText: 'E-mail',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter an email address';
                        } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                            .hasMatch(value)) {
                          return 'Please enter a valid email address';
                        }
                        v = true;
                        return null;
                      },
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromRGBO(250, 191, 113, 1),
                            Color.fromRGBO(250, 147, 13, 1),
                          ],
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
                                v == true
                                    ? navigateandFinish(
                                        context,
                                        ConfirmEmail(
                                            ScreenName: widget.ScreenName))
                                    : null;
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
                                'Confirm E-mail',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                      // child: Container(
                      //   constraints: BoxConstraints(
                      //       minWidth: 150, minHeight: 50), // Adjust size as needed
                      //   alignment: Alignment.center,
                      //   child: Text(
                      //     'Email',
                      //     style: TextStyle(
                      //       color: Colors.white, // Text color
                      //       fontSize: 16.0,
                      //     ),
                      //   ),
                      // ),
                    ),

                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Text("Don't have an account?  ",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500)),
                        InkWell(
                          onTap: () {
                            navigateandFinish(context, Sign_Up());
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
          ),
        ],
      ),
    );
  }
}
//Email