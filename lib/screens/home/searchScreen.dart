import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medica/shared/cubit/Cubit.dart';
import 'package:medica/shared/cubit/State.dart';
import 'package:medica/shared/SharedWidget.dart';
import 'package:medica/shared/styles/AppColor.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:medica/screens/%E2%9C%85connections.dart';
import 'package:medica/screens/details_screen/details_clinics.dart';

TextEditingController SearchController = TextEditingController();

class Search_Screen extends StatelessWidget {
  const Search_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        if (state is SearchErrorState) {
          print("Error from search: ${state.error}");
        }
      },
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return state is SearchErrorState
            ? NoInternetScreen(
                message_error: state.error,
              )
            : Scaffold(
                appBar: MyAppBarWidget(context, "search_screen_title".tr()),
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
                            hintText: 'search_hint'.tr(),
                            fillColor: AppColor.primaryColor,
                            suffixIcon: IconButton(
                              icon: Icon(Icons.search),
                              color: AppColor.orangcolor,
                              onPressed: () async {
                                await cubit.ScearchFunction(
                                  SearchController.text,
                                );
                                SearchController.text = "";
                              },
                            ),
                          ),
                          onChanged: (value) async {
                            await cubit.ScearchFunction(value);
                          },
                        ),
                      ),
                      SizedBox(height: 10),
                      state is GetAllDepartmentLoadingState
                          ? Center(child: CircularProgressIndicator())
                          : cubit.SearchResponseList!.isEmpty
                              ? Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            'assets/images/backgrounds/search.png',
                                          ),
                                          SizedBox(height: 20),
                                          Text(
                                            "no_results".tr(),
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
                                    itemCount: cubit
                                            .SearchResponseList?.length ??
                                        0,
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(
                                      height: 8,
                                    ),
                                    itemBuilder: (context, index) {
                                      return Container(
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(12),
                                          ),
                                          color: Color.fromARGB(
                                              219, 2, 78, 154),
                                        ),
                                        child: ListTile(
                                          leading: Icon(
                                            Icons
                                                .medical_services_rounded,
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
                                                ),
                                          ),
                                          trailing: TextButton(
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty
                                                      .all<Color>(
                                                AppColor.orangcolor,
                                              ),
                                              shape: MaterialStateProperty
                                                  .all<
                                                      RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    12.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            onPressed: () {
                                              navigateToScreen(
                                                context,
                                                DetailsScreen(
                                                  cubit
                                                      .SearchResponseList?[
                                                          index],
                                                ),
                                              );
                                            },
                                            child: Text(
                                              "details".tr(),
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                    ],
                  ),
                ),
              );
      },
    );
  }
}
