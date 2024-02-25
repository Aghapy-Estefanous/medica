import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:medica/shared/styles/AppColor.dart';

class Home_Screen extends StatelessWidget {
  const Home_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height * 0.25,
            width: MediaQuery.sizeOf(context).width,
            color: AppColor.primaryColor,
            // padding: EdgeInsets.all(16),
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        const CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/onboarding/logo.png'),
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
                            ))
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
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12))),
                    child: const TextField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(Iconsax.search_normal),
                          border: InputBorder.none,
                          hintText: 'search doctor....',
                          hintStyle: TextStyle(
                            color: AppColor.whiteColor,
                            fontWeight: FontWeight.w300,
                          ),
                          prefixIconColor: AppColor.whiteColor),
                    ),
                  ),
                ],
              ),
            ),
          ),

          //scrolling body
          Expanded(
            child: ListView(
              children: [
                const Text(
                  "  Departement",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                Container(
                  height: 45,
                  width: double.infinity,
                  child: ListView.builder(
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                      child: departement_widget(index),
                    ),
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                SizedBox(height: 10,),
                Title_ListWidget(' Clinics'),
                Container(
                  height: 210,
                  width: double.infinity,
                  child: ListView.builder(
                    itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.all(10),
                      child: MyClinicCard(context),
                    ),
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                Title_ListWidget(' Radiology'),
                Container(
                  height: MediaQuery.sizeOf(context).height * 0.26,
                  width: double.infinity,
                  child: ListView.builder(
                    itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.all(10),
                      child: MyClinicCard(context),
                    ),
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ],
            ),
          )
          //.........................
        ],
      ),
    );
  }

  Row Title_ListWidget(String title) {
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
                    color: AppColor.primaryColor),
              ),
            ),
          ],
        )
      ],
    );
  }

  Container departement_widget(int index) {
    return Container(
        width: 150,
        decoration: BoxDecoration(
            color: index == 0 ? AppColor.orangcolor : Color(0xFFF5F5FF),
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Center(
            child: Text(
          "departementddd12",
          style: TextStyle(
              color: index == 0
                  ? AppColor.whiteColor
                  : Color.fromARGB(171, 56, 55, 55)),
        )));
  }

  Material MyClinicCard(BuildContext context) {
    return Material(
      elevation: 1,
      shadowColor: Color.fromARGB(134, 21, 21, 21),
      borderRadius: BorderRadius.all(Radius.circular(12)),
      child: Container(
          decoration: const BoxDecoration(
              //color: Colors.amberAccent,
              borderRadius: BorderRadius.all(Radius.circular(12))),
          height: MediaQuery.sizeOf(context).height * 0.22,
          width: MediaQuery.sizeOf(context).width * 0.45,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.sizeOf(context).height * 0.129,
                width: MediaQuery.sizeOf(context).width * 0.45,
                child: Image.asset(
                  'assets/images/home-Images/baby.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.001,
              ),
              //check for size
              const Text(
                "  baby clinic",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.015,
              ),
              //Rowwwwwwww
              Positioned(
                 bottom: 5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            12.0), // Adjust the radius as needed
                      ),
                      minWidth: 50.0,
                      height: 25,
                      color: AppColor.orangcolor,
                      child: const Text(' details ',
                          style:
                              TextStyle(fontSize: 13.0, color: Colors.white)),
                      onPressed: () {},
                    ),
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.,
                      children: [
                        Icon(
                          Icons.person,
                          size: 20,
                          color: AppColor.orangcolor,
                        ),
                        Text('1462')
                      ],
                    )
                  ],
                ),
              ),
            ], //Rowwwwwwwwwwwwwwwwwwwwwww
          )),
    );
  }
}
