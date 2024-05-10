import 'package:flutter/material.dart';
import 'package:medica/shared/SharedWidget.dart';
import 'package:medica/shared/styles/AppColor.dart';
import 'package:medica/screens/medical_history/medical_testsScreen.dart';
import 'package:medica/screens/medical_history/all_prescriptionsScreen.dart';

class MedicalHistoryScreen extends StatelessWidget {
  const MedicalHistoryScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(height: MediaQuery.sizeOf(context).height*0.055 ),
              Container(
                decoration: const BoxDecoration(
                     color: AppColor.primaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(12))
                ),
                padding: EdgeInsets.all(12),
             
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.amber,
                      backgroundImage: NetworkImage(
                          'https://static.vecteezy.com/system/resources/thumbnails/020/926/555/small/young-man-portrait-photo.jpg'),
                    ),
                    SizedBox(width: 5),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "mohamed Abeltwaap  mahmoud",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Age: 22',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),
              
              Container(
                height: MediaQuery.of(context).size.height * 0.08,
                child: Center(
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      presonalDataComponent(
                          "Blood", "A+", Icons.bloodtype_outlined),
                      SizedBox(width: 10),
                      Container(
                        width: 2, // Thickness of the line
                        height: 10, // Height of the line
                        color: Color.fromARGB(255, 197, 191, 191),
                      ),
                      presonalDataComponent("Height", "178", Icons.height),
                      SizedBox(width: 10),
                      Container(
                        width: 2, // Thickness of the line
                        height: 20, // Height of the line
                        color: Color.fromARGB(255, 197, 191, 191),
                      ),
                      SizedBox(width: 3),
                      presonalDataComponent(
                          "Weight", "78", Icons.accessibility),
                      SizedBox(width: 10),
                      Container(
                        width: 2, // Thickness of the line
                        height: 20, // Height of the line
                        color: Color.fromARGB(255, 197, 191, 191),
                      ),
                      SizedBox(width: 3),
                      presonalDataComponent(
                          "Pressure", "178", Icons.favorite_border_outlined),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                color: Colors.blue,
                height: MediaQuery.of(context).size.height * 0.44,
                child: Card(),
              ),
              SizedBox(height: 30),
              cardRowWidget(Icons.dashboard_customize_rounded, "Prescriptions",prescriptionsScreen(),context ),
                
              SizedBox(height: 10),
              cardRowWidget(Icons.local_hospital, "Medical tests", MedicalTestsScreen(),context )
            ],
          ),
        ),
      ),
    );
  }

  Column presonalDataComponent(
    String title,
    String dataValue,
    IconData iconData,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              iconData,
              color: AppColor.highlightColor,
              size: 16,
            ),
            SizedBox(width: 2),
            Text(
              '$title',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppColor.primaryColor,
              ),
            ),
          ],
        ),
        Text(
          '$dataValue',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color.fromARGB(255, 82, 80, 80),
          ),
        ),
      ],
    );
  }
}

Widget cardRowWidget(IconData icon, String label, dynamic ScreenName, context) {
  return Container(
    decoration: const BoxDecoration(
                     color: AppColor.primaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(8))
                ),
    height: MediaQuery.sizeOf(context).height*0.075,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SizedBox(width: 5),
            Icon(
              icon,
              size: 14,
              color: AppColor.orangcolor,
            ),
            SizedBox(width: 10),
            Text(
              label,
              style: TextStyle(fontSize: 15, color: AppColor.whiteColor),
            ),
          ],
        ),
        IconButton(
            icon: Icon(
              Icons.arrow_forward_ios,
              size: 17,
              color: AppColor.orangcolor,
            ),
            onPressed: () {
              navigateToScreen(context, ScreenName);
            }),
      ],
    ),
  );
}
