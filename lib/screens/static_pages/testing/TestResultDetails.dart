import 'package:flutter/material.dart';

import '../../../models/testResultModel.dart';

class TestResultDetails extends StatelessWidget {
  final DataModel? test;
   TestResultDetails({super.key , this.test});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(test!.title),),
      body: Column(
        children: [
          Text(test!.description),
        ],
      ),
    );
  }
}
