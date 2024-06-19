import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medica/shared/cubit/Cubit.dart';
import 'package:medica/shared/cubit/State.dart';
import 'package:medica/shared/SharedWidget.dart';
import 'package:medica/shared/styles/AppColor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:medica/screens/medical_history/disease_details.dart';

class prescriptionsScreen extends StatelessWidget {
  const prescriptionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
              appBar: MyAppBarWidget(context, "Patient Prescription"),
              body: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                          itemCount: cubit.LengthOfAllUserDiseasesList,
                          separatorBuilder: (context, index) => SizedBox(
                                height: 8,
                              ),
                          itemBuilder: (context, index) {
                            return Container(
                              //color: AppColor.primaryColor,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12)),
                                  color: const Color.fromARGB(219, 2, 78, 154)),
                              child: ListTile(
                                  leading: Icon(
                                    Icons.receipt,
                                    color: Color.fromARGB(255, 230, 226, 226),
                                    size: 44,
                                  ),
                                  title: Text(
                                      cubit.AllUserDiseasesList[index]
                                          .diseaseName
                                          .toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(
                                            color: AppColor.whiteColor,
                                          )),
                                  subtitle: Column(
                                    children: [
                                      SizedBox(
                                        height: 6,
                                      ),
                                      Text(
                                          cubit.AllUserDiseasesList[index]
                                              .diseaseDescription
                                              .toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(
                                                  color: Color.fromARGB(
                                                      255, 221, 216, 216))),
                                      Row(
                                        children: [
                                          Spacer(
                                            flex: 2,
                                          ),
                                          IconButton(
                                              onPressed: () async {
                                                SharedPreferences
                                                    sharedPreferences =
                                                    await SharedPreferences
                                                        .getInstance();
                                                String? token =
                                                    sharedPreferences
                                                        .getString('Token');

                                                navigateToScreen(
                                                  context,
                                                  FullScreenImageViewer(
                                                    imageUrl:
                                                        removeFirstAndLastChar(cubit
                                                            .AllUserDiseasesList[
                                                                index]
                                                            .docViewUrl
                                                            .toString()),
                                                    Token: token,
                                                  ),
                                                );
                                              },
                                              icon: Icon(
                                                Icons.now_wallpaper,
                                                color: Colors.orange,
                                              )),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          // IconButton(
                                          //     onPressed: () {},
                                          //     icon: Icon(
                                          //       Icons.downloading,
                                          //       color: Colors.orange,
                                          //     )),
                                        ],
                                      ),
                                    ],
                                  )),
                            );
                          }),
                    )
                  ],
                ),
              ));
        });
  }
}
