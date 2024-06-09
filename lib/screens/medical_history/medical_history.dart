import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medica/shared/SharedWidget.dart';
import 'package:medica/shared/styles/AppColor.dart';
import 'package:medica/screens/auth/login_auth/loginScreen.dart';
import 'package:medica/screens/auth/login_auth/cubit/loginCubit.dart';
import 'package:medica/screens/auth/login_auth/cubit/loginState.dart';
import 'package:medica/screens/medical_history/medical_testsScreen.dart';
import 'package:medica/screens/medical_history/all_prescriptionsScreen.dart';

TextEditingController _nameController = TextEditingController();
TextEditingController _descriptionController = TextEditingController();
TextEditingController _dateController = TextEditingController();
TextEditingController _weightController = TextEditingController();
TextEditingController _heightController = TextEditingController();
TextEditingController _diseaseValueController = TextEditingController();
final _formKey = GlobalKey<FormState>();

class MedicalHistoryScreen extends StatelessWidget {
  const MedicalHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(height: MediaQuery.sizeOf(context).height * 0.055),
              Container(
                decoration: const BoxDecoration(
                    color: AppColor.primaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(12))),
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
              SizedBox(height: 30),
              cardRowWidget(Icons.dashboard_customize_rounded, "Prescriptions",
                  prescriptionsScreen(), context),
              SizedBox(height: 10),
              cardRowWidget(Icons.local_hospital, "Medical tests",
                  MedicalTestsScreen(), context),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("All records of disease",
                      style: TextStyle(fontSize: 16)),
                  IconButton(onPressed: () {
                    showmodelBottonsheetWidget(context);
                  }, icon: Icon(Icons.add))
                ],
              ),
              SizedBox(
                height: 400,
                child: ListView.separated(
                    itemCount: 10,
                    separatorBuilder: (context, index) => const SizedBox(
                          height: 8,
                        ),
                    itemBuilder: (context, index) {
                      return Container(
                        //color: AppColor.primaryColor,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            color: Color.fromARGB(219, 2, 78, 154)),
                        child: ListTile(
                            title: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 40,
                                      margin: EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                          color: AppColor.whiteColor,
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      child: Center(
                                        child: Text(
                                          'name',
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelLarge!
                                              .copyWith(
                                                  color: AppColor.primaryColor,
                                                  fontSize: 14),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                          "name of disease 1hnmfjhhj jdbh ghhxfn ِللالاات تبللابس j,hf gsfugh ggs ybdg hg",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge
                                              ?.copyWith(
                                                color: AppColor.whiteColor,
                                              )),
                                    ),
                                  ],
                                ),
                                //...........................................date

                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.date_range,
                                          color: AppColor.orangcolor,
                                          size: 17,
                                        ),
                                        Text("12/3/2024",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall
                                                ?.copyWith(
                                                  color: AppColor.whiteColor,
                                                )),
                                      ],
                                    ),
                                    //..............for clock
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.alarm_rounded,
                                          color: AppColor.orangcolor,
                                          size: 17,
                                        ),
                                        Text("12.55 pm",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall
                                                ?.copyWith(
                                                  color: AppColor.whiteColor,
                                                )),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            trailing: TextButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          AppColor.orangcolor),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          12.0), // Adjust the value as needed
                                    ),
                                  ),
                                ),
                                //for showing sheet
                                onPressed: () {
                                  
                                },
                                child: Text(
                                  "Details",
                                  style: TextStyle(color: Colors.white),
                                ))),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> showmodelBottonsheetWidget(BuildContext context) {
    return showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  builder: (context) {
                                    return Padding(
                                      padding: EdgeInsets.only(
                                        bottom: MediaQuery.of(context)
                                            .viewInsets
                                            .bottom,
                                        left: 16,
                                        right: 16,
                                        top: 16,
                                        
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            'Enter Details',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(height: 16),
                                          Form(
                                            key: _formKey,
                                            child: Column(
                                              children: [
                                                TextFormField(
                                                  controller: _nameController,
                                                  decoration: InputDecoration(
                                                      labelText: 'Name'),
                                                  validator: (value) {
                                                    if (value!.isEmpty) {
                                                      return 'Please enter a name';
                                                    }
                                                    return null;
                                                  },
                                                ),
                                                TextFormField(
                                                  controller:
                                                      _descriptionController,
                                                  decoration: InputDecoration(
                                                      labelText:
                                                          'Description'),
                                                  validator: (value) {
                                                    if (value!.isEmpty) {
                                                      return 'Please enter a description';
                                                    }
                                                    return null;
                                                  },
                                                ),
                                                TextFormField(
                                                  controller: _dateController,
                                                  decoration: InputDecoration(
                                                      labelText: 'Date'),
                                                  validator: (value) {
                                                    if (value!.isEmpty) {
                                                      return 'Please enter a date';
                                                    }
                                                    return null;
                                                  },
                                                  onTap: () async {
                                                    FocusScope.of(context)
                                                        .requestFocus(
                                                            FocusNode());
                                                    DateTime? pickedDate =
                                                        await showDatePicker(
                                                      context: context,
                                                      initialDate:
                                                          DateTime.now(),
                                                      firstDate:
                                                          DateTime(2000),
                                                      lastDate:
                                                          DateTime(2101),
                                                    );
                                                    if (pickedDate != null) {
                                                      _dateController.text =
                                                          "${pickedDate.toLocal()}"
                                                              .split(' ')[0];
                                                    }
                                                  },
                                                ),
                                                TextFormField(
                                                  controller:
                                                      _weightController,
                                                  decoration: InputDecoration(
                                                      labelText: 'Weight'),
                                                  keyboardType:
                                                      TextInputType.number,
                                                  validator: (value) {
                                                    if (value!.isEmpty) {
                                                      return 'Please enter weight';
                                                    }
                                                    return null;
                                                  },
                                                ),
                                                TextFormField(
                                                  controller:
                                                      _heightController,
                                                  decoration: InputDecoration(
                                                      labelText: 'Height'),
                                                  keyboardType:
                                                      TextInputType.number,
                                                  validator: (value) {
                                                    if (value!.isEmpty) {
                                                      return 'Please enter height';
                                                    }
                                                    return null;
                                                  },
                                                ),
                                                TextFormField(
                                                  controller:
                                                      _diseaseValueController,
                                                  decoration: InputDecoration(
                                                      labelText:
                                                          'Value of Disease'),
                                                  keyboardType:
                                                      TextInputType.number,
                                                  validator: (value) {
                                                    if (value!.isEmpty) {
                                                      return 'Please enter value of disease';
                                                    }
                                                    return null;
                                                  },
                                                ),
                                                SizedBox(height: 20),
                                                ElevatedButton(
                                                  onPressed: () {
                                                    if (_formKey.currentState!
                                                        .validate()) {
                                                      // Process data
                                                      Navigator.pop(context);
                                                    }
                                                  },
                                                  child: Text('Submit'),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
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
        borderRadius: BorderRadius.all(Radius.circular(8))),
    height: MediaQuery.sizeOf(context).height * 0.075,
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
          },
        ),
      ],
    ),
  );
}



/**
 * 
 
  Row(
                                          children: [
                                            const Icon(
                                              Icons.timer_outlined,
                                              size: 22,
                                              weight: 30,
                                            ),
                                            Container(
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.034,
                                              decoration: const BoxDecoration(
                                                  color: Color.fromARGB(
                                                      157,
                                                      141,
                                                      192,
                                                      240), // Color.fromARGB( 255, 233, 206, 232),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(4),
                                                  )),
                                              child: Center(
                                                child: Text(
                                                  '${convertDateTime(cubit.myReservationsList?[index].time)['time']}',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .labelLarge!
                                                      .copyWith(
                                                          color: AppColor
                                                              .primaryColor,
                                                          fontSize: 14),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
 
 
 
 
 
 
 
 
 
 
 
 
 Container(
                            height: 300,
                            width: MediaQuery.sizeOf(context).width * .96,
                            decoration: BoxDecoration(
                                color: Colors
                                    .white, // Color.fromARGB(242, 208, 236, 233),

                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Divider(
                                        color: Colors.grey,
                                      ),
                                      Text("data"),
                                      Container(
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.034,
                                        decoration: const BoxDecoration(
                                            color: Color.fromARGB(157, 141, 192,
                                                240), // Color.fromARGB( 255, 233, 206, 232),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(4),
                                            )),
                                        child: Center(
                                          child: Text(
                                            "name disease ",
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelLarge!
                                                .copyWith(
                                                    color:
                                                        AppColor.primaryColor,
                                                    fontSize: 14),
                                          ),
                                        ),
                                      ),
                                      Text("Description"),
                                     
                                      Container(
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.034,
                                        decoration: const BoxDecoration(
                                            color: Color.fromARGB(157, 141, 192,
                                                240), // Color.fromARGB( 255, 233, 206, 232),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(4),
                                            )),
                                        child: Center(
                                          child: Text(
                                            "Description disease ",
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelLarge!
                                                .copyWith(
                                                    color:
                                                        AppColor.primaryColor,
                                                    fontSize: 14),
                                          ),
                                        ),
                                      ),
                                      SafeArea(child: Text("Descriptiobdfhhbbbbbb\nnxbxhbbbbbb\n hghhfbnbfb\n")),
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.calendar_month,
                                                  size: 23,
                                                ),
                                                Container(
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.034,
                                                  decoration:
                                                      const BoxDecoration(
                                                          color: Color.fromARGB(
                                                              255,
                                                              233,
                                                              206,
                                                              232),
                                                          borderRadius:
                                                              BorderRadius.all(
                                                            Radius.circular(4),
                                                          )),
                                                  child: Center(
                                                    child: Text(
                                                      "12/8/2023",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .labelLarge!
                                                          .copyWith(
                                                              color:
                                                                  AppColor.bink,
                                                              fontSize: 14),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(children: [
                                              const Icon(
                                                Icons.timer_outlined,
                                                size: 22,
                                                weight: 30,
                                              ),
                                              Container(
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.034,
                                                decoration: const BoxDecoration(
                                                    color: Color.fromARGB(
                                                        157,
                                                        141,
                                                        192,
                                                        240), // Color.fromARGB( 255, 233, 206, 232),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(4),
                                                    )),
                                                child: Center(
                                                  child: Text(
                                                    "xx",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .labelLarge!
                                                        .copyWith(
                                                            color: AppColor
                                                                .primaryColor,
                                                            fontSize: 14),
                                                  ),
                                                ),
                                              )
                                            ])
                                          ])
                                    ]))),
 */