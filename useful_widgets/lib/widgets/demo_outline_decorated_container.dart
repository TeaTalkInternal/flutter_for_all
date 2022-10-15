import 'package:flutter/material.dart';

class DemoOutlineDecoratedContanier extends StatelessWidget {
  const DemoOutlineDecoratedContanier({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DemoOutlineDecoratedContanier"),
      ),
      body: Center(
        child: OutlineDecoratedContainer(
          thickness: 2,
          child: SizedBox(
            child: Center(
              child: Text("Sample container"),
            ),
            height: 40,
            width: 250,
          ),
        ),
      ),
    );
  }
}

class OutlineDecoratedContainer extends StatelessWidget {
  const OutlineDecoratedContainer(
      {Key? key, required this.thickness, required this.child})
      : super(key: key);
  final double thickness;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: const LinearGradient(colors: [Colors.blue, Colors.red]),
      ),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
            border: Border.all(color: Colors.blue)),
        margin: EdgeInsets.all(thickness),
        child: OutlinedButton(
          style: ButtonStyle(
            side: MaterialStateProperty.all(BorderSide.none),
          ),
          onPressed: () {},
          child: child,
        ),
      ),
    );
  }
}
