import 'package:flutter/material.dart';
import 'package:medica/models/user/AllDiseasesOfUser.dart';

class DiseaseDetailsScreen extends StatelessWidget {
  final DiseasesOfUser diseaseData;

  const DiseaseDetailsScreen({Key? key, required this.diseaseData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Disease Details'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Disease Name: ${diseaseData.diseaseName}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            Text(
              'Description:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              '${diseaseData.description}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 12),
            Text(
              'Symptoms:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              '${diseaseData.diagnosisDate}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 12),
            Text(
              'Causes:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              '${diseaseData.diseaseCauses}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 12),
            Text(
              'Diagnosis: ${diseaseData.diagnosis}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 12),
            Text(
              'Diagnosis Date: ${diseaseData.diagnosisDate}',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}