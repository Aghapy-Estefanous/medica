import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medica/screens/static_pages/testing/TestResultDetails.dart';
import 'package:medica/screens/static_pages/testing/cubit/tests_cubit.dart';
import 'package:medica/shared/SharedWidget.dart';

class ResultPage2 extends StatelessWidget {
  const ResultPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      // Wrap with Material widget
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Your Tests'),
        ),
        body: BlocBuilder<TestsCubit, TestsState>(
          builder: (context, state) {
            if (state is TestResultLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is TestResultLoaded) {
              return ListView.builder(
                itemCount: state.testResults.length,
                itemBuilder: (context, index) {
                  var test = state.testResults[index];
                  var cubit = TestsCubit.get(context);
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
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
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                    ),
                  );
                },
              );
            } else if (state is TestResultError) {
              return Center(child: Text('Error: ${state.errorMessage}'));
            } else {
              return Center(child: Text('No data available.'));
            }
          },
        ),
      ),
    );
  }
}
