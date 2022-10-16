import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:send_sms/home_page_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.instance.requestPermission();
  //Handle messages in background
  FirebaseMessaging.onBackgroundMessage(messageHandler);
  runApp(SmsManApp());
}

class SmsManApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SEND-SMS',
      home: HomePageWidget(permissions: const [
        Permission.sms,
        Permission.notification,
      ]),
    );
  }
}
