import 'package:flutter/material.dart';

import '../../../models/testResultModel.dart';
import '../../../shared/SharedWidget.dart';

class TestResultDetails extends StatelessWidget {
  final DataModel? test;
  TestResultDetails({super.key, this.test});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(test!.title),
      ),
      body: Column(
        children: [
          CustomContainer(
            child: Column(
              children: [
                CustomText(child: test!.description),
                CustomText(child: test!.test.name),
                CustomText(
                    child: test!.test.description ?? 'there is no description'),
                // Text(test!.test.),
              ],
            ),
          ),
          CustomContainer(
              child: Image.network(test!.test.photo ??
                  'https://assets.visme.co/templates/banners/thumbnails/i_Medical-Test-Results_full.jpg')),
        ],
      ),
    );
  }

  Text CustomText({required String child}) => Text(
        child,
        style: TextStyle(fontSize: 20),
      );

}
