import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:medica/shared/SharedWidget.dart';
import 'package:medica/shared/styles/AppColor.dart';
import 'package:medica/screens/details_screen/details_clinics.dart';

class seeAllScreen extends StatelessWidget {
  const seeAllScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBarWidget(context, "See All"),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Container(
                width: 200,
                height: 85,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/images/home-Images/xxx.jpg'), // Replace with your image asset
                    fit: BoxFit.cover,
                  ),
                  color: AppColor.brawn,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "baby clinic",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: AppColor.bink),
                      ),
                      MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        minWidth: 50.0,
                        height: 30,
                        color: AppColor.orangcolor,
                        child: const Text(
                          'details ',
                          style: TextStyle(fontSize: 13.0, color: Colors.white),
                        ),
                        onPressed: () {
                          navigateToScreen(context, Details_screen());
                        },
                      ),
                    ],
                  ),
                ),
              )),
          itemCount: 20,
        ),
      ),
    );
  }
}
/*

Material(
             color: AppColor.primaryColor,
              shadowColor: Color.fromARGB(134, 21, 21, 21),
              borderRadius: BorderRadius.all(Radius.circular(12)),
              elevation: 0.2,
              child: ListTile(
                leading:Icon(Icons.medical_information),
                title: const Text(
                  "  baby clinic",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500,color: AppColor.whiteColor),
                ),
                trailing: MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  minWidth: 50.0,
                  height: 30,
                  color: AppColor.orangcolor,
                  child: const Text(
                    ' details ',
                    style: TextStyle(fontSize: 13.0, color: Colors.white),
                  ),
                  onPressed: () {
                    navigateToScreen(context, Details_screen());
                  },
                ),
              ),
            ),
*/