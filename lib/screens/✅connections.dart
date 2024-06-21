import 'package:flutter/material.dart';

class NoInternetScreen extends StatelessWidget {
   VoidCallback? onRetry;
   String? message_error;

  NoInternetScreen({ this.onRetry,this.message_error});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('No internet connection'),
            Text(message_error.toString()),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: (){},
              child: Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}
