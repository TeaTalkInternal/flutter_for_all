import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DemoErrorWidget extends StatelessWidget {
  final FlutterErrorDetails errorDetails;

  const DemoErrorWidget({Key? key, required this.errorDetails})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDebugModeCheck = kDebugMode;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/error.jpeg',
              width: 300,
              height: 200,
            ),
            const SizedBox(
              height: 30,
            ),
            if (isDebugModeCheck) ...[
              Text(
                'This is custom error for ${isDebugModeCheck ? 'Debug Mode' : 'Release Mode'}',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: isDebugModeCheck ? Colors.orange : Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              )
            ],
            const SizedBox(
              height: 10,
            ),
            Text(
              isDebugModeCheck
                  ? errorDetails.summary.toString()
                  : 'Oops! Something went wrong!',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: isDebugModeCheck ? Colors.red : Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 21),
            ),
            const SizedBox(height: 12),
            Text(
              isDebugModeCheck
                  ? 'https://docs.flutter.dev/testing/errors'
                  : "We encountered an error and we've notified our engineering team about it. Sorry for the inconvenience caused.",
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.black, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
