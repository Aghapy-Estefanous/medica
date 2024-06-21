import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medica/models/clinicModel.dart';
import 'package:medica/shared/cubit/Cubit.dart';
import 'package:medica/shared/cubit/State.dart';
import 'package:medica/models/ProfileModel.dart';
import 'package:medica/shared/SharedWidget.dart';
import 'package:medica/screens/connections.dart';
import 'package:medica/shared/styles/AppColor.dart';
import 'package:medica/models/reservationModel.dart';
import 'package:medica/screens/home/searchScreen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:medica/screens/reservation/ticketScreen.dart';
import 'package:medica/screens/home/AllclinicsOfDepartment.dart';
import 'package:medica/screens/details_screen/details_clinics.dart';
import 'package:medica/screens/auth/Profile/cubit/profile_cubit.dart';

class Home_Screen extends StatelessWidget {
  const Home_Screen({Key? key}) : super(key: key);

  Future<String> getname() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString('name') ?? 'User';
  }

  @override
  Widget build(BuildContext context) {
    AppCubit cubit = AppCubit.get(context);

    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        if (state is GetAllDepartmentErrorState) {
         print(" error from home no iternet almafrood 🔥${state.error}");
        }

        if (state is GetAllClinicsSuccessState) {
          print(cubit.allClinicslist?[0]);
        }
      },
      builder: (context, state) {
        
        return  state is GetAllDepartmentErrorState?
         
        NoInternetScreen(message_error: state.error,):
        
          Scaffold(
          backgroundColor: AppColor.whiteColor,
          appBar: AppBar(
            title: FutureBuilder<String>(
              future: getname(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text("hello".tr());
                } else if (snapshot.hasError) {
                  return Text("hello".tr());
                } else {
                  return Text(
                    "${"hello".tr()} ${snapshot.data}",
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.06,
                      fontWeight: FontWeight.w500,
                    ),
                  );
                }
              },
            ),
            actions: [
              CircleAvatar(
                radius: 25,
                backgroundImage:
                    AssetImage("assets/images/home-Images/baby.jpg"),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      if (context.locale.toString() == 'en') {
                        context.setLocale(const Locale('ar'));
                      } else {
                        context.setLocale(const Locale('en'));
                      }
                    },
                    icon: Icon(Icons.language),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          navigateToScreen(context, Search_Screen());
                        },
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 0.45,
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
                                width: MediaQuery.sizeOf(context).width * 0.45,
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
                                "search_clinics".tr(),
                                style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.width * 0.045,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "explore_clinics".tr(),
                                style: TextStyle(
                                  color: Colors.white54,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          cubit.getAllReservation();
                          print("list reservation🍓🍓 is ${cubit.myReservationsList}");
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
                                "visit_reservation".tr(),
                                style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.width * 0.045,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "see_reservation".tr(),
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: MediaQuery.of(context).size.width * 0.040,
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
                      "departments".tr(),
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.06,
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
                      "popular_clinics".tr(),
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.06,
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
                            return Container(
                              width: MediaQuery.of(context).size.width *
                                  0.4, // Adjust width
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailsScreen(
                                          cubit.allClinicslist?[index]),
                                    ),
                                  );
                                },
                                child: Container(
                                  margin: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color:
                                          const Color.fromARGB(35, 2, 78, 154),
                                      width: 1,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      CircleAvatar(
                                        radius:
                                            MediaQuery.of(context).size.width *
                                                0.1, // Adjust radius
                                        backgroundImage: AssetImage(
                                            "assets/images/home-Images/baby.jpg"),
                                      ),
                                      Text(
                                        cubit.allClinicslist?[index].name
                                                .toString() ??
                                            "clinics name",
                                        style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.04, // Adjust font size
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black54,
                                        ),
                                      ),
                                      Text(
                                        cubit.allClinicslist?[index]
                                                .description ??
                                            "department..........................................gsaggghvcvggvcgcgvvvbvv xvvvvx gvv gvg ggv gbxvsgg gxgv",
                                        style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.035, // Adjust font size
                                          color: Colors.black45,
                                        ),
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
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
                                            "${cubit.allClinicslist?[index].price ?? "24"} EGP",
                                            style: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.035, // Adjust font size
                                              color: Colors.black45,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

InkWell departementWidget(
    int index, String? name, int? id, var context, AppCubit cubit) {
  return InkWell(
    onTap: () {
      cubit.currentDepartment(index);
      navigateToScreen(
          context,
          departmentClinicsScreen(
              DepertmentId: id, DepertmentName: name, cubit: cubit));
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

