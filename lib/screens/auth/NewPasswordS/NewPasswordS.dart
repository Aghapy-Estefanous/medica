import 'package:flutter/material.dart';
import 'package:medica/screens/auth/loginS/loginS.dart';
import 'package:medica/screens/home/home_screen.dart';
import 'package:medica/shared/SharedWidget.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
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
                          hintText: 'New Password',
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
                          hintText: 'Confirm New Password',
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
                                navigateandFinish(context, Login());
                              },
                              child: Text(
                                'Confirm',
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
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
