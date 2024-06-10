import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;

Future<void> saveFileToDevice(String fileName) async {
  try {
    final byteData = await rootBundle.load('assets/$fileName');

    // Determine the platform and path to save the file
    String filePath = '';
    if (Platform.isAndroid) {
      filePath = '/storage/emulated/0/Download/$fileName';
    } else if (Platform.isIOS) {
      // Define the path for iOS, for example using path_provider
      // filePath = ...
    } else {
      // Handle other platforms if needed
      return;
    }

    // Write the file to the device's storage
    final file = File(filePath);
    await file.writeAsBytes(byteData.buffer
        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
  } catch (err) {
    // Handle any errors that occur during file saving
    print('Error saving file: $err');
  }
}
