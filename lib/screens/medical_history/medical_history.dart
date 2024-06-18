import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medica/shared/cubit/Cubit.dart';
import 'package:medica/shared/cubit/State.dart';
import 'package:medica/shared/SharedWidget.dart';
import 'package:medica/shared/styles/AppColor.dart';
import 'package:medica/models/AllDiseasesModel.dart';
import 'package:medica/shared/widgets/flutter_toast.dart';
import 'package:medica/screens/medical_history/disease_details.dart';
import 'package:medica/screens/medical_history/medical_testsScreen.dart';
import 'package:medica/screens/static_pages/testing/cubit/tests_cubit.dart';
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
  const MedicalHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        if (state is DiseasePhotoSelectedstate) {
          showToast(
            text: 'Image selected successfully',
            state: ToastStates.SUCCESS,
          );
        }
        if (state is GetBasicDataSuccessState) {
          // showToast(
          //   text: 'Basic data loaded successfully',
          //   state: ToastStates.SUCCESS,
          // );
        }
      },
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(height: MediaQuery.sizeOf(context).height * 0.055),
                  cubit.basicDataModel == null
                      ? const CircularProgressIndicator()
                      : Container(
                          decoration: const BoxDecoration(
                              color: AppColor.primaryColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const CircleAvatar(
                                radius: 40,
                                backgroundColor: Colors.amber,
                                backgroundImage: NetworkImage(
                                    'https://static.vecteezy.com/system/resources/thumbnails/020/926/555/small/young-man-portrait-photo.jpg'),
                              ),
                              const SizedBox(width: 5),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "name : ${cubit.basicDataModel?.data.firstName} ${cubit.basicDataModel?.data.lastName}",
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      "age : ${cubit.basicDataModel!.data.age.toString()} ",
                                      style: const TextStyle(
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
                  const SizedBox(height: 8),
                  cubit.basicDataModel == null
                      ? const CircularProgressIndicator()
                      : SizedBox(
                          height: MediaQuery.of(context).size.height * 0.08,
                          child: Center(
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                presonalDataComponent(
                                    "Blood",
                                    cubit.basicDataModel!.data.bloodType
                                        .toString(),
                                    Icons.bloodtype_outlined),
                                const SizedBox(width: 10),
                                Container(
                                  width: 2, // Thickness of the line
                                  height: 10, // Height of the line
                                  color:
                                      const Color.fromARGB(255, 197, 191, 191),
                                ),
                                presonalDataComponent(
                                    "Height",
                                    cubit.lastUserHeight.toString(),
                                    Icons.height),
                                const SizedBox(width: 10),
                                Container(
                                  width: 2, // Thickness of the line
                                  height: 20, // Height of the line
                                  color:
                                      const Color.fromARGB(255, 197, 191, 191),
                                ),
                                const SizedBox(width: 3),
                                presonalDataComponent(
                                    "Weight",
                                    cubit.lastUserWeight.toString(),
                                    Icons.accessibility),
                                const SizedBox(width: 10),
                                Container(
                                  width: 2, // Thickness of the line
                                  height: 20, // Height of the line
                                  color:
                                      const Color.fromARGB(255, 197, 191, 191),
                                ),
                                const SizedBox(width: 3),
                                presonalDataComponent("Pressure", "178",
                                    Icons.favorite_border_outlined),
                              ],
                            ),
                          ),
                        ),

                  //.🟢🟢🟢🟢🟢🟢🟢🟢🟢🟢................... prescrpition &tests..............🟢🟢🟢🟢🟢🟢......

                  const SizedBox(height: 10),
                  cardRowWidget(Icons.dashboard_customize_rounded,
                      "Prescriptions", const prescriptionsScreen(), context),
                  const SizedBox(height: 10),
                  cardRowWidget(Icons.local_hospital, "Medical tests",
                      const ResultPage2(), context),
                  const SizedBox(height: 5),
                  //.🟢🟢🟢🟢🟢🟢🟢🟢🟢🟢................... All records of disease..............🟢🟢🟢🟢🟢🟢......
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("All records of disease",
                          style: Theme.of(context).textTheme.bodyLarge),
                      IconButton(
                          onPressed: () {
                            showmodelBottonsheetWidget(context, cubit);
                          },
                          icon: CircleAvatar(
                            backgroundColor:
                                const Color.fromARGB(82, 255, 153, 0)
                                    .withOpacity(0.9),
                            child: const Icon(Icons.add,
                                color: AppColor.whiteColor, size: 20),
                          ))
                    ],
                  ),

                  //🟢🟢🟢🟢🟢🟢🟢🟢🟢🟢................... All records of disease..............🟢🟢🟢🟢🟢🟢......
                  cubit.AllUserDiseasesList.isEmpty == true
                      ? InkWell(
                          onTap: () {
                            cubit.getBasicData();
                          //  cubit.updateLength();

                          },
                          child: SizedBox(
                            height: 250,
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/images/backgrounds/emptydata.png',
                                  width: 200,
                                  height: 200,
                                ),
                                Text("there is no data click add to add yours",
                                    style:
                                        Theme.of(context).textTheme.bodyLarge),
                              ],
                            ),
                          ),
                        )
                      : SizedBox(
                          height: 400,
                          child: ListView.separated(
                              itemCount: cubit.LengthOfAllUserDiseasesList,
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                    height: 8,
                                  ),
                              itemBuilder: (context, index) {
                                print("💥💤💥the l of list user diseases ${ cubit.LengthOfAllUserDiseasesList}");
                                return Container(
                                  height: 66,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color.fromARGB(255, 48, 52, 56)
                                            .withOpacity(
                                                0.3), // shadow color with opacity
                                        blurRadius: 4, // blur radius
                                        offset: Offset(2, 2), // shadow offset
                                      ),
                                    ],
                                    border: Border.all(
                                      color: Color.fromARGB(255, 107, 160, 189)
                                          .withOpacity(
                                              0.5), // border color with opacity
                                      width: 1, // border width
                                    ),
                                    color: Colors.white,
                                  ),
                                  child: ListTile(
                                      title: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                    cubit
                                                        .AllUserDiseasesList[
                                                            index]
                                                        .diseaseName
                                                        .toString(),
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyLarge
                                                        ?.copyWith(
                                                          color: AppColor
                                                              .primaryColor,
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
                                                  const Icon(
                                                    Icons.date_range,
                                                    color: AppColor.orangcolor,
                                                    size: 17,
                                                  ),
                                                  Text(
                                                      convertDateTime(cubit
                                                                  .AllUserDiseasesList[
                                                                      index]
                                                                  .diagnosisDate)[
                                                              "date"]
                                                          .toString(),
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodySmall
                                                          ?.copyWith(
                                                            color: AppColor
                                                                .dividerColor,
                                                          )),
                                                ],
                                              ),
                                              //..............for clock
                                              Row(
                                                children: [
                                                  const Icon(
                                                    Icons.alarm_rounded,
                                                    color: AppColor.orangcolor,
                                                    size: 17,
                                                  ),
                                                  Text(
                                                      convertDateTime(cubit
                                                                  .AllUserDiseasesList[
                                                                      index]
                                                                  .diagnosisDate)[
                                                              "time"]
                                                          .toString(),
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodySmall
                                                          ?.copyWith(
                                                            color: AppColor
                                                                .dividerColor,
                                                          )),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      trailing: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  AppColor.orangcolor),
                                          onPressed: () {
                                            navigateToScreen(
                                                context,
                                                DiseaseDetailsScreen(
                                                  diseaseData:
                                                      cubit.AllUserDiseasesList[
                                                          index],
                                                ));
                                          },
                                          child: const Text(
                                            "Details",
                                            style:
                                                TextStyle(color: Colors.white),
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
                const Text(
                  'Enter Details',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _typeController,
                        decoration: const InputDecoration(labelText: 'type'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a type personal or family';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _descriptionController,
                        decoration:
                            const InputDecoration(labelText: 'Description'),
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
                        items: cubit.ALLDiseasesList?.map(
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
                        decoration:
                            const InputDecoration(labelText: 'Diagnosis'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a Diagnosis';
                          }
                          return null;
                        },
                      ),
                      //.........................date time
                      TextFormField(
                        controller: _dateController,
                        decoration: const InputDecoration(labelText: 'Date'),
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
                        decoration: const InputDecoration(labelText: 'Weight'),
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
                        decoration: const InputDecoration(labelText: 'Height'),
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
                        decoration: const InputDecoration(
                            labelText: 'Value of Disease'),
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
                          const Expanded(
                            child: Text(
                              'upload image',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                cubit.pickImage();
                              },
                              icon: const Icon(
                                Iconsax.document_upload,
                                color: AppColor.primaryColor,
                              ))
                        ],
                      ),
                      SizedBox(height: 20),
                      cubit.imagePathFromgallary == null
                          ? Text('No image selected.')
                          : Text('${cubit.imagePathFromgallary!.name}'),

                      const SizedBox(height: 20),
                      TextButton(
                          style: TextButton.styleFrom(
                            minimumSize: const Size(100, 40),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            foregroundColor:
                                const Color.fromARGB(255, 211, 48, 48),
                            backgroundColor: AppColor.primaryColor,
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              cubit
                                  .postFormData2(
                                _typeController.text,
                                _descriptionController.text,
                                _Diagnosis.text,
                                nid: cubit.basicDataModel!.data.nid,
                                height: double.parse(_heightController.text),
                                weight: double.parse(_weightController.text),
                                valueResult:
                                    double.parse(_diseaseValueController.text),
                                dateOfDiagonsises:
                                    DateTime.parse(_dateController.text),
                              )
                                  .then((e) {
                                _typeController.text = "";
                                _descriptionController.text = "";
                                _Diagnosis.text = "";
                                _heightController.text = "";
                                _weightController.text = "";
                                _diseaseValueController.text = "";
                                _dateController.text = "";
                                cubit.SelectedDisease = null;
                              });

                              showToast(
                                text: 'Disease added successfully',
                                state: ToastStates.SUCCESS,
                              );

                              // Delay the pop to allow the toast to show
                              Future.delayed(Duration(seconds: 2), () {
                                Navigator.pop(
                                    context); // This will close the bottom sheet
                              });
                            }
                          },
                          child: const Text(
                            "submit",
                            style: TextStyle(color: Colors.white),
                          )),
                      const SizedBox(height: 5),
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
            const SizedBox(width: 2),
            Text(
              title,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppColor.primaryColor,
              ),
            ),
          ],
        ),
        Text(
          dataValue,
          style: const TextStyle(
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
  TestsCubit cubit = TestsCubit.get(context);

  //cubit.testResult();
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
            const SizedBox(width: 5),
            Icon(
              icon,
              size: 14,
              color: AppColor.orangcolor,
            ),
            const SizedBox(width: 10),
            Text(
              label,
              style: const TextStyle(fontSize: 15, color: AppColor.whiteColor),
            ),
          ],
        ),
        IconButton(
          icon: const Icon(
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