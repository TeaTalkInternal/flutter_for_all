import 'dart:math' as math;

import 'package:flutter/material.dart';

class DemoListWheelScrollView extends StatefulWidget {
  const DemoListWheelScrollView({Key? key}) : super(key: key);

  @override
  State<DemoListWheelScrollView> createState() =>
      _DemoListWheelScrollViewState();
}

class _DemoListWheelScrollViewState extends State<DemoListWheelScrollView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListWheelScrollView(
          itemExtent: 150,
          offAxisFraction: 0,
          diameterRatio: 3,
          children: List.generate(
            50,
            (index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 200,
                width: double.maxFinite,
                child: Center(child: Text('Index $index')),
                color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                    .withOpacity(1.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
