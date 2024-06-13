import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medica/shared/cubit/Cubit.dart';
import 'package:medica/shared/cubit/State.dart';
import 'package:medica/shared/SharedWidget.dart';
import 'package:medica/models/basicDtataModel.dart';
import 'package:medica/shared/styles/AppColor.dart';
import 'package:medica/models/AllDiseasesModel.dart';
import 'package:medica/screens/medical_history/disease_details.dart';
import 'package:medica/screens/medical_history/medical_testsScreen.dart';
import 'package:medica/screens/medical_history/all_prescriptionsScreen.dart';

TextEditingController _typeController = TextEditingController();
TextEditingController _descriptionController = TextEditingController();
TextEditingController _dateController = TextEditingController();
TextEditingController _weightController = TextEditingController();
TextEditingController _heightController = TextEditingController();
TextEditingController _diseaseValueController = TextEditingController();
TextEditingController _Diagnosis = TextEditingController();
String? selectedDisease;
final _formKey = GlobalKey<FormState>();
var pickedFile;

class MedicalHistoryScreen extends StatelessWidget {
  const MedicalHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppCubit cubit = AppCubit.get(context);
    late BasicDataModel baisdataModelData = BasicDataModel();
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        // if (state is YourCubitFilePicked) {
        //   pickedFile = state.file;
        // }
        if (state is getBasicDataSuccess) {
          baisdataModelData = state.model;
        }
      },
      builder: (context, state) {
        var modelbasic = baisdataModelData.data;
        print(modelbasic);
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(height: MediaQuery.sizeOf(context).height * 0.055),
                  modelbasic == null
                      ? CircularProgressIndicator()
                      : Container(
                          decoration: const BoxDecoration(
                              color: AppColor.primaryColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
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
                                      modelbasic.firstName ?? "No name",
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      modelbasic.age.toString(),
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
                  modelbasic == null
                      ? CircularProgressIndicator()
                      : Container(
                          height: MediaQuery.of(context).size.height * 0.08,
                          child: Center(
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                presonalDataComponent(
                                    "Blood",
                                    modelbasic.bloodType.toString(),
                                    Icons.bloodtype_outlined),
                                SizedBox(width: 10),
                                Container(
                                  width: 2, // Thickness of the line
                                  height: 10, // Height of the line
                                  color: Color.fromARGB(255, 197, 191, 191),
                                ),
                                presonalDataComponent(
                                    "Height", "178", Icons.height),
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
                                presonalDataComponent("Pressure", "178",
                                    Icons.favorite_border_outlined),
                              ],
                            ),
                          ),
                        ),
                  //🟢🟢🟢🟢🟢🟢🟢🟢🟢🟢................... prescrpition &tests..............🟢🟢🟢🟢🟢🟢......
                  SizedBox(height: 30),
                  cardRowWidget(Icons.dashboard_customize_rounded,
                      "Prescriptions", prescriptionsScreen(), context),
                  SizedBox(height: 10),
                  cardRowWidget(Icons.local_hospital, "Medical tests",
                      MedicalTestsScreen(), context),
                  SizedBox(height: 10),
                  //.🟢🟢🟢🟢🟢🟢🟢🟢🟢🟢................... showing Bottonnsheet..............🟢🟢🟢🟢🟢🟢......
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("All records of disease",
                          style: TextStyle(fontSize: 16)),
                      IconButton(
                          onPressed: () {
                            showmodelBottonsheetWidget(context, cubit);
                          },
                          icon: CircleAvatar(
                            backgroundColor:
                                const Color.fromARGB(82, 255, 153, 0)
                                    .withOpacity(0.9),
                            child: Icon(Icons.add,
                                color: AppColor.whiteColor, size: 20),
                          ))
                    ],
                  ),
                  //🟢🟢🟢🟢🟢🟢🟢🟢🟢🟢................... All records of disease..............🟢🟢🟢🟢🟢🟢......
                  cubit.AllUserDiseasesList.isEmpty==true ?  SizedBox(
                    height: 250,
                    child:Image.asset('assets/images/ilustrations/nodata.jpg'),):
                  SizedBox(
                    height: 400,
                    child: ListView.separated(
                        itemCount: cubit.AllUserDiseasesList.length,
                        separatorBuilder: (context, index) => const SizedBox(
                              height: 8,
                            ),
                        itemBuilder: (context, index) {
                          return Container(
                            //color: AppColor.primaryColor,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                                color: Color.fromARGB(219, 2, 78, 154)),
                            child: ListTile(
                                title: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        //❌❌❌delete if u not use🟢🟢🟢🟢🟢🟢🟢🟢🟢................... All records of disease..............🟢🟢🟢🟢🟢🟢......
                                        // Container(
                                        //   width: 40,
                                        //   margin: EdgeInsets.all(12),
                                        //   decoration: BoxDecoration(
                                        //       color: AppColor.whiteColor,
                                        //       borderRadius:
                                        //           BorderRadius.circular(4)),
                                        //   child: Center(
                                        //     child: Text(
                                        //       'name',
                                        //       style: Theme.of(context)
                                        //           .textTheme
                                        //           .labelLarge!
                                        //           .copyWith(
                                        //               color:
                                        //                   AppColor.primaryColor,
                                        //               fontSize: 14),
                                        //     ),
                                        //   ),
                                        // ),

                                        Expanded(
                                          child: Text(
                                              cubit.AllUserDiseasesList[index]
                                                      .diseaseName ??
                                                  "no name",
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
                                            Text(
                                                '${convertDateTime(cubit.AllUserDiseasesList[index].diagnosisDate)['date']}' ??
                                                    "no time",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall
                                                    ?.copyWith(
                                                      color:
                                                          AppColor.whiteColor,
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
                                                      color:
                                                          AppColor.whiteColor,
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
                                        DiseaseDetailsScreen(diseaseData: cubit.AllUserDiseasesList[index],);
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
      },
    );
  }

  Future<dynamic> showmodelBottonsheetWidget(
    BuildContext context,
    AppCubit cubit,
  ) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 16,
            right: 16,
            top: 16,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Enter Details',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _typeController,
                        decoration: InputDecoration(labelText: 'type'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a type personal or family';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _descriptionController,
                        decoration: InputDecoration(labelText: 'Description'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a description';
                          }
                          return null;
                        },
                      ),
                      // .................list of diseases................
                      DropdownButtonFormField<singleDiseasObjectData>(
                        value: cubit.SelectedDisease,
                        onChanged: (newValue) {
                          cubit.currentDiseaseObject(newValue!);
                        },
                        validator: (singleDiseasObjectData? value) {
                          if (value == null) {
                            return 'choose type of disease';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          labelText: 'type of disease',
                        ),
                        items: cubit.ALLDiseasesList.map(
                            (singleDiseasObjectData diseaseObject) {
                          return DropdownMenuItem<singleDiseasObjectData>(
                            value: diseaseObject,
                            child: Text(diseaseObject.name.toString()),
                          );
                        }).toList(),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      //.........................Diagnosis
                      TextFormField(
                        controller: _Diagnosis,
                        decoration: InputDecoration(labelText: 'Description'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a description';
                          }
                          return null;
                        },
                      ),
                      //.........................date time
                      TextFormField(
                        controller: _dateController,
                        decoration: InputDecoration(labelText: 'Date'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a date';
                          }
                          return null;
                        },
                        onTap: () async {
                          FocusScope.of(context).requestFocus(FocusNode());
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101),
                          );
                          if (pickedDate != null) {
                            _dateController.text =
                                "${pickedDate.toLocal()}".split(' ')[0];
                          }
                        },
                      ),
                      TextFormField(
                        controller: _weightController,
                        decoration: InputDecoration(labelText: 'Weight'),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter weight';
                          }
                          if (double.tryParse(value) == null) {
                            return 'Please enter a valid number';
                          }

                          return null;
                        },
                      ),
                      //..................................height
                      TextFormField(
                        controller: _heightController,
                        decoration: InputDecoration(labelText: 'Height'),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter height';
                          }
                          if (double.tryParse(value) == null) {
                            return 'Please enter a valid number';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _diseaseValueController,
                        decoration:
                            InputDecoration(labelText: 'Value of Disease'),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter the value of the disease';
                          }
                          if (double.tryParse(value) == null) {
                            return 'Please enter a valid number';
                          }
                          return null;
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              'upload image',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                // cubit.pickFile2();
                              },
                              icon: Icon(
                                Iconsax.document_upload,
                                color: AppColor.primaryColor,
                              ))
                        ],
                      ), 
                      // SizedBox(height: 20),
                      // cubit.imagePathFromgallary == null
                      //     ? Text('No image selected.')
                      //     : Text('${cubit.imagePathFromgallary!.name}'),

                      SizedBox(height: 20),
                      TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
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
                          onPressed: () async {
                            // print(cubit.pickedFile!.files.first.path);
                            // if (_formKey.currentState!.validate()) {
                            //   double height =
                            //       double.parse(_heightController.text);
                            //   double weight =
                            //       double.parse(_weightController.text);
                            //   double valueResult =
                            //       double.parse(_diseaseValueController.text);
                            //   //post data
                            //   await cubit.PostDiseases(
                            //     _typeController.text,
                            //     valueResult,
                            //     _descriptionController.text,
                            //     height,
                            //     weight,
                            //     "22222222222222", // Hardcoded user ID for demonstration
                            //     cubit.SelectedDisease?.id,
                            //     _Diagnosis.text,
                            //     DateTime.now(),
                            //     cubit.pickedFile,
                            //   );
                            // }
                          },
                          child: Text(
                            "submit",
                            style: TextStyle(color: Colors.white),
                          )),
                      SizedBox(height: 5),
                    ],
                  ),
                ),
              ],
            ),
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

List<String> ListOfDiseases = [
  "d1",
  "d2",
  "d3",
];

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
