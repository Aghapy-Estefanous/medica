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
