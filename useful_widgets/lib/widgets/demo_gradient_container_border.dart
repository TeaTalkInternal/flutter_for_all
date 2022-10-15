import 'package:flutter/material.dart';

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
        //padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
            border: Border.all(color: Colors.white)),
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
