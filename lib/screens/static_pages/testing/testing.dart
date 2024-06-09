import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'available.dart'; // Make sure to import your AvailablePage here
import 'cubit/tests_cubit.dart';
import 'prepare.dart';
import 'package:medica/shared/styles/AppColor.dart';

class Testing extends StatelessWidget {
  Testing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TestsCubit, TestsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        TestsCubit cubit = TestsCubit.get(context);
        return SafeArea(
          child: Scaffold(
            body: CustomScrollView(
              slivers: [
                SliverAppBar(
                  surfaceTintColor: (AppColor.secondaryTextColor),
                  shadowColor: AppColor.brawn,
                  foregroundColor: AppColor.bink,
                  pinned: true,
                  floating: true,
                  expandedHeight: 160,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          items[cubit.select],
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          width: 20,
                        )
                      ],
                    ),
                    background: BackdropFilter(
                      filter: ImageFilter.blur(
                          sigmaX: 10,
                          sigmaY:
                              10), // Adjust sigmaX and sigmaY for blur intensity
                      child: ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          Colors.white.withOpacity(0.4),
                          BlendMode.srcOver,
                        ),
                        child: Image.network(
                          'assets/images/backgrounds/tests.jpeg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
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
                            if (index == 1) cubit.available();
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
                  Prepare()
                else if (cubit.select == 1)
                  AvailablePage()
                else if (cubit.select == 2)
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return ListTile(
                          title: Text('count : $index'),
                        );
                      },
                      childCount: 20,
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

List<String> items = ['تحضيرات التحاليل', 'التحاليل المتاحة', 'نتائج التحاليل'];
