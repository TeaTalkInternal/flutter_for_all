import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DemoImageFilter extends StatefulWidget {
  const DemoImageFilter({Key? key}) : super(key: key);

  @override
  State<DemoImageFilter> createState() => _DemoImageFilterState();
}

class _DemoImageFilterState extends State<DemoImageFilter> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SizedBox(
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 2),
            child: const Text(
              'Flutter Festival',
              style: TextStyle(fontSize: 30),
            ),
          ),
          SizedBox(
            width: double.maxFinite,
            child: ImageFiltered(
              imageFilter: ImageFilter.compose(
                  outer: ImageFilter.blur(sigmaY: 5),
                  inner: ImageFilter.matrix(Matrix4.rotationZ(0.2).storage)),
              child: const Image(
                width: 200,
                height: 200,
                image: AssetImage(
                  'assets/images/error.jpeg',
                ),
              ),
            ),
          ),
        ],
      ),
    )));
  }
}
