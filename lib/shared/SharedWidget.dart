import 'package:flutter/material.dart';
import 'package:medica/shared/styles/AppColor.dart';

//   from .......> to
void navigateToScreen(context, ScreenName) {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ScreenName,
      ));
}

void navigateandFinish(context, ScreenName) {
  Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ScreenName,
      ));
}

dynamic showtoast({required context, required String Message, required color}) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: color,
      content: Text(
        Message,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontSize: 17, fontWeight: FontWeight.w500, color: Colors.white),
      )));
}
Widget detailsButtoncustom(BuildContext context, ScreenName) {
    return MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  minWidth: 40.0,
                  height: 25,
                  color: AppColor.orangcolor,
                  child: const Text(
                    ' details ',
                    style: TextStyle(fontSize: 13.0, color: Colors.white),
                  ),
                  onPressed: () {
                    navigateToScreen(context, ScreenName);
                  },
                );
  }


// logout(context) {
//   return TextButton(
//     child: Text('logout'),
//     onPressed: () {
//       //    Text(CachHelper.getdata(key: 'token',),style: TextStyle(color: Colors.black45),);
//       CachHelper.removeKey(key: 'token');
//       navigateandFinish(context, Login());
//     },
//   );
// }

AppBar MyAppBarWidget(BuildContext context, String title) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    titleSpacing: 10.0,
    centerTitle: true,
    leading: InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: const Icon(
        Icons.arrow_back_ios,
        color: AppColor.primaryColor,
      ),
    ),
    title: Text(
      title,
      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
    ),
  );
}

Center mySubmitButton(
    void Function() buttonFunction, String? buttontitle, context) {
  return Center(
    child: Container(
      height: 45,
      width: MediaQuery.sizeOf(context).width * 0.95,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color.fromRGBO(250, 191, 113, 1),
            Color.fromRGBO(250, 147, 13, 1),
          ], // Define multiple colors for gradient
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius:
            BorderRadius.circular(10.0), // Adjust border radius as needed
      ),
      child: Row(
        children: [
          Expanded(
            child: TextButton(
              onPressed: buttonFunction,
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              child: Text(
                "$buttontitle",
                //  'Login',
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Validate_password(value) {
  String errmess = 'Password must have at least:\n';
  bool t = false;
  if (value == null || value.isEmpty) {
    return 'Please enter your password';
  } else {
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      t = true;
      errmess += 'one uppercase letter \n';
    }
    if (!RegExp(r'[a-z]').hasMatch(value)) {
      t = true;

      errmess += 'one lowercase letter \n';
    }
    if (!RegExp(r'\d').hasMatch(value)) {
      t = true;
      errmess += 'one digit \n';
    }
    if (!RegExp(r'[^\w\d]').hasMatch(value)) {
      t = true;
      errmess += 'special char like(@,#,/,*,.....)\n';
    }
    if (value.length < 6) {
      t = true;
      errmess += '6 char length \n';
    }
    return t == true ? errmess.trimRight() : null;
  }
}
