import '../screens/login/login.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/shared/network/local/sharedPref.dart';


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

logout(context) {
  return TextButton(
    child: Text('logout'),
    onPressed: () {
      //    Text(CachHelper.getdata(key: 'token',),style: TextStyle(color: Colors.black45),);
      CachHelper.removeKey(key: 'token');
      navigateandFinish(context, Login());
    },
  );
}
