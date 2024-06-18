import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medica/screens/static_pages/Cares/cubit/care_cubit.dart';

import 'package:medica/shared/styles/AppColor.dart';

import 'BabyCare.dart';
import 'FirstAid.dart';

class CareScreen extends StatelessWidget {
  CareScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CareCubit, CareState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        CareCubit cubit = CareCubit.get(context);
        return SafeArea(
          child: Scaffold(
            body: CustomScrollView(
              slivers: [
                SliverAppBar(
                  // surfaceTintColor: (AppColor.secondaryTextColor),
                  // shadowColor: AppColor.brawn,
                  // foregroundColor: AppColor.bink,
                  pinned: true,
                  floating: true,
                  expandedHeight: 160,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Center(
                          child: Text(
                            items[cubit.select],
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        )
                      ],
                    ),
                    // background: BackdropFilter(
                    //   filter: ImageFilter.blur(
                    //       sigmaX: 10,
                    //       sigmaY:
                    //           10), // Adjust sigmaX and sigmaY for blur intensity
                    //   child: ColorFiltered(
                    //     colorFilter: ColorFilter.mode(
                    //       Colors.white.withOpacity(0.4),
                    //       BlendMode.srcOver,
                    //     ),
                    //     child: Image.network(
                    //       'assets/images/backgrounds/tests.jpeg',
                    //       fit: BoxFit.cover,
                    //     ),
                    //   ),
                    // ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    height: 50,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            cubit.selected(index);
                            // TestsCubit cubit2 = TestsCubit.get(context);
                            // if (index == 1)
                            //   cubit.available();
                            // else if (index == 2) cubit.testResult();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: cubit.select == index
                                    ? AppColor.highlightColor
                                    : AppColor.dividerColor),
                            width:
                                200, // Set width for each item in the horizontal list
                            margin: EdgeInsets.all(
                                8), // Add some margin between items
                            // Example background color
                            child: Center(
                              child: Text(items[index],
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                if (cubit.select == 0)
                  BabyCare()
                // else if (cubit.select == 1)
                //   AvailablePage()
                // else if (cubit.select == 2)
                //   ResultPage()
                else
                  FirstAid()
              ],
            ),
          ),
        );
      },
    );
  }
}

List<String> items = [
  'BabyCare',
  // 'تحضيرات التحاليل',
  // 'التحاليل المتاحة',
  // 'نتائج التحاليل',
  'First Aid'
];
