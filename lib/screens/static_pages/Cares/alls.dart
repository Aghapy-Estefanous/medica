import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medica/screens/static_pages/Cares/MamyCare.dart';
import 'package:medica/screens/static_pages/Cares/cubit/care_cubit.dart';
import 'package:medica/shared/styles/AppColor.dart';
import '../../calculateResultTest/valuesOfTests.dart';
import 'FirstAid.dart';
import 'BabyCare.dart';

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
                  surfaceTintColor: (AppColor.secondaryTextColor),
                  shadowColor: AppColor.brawn,
                  foregroundColor: AppColor.bink,
                  pinned: true,
                  floating: true,
                  expandedHeight: 160,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Text(
                      items[cubit.select],
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w700),
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
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: cubit.select == index
                                    ? AppColor.highlightColor
                                    : AppColor.dividerColor),
                            width: 200,
                            margin: EdgeInsets.all(8),
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
                cubit.select == 0
                    ? BabyCare()
                    : cubit.select == 1
                        ? MamyCare()
                        : cubit.select == 2
                            ? FirstAid()
                            : CalculateTestVitResultScreen(),
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
  'Pregnancy Care',
  'First Aid',
  'Vitamins Calculator',
];
