import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medica/shared/SharedWidget.dart';

import 'TestResultDetails.dart';
import 'cubit/tests_cubit.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TestsCubit, TestsState>(
      builder: (context, state) {
        if (state is TestResultLoading) {
          return SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
        } else if (state is TestResultLoaded) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                var test = state.testResults[index];
                // var cubit = TestsCubit.get(context);
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).cardColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ListTile(
                      onTap: () {
                        navigateToScreen(
                            context, TestResultDetails(test: test));
                      },
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/backgrounds/tests.jpeg',
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(
                        test.title ?? '',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        '${test.test.name}',
                        // textDirection: TextDirection.rtl,
                      ),
                    ),
                  ),
                );
              },
              childCount: state.testResults.length,
            ),
          );
        } else if (state is TestResultError) {
          return SliverToBoxAdapter(
            child:Center(
                      child: Column(
                    children: [
                      Image.asset('assets/images/ilustrations/nodata.jpg'),
                      Text(
                        'There is an Error'.tr(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      )
                    ],
                  )),
          );
        } else {
          return SliverToBoxAdapter(
            child: Center(
                      child: Column(
                    children: [
                      Image.asset('assets/images/ilustrations/nodata.jpg'),
                      Text(
                        'There is an Error'.tr(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      )
                    ],
                  )),
          );
        }
      },
    );
  }
}
