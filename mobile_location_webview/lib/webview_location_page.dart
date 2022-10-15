import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rxdart/rxdart.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewLocationPage extends StatefulWidget {
  const WebViewLocationPage({Key? key}) : super(key: key);

  @override
  State<WebViewLocationPage> createState() => _WebViewLocationPageState();
}

class _WebViewLocationPageState extends State<WebViewLocationPage> {
  BehaviorSubject<Position> positionStream = BehaviorSubject<Position>();

  final LocationSettings locationSettings = const LocationSettings(
    accuracy: LocationAccuracy.high,
  );

  WebViewController? _controller;

  @override
  void initState() {
    _determinePosition();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Webview'),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(
              height: 500,
              child: WebView(
                initialUrl: 'about:blank',
                onWebViewCreated: (WebViewController webViewController) {
                  _controller = webViewController;
                  _loadHtmlFromAssets();
                },
                javascriptChannels: <JavascriptChannel>{
                  JavascriptChannel(
                    name: 'messageHandler',
                    onMessageReceived: (JavascriptMessage message) {
                      print("message from the web view=\"${message.message}\"");
                    },
                  )
                },
                javascriptMode: JavascriptMode.unrestricted,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            StreamBuilder<Position>(
                stream: positionStream,
                builder: (context, snapshot) {
                  final currentPos = snapshot.data;
                  if (currentPos == null) {
                    return const CircularProgressIndicator();
                  }
                  return Text(
                      'Longitude : ${currentPos.longitude}\n\nLatitude : ${currentPos.latitude}');
                }),
          ],
        ),
      ),
    );
  }

  void _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    Geolocator.getPositionStream(locationSettings: locationSettings)
        .listen((Position? position) {
      if (position != null) {
        positionStream.add(position);
        _controller?.runJavascript('getLongitude("${position.longitude}")');
        _controller?.runJavascript('getLatitude("${position.latitude}")');
      }
    });
  }

  _loadHtmlFromAssets() async {
    String fileText = await rootBundle.loadString('assets/html/index.html');
    _controller?.loadUrl(Uri.dataFromString(fileText,
            mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString());
  }
}
