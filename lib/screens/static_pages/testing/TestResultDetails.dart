import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:typed_data';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
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

  Future<String> writeToFile(Uint8List data) async {
    final tempDir = await getTemporaryDirectory();
    final file = File('${tempDir.path}/temp.pdf');
    await file.writeAsBytes(data, flush: true);
    return file.path;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.test!.title),
      ),
      body: SingleChildScrollView(
        child: Container(
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
              ...widget.test!.files.map((file) {
                if (file.type.startsWith('image/')) {
                  return IMGview(file.viewUrl);
                } else if (file.type == 'application/pdf') {
                  return PDFview(file.viewUrl);
                } else {
                  return Container();
                }
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget IMGview(String url) {
    return CustomContainer(
      child: FutureBuilder<String>(
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
              future: fetchFile(url, token),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError || snapshot.data == null) {
                  return Image.asset(
                    'assets/images/backgrounds/tests.jpeg',
                    fit: BoxFit.cover,
                  );
                } else {
                  return SizedBox(
                    height: 300, // Set an appropriate height for the image
                    child: Image.memory(
                      snapshot.data!,
                      fit: BoxFit.cover,
                    ),
                  );
                }
              },
            );
          }
        },
      ),
    );
  }

  Widget PDFview(String url) {
    return CustomContainer(
      child: FutureBuilder<String>(
        future: getToken(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Failed to load PDF');
          } else {
            final token = snapshot.data!;
            return FutureBuilder<Uint8List?>(
              future: fetchFile(url, token),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError || snapshot.data == null) {
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
                        return FutureBuilder<String>(
                          future: writeToFile(pdfSnapshot.data!),
                          builder: (context, fileSnapshot) {
                            if (fileSnapshot.connectionState ==
                                ConnectionState.waiting) {
                              return CircularProgressIndicator();
                            } else if (fileSnapshot.hasError ||
                                fileSnapshot.data == null) {
                              return Text('Failed to load PDF');
                            } else {
                              return SizedBox(
                                height:
                                    500, // Set an appropriate height for the PDF view
                                child: PDFView(
                                  filePath: fileSnapshot.data!,
                                  enableSwipe: true,
                                  swipeHorizontal: true,
                                  autoSpacing: false,
                                  pageFling: false,
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
                                  onPageChanged: (int? page, int? total) {
                                    print('page change: $page/$total');
                                  },
                                  // onZoomChanged: (double zoom) {
                                  //   print('zoom change: $zoom');
                                  // },
                                ),
                              );
                            }
                          },
                        );
                      }
                    },
                  );
                } else {
                  final pdfData = snapshot.data!;
                  if (isValidPdf(pdfData)) {
                    savePdfData(pdfData);
                    return FutureBuilder<String>(
                      future: writeToFile(pdfData),
                      builder: (context, fileSnapshot) {
                        if (fileSnapshot.connectionState ==
                            ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        } else if (fileSnapshot.hasError ||
                            fileSnapshot.data == null) {
                          return Text('Failed to load PDF');
                        } else {
                          return SizedBox(
                            height:
                                500, // Set an appropriate height for the PDF view
                            child: PDFView(
                              filePath: fileSnapshot.data!,
                              enableSwipe: true,
                              swipeHorizontal: true,
                              autoSpacing: false,
                              pageFling: false,
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
                              onPageChanged: (int? page, int? total) {
                                print('page change: $page/$total');
                              },
                              // onZoomChanged: (double zoom) {
                              //   print('zoom change: $zoom');
                              // },
                            ),
                          );
                        }
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
    );
  }

  bool isValidPdf(Uint8List pdfData) {
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
