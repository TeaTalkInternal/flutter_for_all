import 'package:flutter/material.dart';

class DemoFractionallySizedBox extends StatefulWidget {
  const DemoFractionallySizedBox({Key? key}) : super(key: key);

  @override
  State<DemoFractionallySizedBox> createState() =>
      _DemoFractionallySizedBoxState();
}

class _DemoFractionallySizedBoxState extends State<DemoFractionallySizedBox> {
  double width = 400;
  double padding = 20;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: AnimatedContainer(
          width: width,
          duration: const Duration(seconds: 1),
          curve: Curves.bounceIn,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                color: Colors.red,
                width: double.maxFinite,
                child: AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeIn,
                  padding: EdgeInsets.symmetric(horizontal: padding),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        width -= 50;
                      });
                    },
                    child: const Text('Button'),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: double.maxFinite,
                color: Colors.black45,
                child: FractionallySizedBox(
                  widthFactor: 0.7,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        width += 50;
                      });
                    },
                    child: const Text('Button'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
