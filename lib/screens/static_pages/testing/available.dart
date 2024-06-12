import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/tests_cubit.dart';

class AvailablePage extends StatelessWidget {
  const AvailablePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TestsCubit, TestsState>(
      builder: (context, state) {
        if (state is TestsLoading) {
          return SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
        } else if (state is TestsLoaded) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                var test = state.tests[index];
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
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: ListTile(
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
                          test.name ?? '',
                          // textDirection: TextDirection.rtl,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          'Price: ${test.price.toString()}EGP', // Replace with actual description if available
                          textDirection: TextDirection.rtl,
                        )),
                  ),
                );
              },
              childCount: state.tests.length,
            ),
          );
        } else if (state is TestsError) {
          return SliverToBoxAdapter(
            child: Center(child: Text('Error: ${state.error}')),
          );
        } else {
          return SliverToBoxAdapter(
            child: Center(child: Text('No data available.')),
          );
        }
      },
    );
  }
}
