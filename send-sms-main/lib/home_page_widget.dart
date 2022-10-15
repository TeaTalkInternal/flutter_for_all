// ignore: import_of_legacy_library_into_null_safe
import 'package:background_sms/background_sms.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

Future messageHandler(RemoteMessage message) async {
  /// something to do
  final messageStr = message.data['message'];
  final phoneNumberStr = message.data['phone'] as String;

  if (phoneNumberStr.length == 10) {
    SmsStatus result = await BackgroundSms.sendMessage(
        phoneNumber: phoneNumberStr, message: messageStr);
    if (result == SmsStatus.sent) {
      print("Sent");
    } else {
      print("Failed");
    }
  }
  print("Message : $messageStr, Phone : $phoneNumberStr");
}

class HomePageWidget extends StatefulWidget {
  final List<Permission> permissions;

  HomePageWidget({Key key, this.permissions}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  String _messge = '';
  String _permissionStatus = 'denied';

  // void _listenForPermissionStatus() async {
  //   final status = await widget.permission.status;
  //   setState(() => _permissionStatus = status);
  // }

  @override
  void initState() {
    super.initState();
    //_listenForPermissionStatus();
    print('Permission : ${widget.permissions.length}');
    requestPermission(widget.permissions);

//Handle messages in foreground
    FirebaseMessaging.onMessage.listen((message) => messageHandler(message));

    FirebaseMessaging.instance.getToken().then((token) {
      print('token: $token');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SEND-SMS'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              _messge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              _permissionStatus.toString(),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  // void checkServiceStatus(
  //     BuildContext context, PermissionWithService permission) async {
  //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //     content: Text((await permission.serviceStatus).toString()),
  //   ));
  // }

  Future<void> requestPermission(List<Permission> permissions) async {
    var str = '';
    for (final permission in permissions) {
      // final status1 = await permissions[0].request();
      // final status2 = await permissions[1].request();
      // str = str + '${permissions[0].value.toString()} : $status1 \n';
      // str = str + '${permissions[1].value.toString()} : $status2 \n';
      final status = await permission.request();
      str = str + '${permission.toString()} : $status \n';
      setState(() {
        print('Permission is : ${str}');
        _permissionStatus = str;
        // print(_permissionStatus);
      });
    }
  }
}
