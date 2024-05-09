import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:medica/ReservationScreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medica/models/clinicModel.dart';
import 'package:medica/shared/cubit/Cubit.dart';
import 'package:medica/shared/cubit/State.dart';
import 'package:medica/shared/SharedWidget.dart';
import 'package:medica/shared/styles/AppColor.dart';
import 'package:medica/screens/reservation/ticketScreen.dart';
import 'package:medica/screens/home/AllclinicsOfDepartment.dart';
import 'package:medica/screens/details_screen/details_clinics.dart';
import 'package:medica/screens/details_screen/details_clinics.dart';

class Home_Screen extends StatelessWidget {
  const Home_Screen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    AppCubit cubit = AppCubit.get(context);
    return BlocConsumer<AppCubit, AppState>(listener: (context, state) {
      if (state is GetAllDepartmentSuccessState) {}
      if (state is GetAllClinicsSuccessState) {
        print(cubit.allClinicslist?[0]);
      }
    }, builder: (context, state) {
      return Scaffold(
          backgroundColor: AppColor.whiteColor,
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Hello! Alex",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                CircleAvatar(
                  radius: 25,
                  backgroundImage:
                      AssetImage("assets/images/home-Images/baby.jpg"),
                ),
              ],
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  //...........start of search container ....................
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: AppColor.primaryColor,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 6,
                                spreadRadius: 4,
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.search,
                                  color: AppColor.primaryColor,
                                  size: 35,
                                ),
                              ),
                              SizedBox(height: 30),
                              Text(
                                "Search \nfor any clinics",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "explore any clinic now",
                                style: TextStyle(
                                  color: Colors.white54,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      //......................................end of search container
                      InkWell(
                        onTap: () {
                          navigateToScreen(context, TicketScreen());
                        },
                        child: Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 6,
                                spreadRadius: 4,
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 238, 241, 250),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Iconsax.tick_circle,
                                  color: AppColor.primaryColor,
                                  size: 35,
                                ),
                              ),
                              SizedBox(height: 30),
                              Text(
                                "Visit your \nreservation",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "see all reservation",
                                style: TextStyle(
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      "Departments",
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromARGB(183, 0, 0, 0),
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
                        child: departementWidget(
                            index,
                            cubit.alldepartmentslist?[index].name,
                            cubit.alldepartmentslist?[index].id,
                            context,
                            cubit),
                      ),
                      itemCount: cubit.alldepartmentslist?.length,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                  SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      "Popular Clinics",
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromARGB(183, 0, 0, 0),
                      ),
                    ),
                  ),
                  state is GetAllClinicsLoadingState
                      ? Center(child: CircularProgressIndicator())
                      : GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                          itemCount: cubit.allClinicslist?.length ?? 0,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailsScreen(cubit.allClinicslist?[index]),
                                    ));
                              },
                              child: Container(
                                margin: EdgeInsets.all(10),
                                padding: EdgeInsets.symmetric(vertical: 15),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  // boxShadow: [
                                  //   BoxShadow(
                                  //     color: Colors.black12,
                                  //     blurRadius: 4,
                                  //     spreadRadius: 2,
                                  //   ),
                                  // ],
                                  border: Border.all(
                                    color: const Color.fromARGB(35, 2, 78,
                                        154), // Specify the border color here
                                    width: 1, // Specify the border width here
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    CircleAvatar(
                                      radius: 35,
                                      backgroundImage: AssetImage(
                                          "assets/images/home-Images/baby.jpg"),
                                    ),
                                    Text(
                                      cubit.allClinicslist?[index].name
                                              .toString() ??
                                          "clinics name",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black54,
                                      ),
                                    ),
                                    Text(
                                      cubit.allClinicslist?[index].department ??
                                          "department",
                                      style: TextStyle(
                                        color: Colors.black45,
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.attach_money_outlined,
                                          color: Colors.amber,
                                        ),
                                        Text(
                                          "${cubit.allClinicslist?[index].placePrices ?? "24"} EGP",
                                          style: TextStyle(
                                            color: Colors.black45,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                ],
              ),
            ),
          ));
      // Column(
      //   children: [
      //     Container(
      //       height: MediaQuery.of(context).size.height * 0.25,
      //       width: MediaQuery.of(context).size.width,
      //       color: AppColor.primaryColor,
      //       child: Padding(
      //         padding: EdgeInsets.all(12),
      //         child: Column(
      //           mainAxisAlignment: MainAxisAlignment.start,
      //           children: [
      //             Expanded(
      //               child: Row(
      //                 children: [
      //                   const CircleAvatar(
      //                     backgroundImage: AssetImage(
      //                         'assets/images/onboarding/logo.png'),
      //                     radius: 30,
      //                   ),
      //                   const SizedBox(width: 16),
      //                   const Text(
      //                     'John Doe',
      //                     style: TextStyle(
      //                         color: Colors.white, fontSize: 20),
      //                   ),
      //                   const Spacer(),
      //                   IconButton(
      //                     onPressed: () {},
      //                     icon: const Icon(
      //                       Iconsax.notification,
      //                       color: AppColor.whiteColor,
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //             Container(
      //               height: 53,
      //               decoration: BoxDecoration(
      //                 border: Border.all(
      //                   color: AppColor.whiteColor, // Border color
      //                   width: 0.8,
      //                 ),
      //                 borderRadius:
      //                     const BorderRadius.all(Radius.circular(12)),
      //               ),
      //               child: const TextField(
      //                 decoration: InputDecoration(
      //                   prefixIcon: Icon(Iconsax.search_normal),
      //                   border: InputBorder.none,
      //                   hintText: 'search doctor....',
      //                   hintStyle: TextStyle(
      //                     color: AppColor.whiteColor,
      //                     fontWeight: FontWeight.w300,
      //                   ),
      //                   prefixIconColor: AppColor.whiteColor,
      //                 ),
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //     ),
      //     Expanded(
      //       child: SingleChildScrollView(
      //         scrollDirection: Axis.vertical,
      //         child: Column(
      //           mainAxisAlignment: MainAxisAlignment.start,
      //           children: [
      //             Align(
      //               alignment: Alignment.topLeft,
      //               child: const Text(
      //                 "   Department",
      //                 style: TextStyle(
      //                   fontSize: 16,
      //                   fontWeight: FontWeight.bold,
      //                 ),
      //               ),
      //             ),
      //             SizedBox(height: 5),
      //             Container(
      //               height: 45,
      //               width: double.infinity,
      //               child: ListView.builder(
      //                 itemBuilder: (context, index) => Padding(
      //                   padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
      //                   child: departementWidget(index,cubit.alldepartmentslist?[index].name,cubit.alldepartmentslist?[index].id,context,cubit),
      //                 ),
      //                 itemCount: cubit.alldepartmentslist?.length,
      //                 scrollDirection: Axis.horizontal,
      //               ),
      //             ),

      //             SizedBox(height: 10),
      //             TitleListWidget('  Clinics'),
      //             Container(
      //               height: MediaQuery.of(context).size.height * 0.26,
      //               width: double.infinity,
      //               child: ListView.builder(
      //                 itemBuilder: (context, index) => Padding(
      //                   padding: EdgeInsets.all(10),
      //                   child: myClinicCard(context, DetailsScreen()),
      //                 ),
      //                 itemCount: 10,
      //                 scrollDirection: Axis.horizontal,
      //               ),
      //             ),
      //             TitleListWidget('   Radiology'),
      //             Container(
      //               height: MediaQuery.of(context).size.height * 0.26,
      //               width: double.infinity,
      //               child: ListView.builder(
      //                 itemBuilder: (context, index) => Padding(
      //                   padding: EdgeInsets.all(10),
      //                   child: myClinicCard(context, DetailsScreen()),
      //                 ),
      //                 itemCount: 10,
      //                 scrollDirection: Axis.horizontal,
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
    });
  }
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

InkWell departementWidget(
    int index, String? name, int? id, var context, AppCubit cubit) {
  return InkWell(
    onTap: () {
      cubit.currentDepartment(index);
      navigateToScreen(
          context,
          departmentClinicsScreen(
            DepertmentId: id,
            DepertmentName: name,
          ));
    },
    child: Container(
      width: 150,
      decoration: BoxDecoration(
        color: cubit.indxSelected == index
            ? AppColor.orangcolor
            : AppColor.primaryColor, //Color.fromARGB(213, 90, 138, 192),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Center(
        child: Text(
          name ?? "",
          style: TextStyle(color: AppColor.whiteColor
              // : Color.fromARGB(171, 56, 55, 55),
              ),
        ),
      ),
    ),
  );
}

Material myClinicCard(BuildContext context, ScreenName) {
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
                detailsButtoncustom(context, ScreenName),
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

List symptoms = [
  "Temperature",
  "Snuffle",
  "Fever",
  "Cough",
  "Cold",
];
