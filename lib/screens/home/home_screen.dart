import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:medica/shared/styles/AppColor.dart';

class Home_Screen extends StatelessWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.25,
            width: MediaQuery.of(context).size.width,
            color: AppColor.primaryColor,
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        const CircleAvatar(
                          backgroundImage: AssetImage('assets/images/onboarding/logo.png'),
                          radius: 30,
                        ),
                        const SizedBox(width: 16),
                        const Text(
                          'John Doe',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Iconsax.notification,
                            color: AppColor.whiteColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 53,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColor.whiteColor, // Border color
                        width: 0.8,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Iconsax.search_normal),
                        border: InputBorder.none,
                        hintText: 'search doctor....',
                        hintStyle: TextStyle(
                          color: AppColor.whiteColor,
                          fontWeight: FontWeight.w300,
                        ),
                        prefixIconColor: AppColor.whiteColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment:Alignment.topLeft,
                    child: const Text(
                      "   Department",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    height: 45,
                    width: double.infinity,
                    child: ListView.builder(
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                        child: departementWidget(index),
                      ),
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                  SizedBox(height: 10),
                  TitleListWidget('  Clinics'),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.26,
                    width: double.infinity,
                    child: ListView.builder(
                      itemBuilder: (context, index) => Padding(
                        padding: EdgeInsets.all(10),
                        child: myClinicCard(context),
                      ),
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                  TitleListWidget('   Radiology'),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.26,
                    width: double.infinity,
                    child: ListView.builder(
                      itemBuilder: (context, index) => Padding(
                        padding: EdgeInsets.all(10),
                        child: myClinicCard(context),
                      ),
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row TitleListWidget(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          ' $title',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          children: [
            Image.asset(
              'assets/images/home-Images/Vector.png',
              height: 30,
              width: 30,
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                "See all  ",
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: AppColor.primaryColor,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Container departementWidget(int index) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
        color: index == 0 ? AppColor.orangcolor : Color(0xFFF5F5FF),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Center(
        child: Text(
          "departmentddd12",
          style: TextStyle(
            color: index == 0 ? AppColor.whiteColor : Color.fromARGB(171, 56, 55, 55),
          ),
        ),
      ),
    );
  }

  Material myClinicCard(BuildContext context) {
    return Material(
      elevation: 1,
      shadowColor: Color.fromARGB(134, 21, 21, 21),
      borderRadius: BorderRadius.all(Radius.circular(12)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        height: MediaQuery.of(context).size.height * 0.22,
        width: MediaQuery.of(context).size.width * 0.45,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.129,
              width: MediaQuery.of(context).size.width * 0.45,
              child: Image.asset(
                'assets/images/home-Images/baby.jpg',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.001),
            const Text(
              "  baby clinic",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.015),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(
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
                    onPressed: () {},
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.person,
                        size: 18,
                        color: AppColor.orangcolor,
                      ),
                      Text(
                        '1462',
                        style: TextStyle(fontSize: 12),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
