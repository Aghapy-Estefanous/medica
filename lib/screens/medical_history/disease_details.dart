import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:medica/shared/SharedWidget.dart';
import 'package:medica/shared/styles/AppColor.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:medica/models/user/AllDiseasesOfUser.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:medica/shared/network/remote/Dio_helper.dart';

class DiseaseDetailsScreen extends StatelessWidget {
  final DiseasesOfUser diseaseData;

  DiseaseDetailsScreen({Key? key, required this.diseaseData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios)),
        title: Text(tr('diseaseDetailsTitle')),
        backgroundColor: AppColor.primaryColor,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                diseaseData.diseaseName.toString(),
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColor.primaryColor),
              ),
            ),
            SizedBox(height: 24),
            buildDetailCard(tr('description'), diseaseData.description.toString(), context),
            buildDetailCard(tr('symptoms'), diseaseData.diseaseSymptoms.toString(), context),
            buildDetailCard(tr('causes'), diseaseData.diseaseCauses.toString(), context),
            buildDetailCard(tr('diagnosis'), diseaseData.diagnosis.toString(), context),
            buildDetailCard(tr('diagnosisDate'), diseaseData.diagnosisDate.toString(), context),
            Row(
              children: [
                Text(
                  tr('documentViewUrl'),
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColor.primaryColor),
                ),
                IconButton(
                    onPressed: () async {
                      SharedPreferences sharedPreferences =
                          await SharedPreferences.getInstance();
                      String? token = sharedPreferences.getString('Token');

                      navigateToScreen(
                        context,
                        FullScreenImageViewer(
                          imageUrl: removeFirstAndLastChar(diseaseData.docViewUrl.toString()),
                          Token: token,
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.now_wallpaper,
                      color: Colors.orange,
                      size: 18,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDetailCard(String title, String content, BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        width: MediaQuery.of(context).size.width - 32, // Full width with padding accounted for
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColor.primaryColor),
            ),
            SizedBox(height: 8),
            Text(
              content,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

String removeFirstAndLastChar(String str) {
  if (str.length <= 2) {
    return ''; // or throw an exception, or handle as needed
  }
  return str.substring(1, str.length - 1);
}

class FullScreenImageViewer extends StatelessWidget {
  final String imageUrl;
  String? Token;

  FullScreenImageViewer({required this.imageUrl, this.Token});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PhotoView(
            imageProvider: NetworkImage(imageUrl, headers: {'Authorization': 'Bearer $Token'}),
            backgroundDecoration: BoxDecoration(
              color: AppColor.primaryColor,
            ),
          ),
          Positioned(
            top: 40,
            right: 20,
            child: IconButton(
              icon: Icon(Icons.close, color: Colors.white, size: 30),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
