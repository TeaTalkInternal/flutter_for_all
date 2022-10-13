import 'package:flutter/material.dart';

class DemoClipper extends StatelessWidget {
  const DemoClipper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            height: 70,
            child: Stack(alignment: Alignment.centerRight, children: [
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Container(
                  height: 70,
                  decoration: BoxDecoration(
                      color: Colors.cyan,
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
              Container(
                width: 40,
                height: 65,
                child: FloatingActionButton(
                  onPressed: () {},
                  child: const Icon(Icons.chevron_right),
                  backgroundColor: Colors.cyan,
                ),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 5)),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
