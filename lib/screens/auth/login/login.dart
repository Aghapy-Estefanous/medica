import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';

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
      body: SafeArea(
        minimum: EdgeInsets.all(10),
        child: Container(
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
            Text(
              'Login',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(217, 217, 217, 0.27),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: const TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email_outlined),
                    border: InputBorder.none,
                    hintText: 'E-mail'),
              ),
            ),
            const SizedBox(
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
                    icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility),
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
              onTap: () {},
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                // Handle button tap
              },
              child: Ink(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(250, 147, 13, 0.527),
                      Color.fromRGBO(250, 147, 13, 1),
                    ], // Define multiple colors for gradient
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(
                      10.0), // Adjust border radius as needed
                ),
                child: Container(
                  constraints: BoxConstraints(
                      minWidth: 150, minHeight: 50), // Adjust size as needed
                  alignment: Alignment.center,
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white, // Text color
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            ),

            // Row(
            //   children: [
            //     Expanded(
            //       child: TextButton(
            //         onPressed: () {},
            //         child: Text(
            //           'Login',
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
                Text("Don't have an account?  ",
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
                InkWell(
                  onTap: () {},
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
    );
  }
}
//login