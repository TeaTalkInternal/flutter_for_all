import 'package:flutter/material.dart';

class DemoStatefulBuilder extends StatefulWidget {
  const DemoStatefulBuilder({Key? key}) : super(key: key);

  @override
  State<DemoStatefulBuilder> createState() => _DemoStatefulBuilderState();
}

class _DemoStatefulBuilderState extends State<DemoStatefulBuilder> {
  String _sampleText = "Sample Text";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: StatefulBuilder(
              builder: (context, setState) {
                return Container(
                  padding: const EdgeInsets.all(16),
                  width: double.infinity,
                  color: Colors.green,
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    direction: Axis.vertical,
                    runAlignment: WrapAlignment.center,
                    children: [
                      Text(
                        _sampleText,
                        style: TextStyle(fontSize: 20),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _sampleText = "Clicked From Green";
                            });
                          },
                          child: Text("Inside StatefulBuilder")),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              color: Colors.red,
              padding: EdgeInsets.all(16),
              child: Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                direction: Axis.vertical,
                runAlignment: WrapAlignment.center,
                children: [
                  Text(
                    _sampleText,
                    style: TextStyle(fontSize: 20),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _sampleText = "Clicked From Red";
                        });
                      },
                      child: Text("Its Simple Button")),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
