import 'package:flutter/material.dart';

typedef OnPressed = void Function();

class NoConnectionWidget extends StatelessWidget {
  const NoConnectionWidget({Key? key, this.pressed}) : super(key: key);
  final OnPressed? pressed;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
                child: Image.asset(
              'your image here',
              //height: MediaQuery.of(context).size.height / 2,
            )),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                ),
                onPressed: () {
                  debugPrint('NoConnectionWidget click : $pressed');
                  pressed?.call();
                },
                child: const Text('Retry'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
