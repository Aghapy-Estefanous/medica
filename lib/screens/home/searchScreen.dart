import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medica/shared/cubit/Cubit.dart';
import 'package:medica/shared/cubit/State.dart';
import 'package:medica/shared/SharedWidget.dart';
import 'package:medica/shared/styles/AppColor.dart';
import 'package:medica/screens/details_screen/details_clinics.dart';

TextEditingController SearchController = TextEditingController();

class Search_Screen extends StatelessWidget {
  const Search_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
              appBar: MyAppBarWidget(context, "Search for any clinic"),
              // backgroundColor: AppColor.primaryColor,s
              body: Padding(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: AppColor.primaryColor,
                          ),
                        ),
                        child: TextField(
                          controller: SearchController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixText: '    ',
                              hintText: 'Search for... ',
                              fillColor: AppColor.primaryColor,
                              suffixIcon: IconButton(
                                icon: Icon(Icons.search),
                                color: AppColor.orangcolor,
                                onPressed: () async {
                                  await cubit.ScearchFunction(
                                      SearchController.text);
                                  SearchController.text = "";
                                },
                              )),
                          onChanged: (value) async {
                            await cubit.ScearchFunction(value);
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      State is GetAllDepartmentLoadingState
                          ? Center(child: CircularProgressIndicator())
                          : cubit.SearchResponseList!.isEmpty
                              ? Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          Image.asset(
                                              'assets/images/ilustrations/nodata.jpg'),
                                          Text(
                                            "There is no Results!",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              : Expanded(
                                  child: ListView.separated(
                                      itemCount:
                                          cubit.SearchResponseList?.length ??
                                              0, //cliniclist?.length??0,
                                      separatorBuilder: (context, index) =>
                                          const SizedBox(
                                            height: 8,
                                          ),
                                      itemBuilder: (context, index) {
                                        return Container(
                                          //color: AppColor.primaryColor,
                                          decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(12)),
                                              color: Color.fromARGB(
                                                  219, 2, 78, 154)),
                                          child: ListTile(
                                              leading: Icon(
                                                Icons.medical_services_rounded,
                                                color: Color.fromARGB(
                                                    255, 226, 229, 230),
                                                size: 30,
                                              ),
                                              title: Text(
                                                  cubit
                                                          .SearchResponseList?[
                                                              index]
                                                          .name ??
                                                      "name",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge
                                                      ?.copyWith(
                                                        color:
                                                            AppColor.whiteColor,
                                                      )),
                                              trailing: TextButton(
                                                  style: ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .all<Color>(AppColor
                                                                .orangcolor),
                                                    shape: MaterialStateProperty
                                                        .all<
                                                            RoundedRectangleBorder>(
                                                      RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                12.0), // Adjust the value as needed
                                                      ),
                                                    ),
                                                  ),
                                                  onPressed: () {
                                                    navigateToScreen(
                                                        context,
                                                        DetailsScreen(cubit
                                                                .SearchResponseList?[
                                                            index]));
                                                  },
                                                  child: Text(
                                                    "Details",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ))),
                                        );
                                      }),
                                )
                    ],
                  )));
        });
  }
}
