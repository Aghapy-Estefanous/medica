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
        minimum: EdgeInsets.all(8),
        child: Container(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(),
                  Image.asset('assets/images/pngfind 3.png'),
                ],
              ),
            ),
            Text(
              'Login',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(217, 217, 217, 0.27),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: TextField(
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
                    icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  ),
                  border: InputBorder.none,
                  hintText: 'password',
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
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromRGBO(250, 147, 13, 1)),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Text("Don't have an account?",
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
                InkWell(
                  child: Text(
                    'Create one .',
                    style: TextStyle(
                        color: Color.fromRGBO(250, 147, 13, 1),
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
//login