import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:typed_data';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import '../../../models/testResultModel.dart';
import '../../../shared/SharedWidget.dart';
import 'dart:convert';

class TestResultDetails extends StatefulWidget {
  final DataModel? test;
  TestResultDetails({super.key, this.test});

  @override
  _TestResultDetailsState createState() => _TestResultDetailsState();
}

class _TestResultDetailsState extends State<TestResultDetails> {
  Future<String> getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString('Token')!;
  }

  Future<Uint8List?> fetchFile(String url, String token) async {
    final response = await http.get(
      Uri.parse(url),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      return response.bodyBytes;
    } else {
      return null;
    }
  }

  Future<void> savePdfData(Uint8List pdfData) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String pdfString = base64Encode(pdfData);
    await prefs.setString('saved_pdf', pdfString);
  }

  Future<Uint8List?> getPdfData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? pdfString = prefs.getString('saved_pdf');
    if (pdfString != null) {
      return base64Decode(pdfString);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.test!.title),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 1000,
          child: Column(
            children: [
              CustomContainer(
                child: Column(
                  children: [
                    CustomText(child: widget.test!.description),
                    CustomText(child: widget.test!.test.name),
                    CustomText(
                        child: widget.test!.test.description ??
                            'There is no description'),
                  ],
                ),
              ),
              IMGview(),
              PDFview(),
            ],
          ),
        ),
      ),
    );
  }

  Container IMGview() {
    return CustomContainer(
      child: widget.test!.files.isNotEmpty &&
              widget.test!.files[0].type.startsWith('image/')
          ? FutureBuilder<String>(
              future: getToken(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Image.asset(
                    'assets/images/backgrounds/tests.jpeg',
                    fit: BoxFit.cover,
                  );
                } else {
                  final token = snapshot.data!;
                  return FutureBuilder<Uint8List?>(
                    future: fetchFile(widget.test!.files[0].viewUrl, token),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else if (snapshot.hasError || snapshot.data == null) {
                        return Image.asset(
                          'assets/images/backgrounds/tests.jpeg',
                          fit: BoxFit.cover,
                        );
                      } else {
                        return Image.memory(
                          snapshot.data!,
                          fit: BoxFit.cover,
                        );
                      }
                    },
                  );
                }
              },
            )
          : Image.asset(
              'assets/images/backgrounds/tests.jpeg',
              fit: BoxFit.cover,
            ),
    );
  }

  Widget PDFview() {
    if (widget.test!.files.isNotEmpty) {
      return Expanded(
        child: CustomContainer(
          child: FutureBuilder<String>(
            future: getToken(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                print(snapshot.error);
                return Text('Failed to load PDF');
              } else {
                final token = snapshot.data!;
                return FutureBuilder<Uint8List?>(
                  future: fetchFile(widget.test!.files[0].viewUrl, token),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError || snapshot.data == null) {
                      // Load PDF from SharedPreferences if available
                      return FutureBuilder<Uint8List?>(
                        future: getPdfData(),
                        builder: (context, pdfSnapshot) {
                          if (pdfSnapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          } else if (pdfSnapshot.hasError ||
                              pdfSnapshot.data == null) {
                            return Text('Failed to load PDF');
                          } else {
                            return PDFView(
                              pdfData: pdfSnapshot.data!,
                              onError: (error) {
                                print("PDF view error: $error");
                              },
                              onRender: (_pages) {
                                print("PDF rendered with $_pages pages");
                              },
                              onViewCreated:
                                  (PDFViewController pdfViewController) {
                                print("PDF view created");
                              },
                            );
                          }
                        },
                      );
                    } else {
                      // Validate the PDF data
                      final pdfData = snapshot.data!;
                      if (isValidPdf(pdfData)) {
                        savePdfData(pdfData); // Save the fetched PDF data
                        return PDFView(
                          pdfData: pdfData,
                          onError: (error) {
                            print("PDF view error: $error");
                          },
                          onRender: (_pages) {
                            print("PDF rendered with $_pages pages");
                          },
                          onViewCreated: (PDFViewController pdfViewController) {
                            print("PDF view created");
                          },
                        );
                      } else {
                        return Text('Failed to load PDF: Invalid PDF format');
                      }
                    }
                  },
                );
              }
            },
          ),
        ),
      );
    } else {
      return CustomContainer();
    }
  }

  bool isValidPdf(Uint8List pdfData) {
    // Check if the PDF data starts with the PDF header "%PDF-"
    return pdfData.length > 4 &&
        pdfData[0] == 0x25 &&
        pdfData[1] == 0x50 &&
        pdfData[2] == 0x44 &&
        pdfData[3] == 0x46;
  }

  Text CustomText({required String child}) => Text(
        child,
        style: TextStyle(fontSize: 20),
      );
}
