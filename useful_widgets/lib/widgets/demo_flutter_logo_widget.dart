import 'package:flutter/material.dart';

class DemoFlutterLogoWidget extends StatefulWidget {
  const DemoFlutterLogoWidget({Key? key}) : super(key: key);

  @override
  State<DemoFlutterLogoWidget> createState() => _DemoFlutterLogoWidgetState();
}

class _DemoFlutterLogoWidgetState extends State<DemoFlutterLogoWidget> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              selected = !selected;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(seconds: 5),
            child: FlutterLogo(
              size: selected ? 200 : 350,
              style: FlutterLogoStyle.horizontal,
              curve: Curves.fastOutSlowIn,
            ),
          ),
        ),
      ),
    );
  }
}
