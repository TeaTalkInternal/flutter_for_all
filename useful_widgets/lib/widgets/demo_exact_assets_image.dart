import 'package:flutter/material.dart';

class DemoExactAssetsImages extends StatelessWidget {
  const DemoExactAssetsImages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              color: Colors.green,
              child: const Image(
                image: AssetImage(
                  'assets/images/dash.png',
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: 200,
              color: Colors.green,
              child: const Image(
                image: ExactAssetImage(
                  'assets/images/dash.png',
                  scale: 10,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
