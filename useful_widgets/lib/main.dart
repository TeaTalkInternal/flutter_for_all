import 'package:flutter/material.dart';
import 'package:new_widgets/widgets/demo_customized_shimmer_for_list.dart';
import 'package:new_widgets/widgets/demo_navigation_rail.dart';
import 'package:new_widgets/widgets/demo_flutter_logo_widget.dart';
import 'widgets/demo_error_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      builder: (context, widget) {
        ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
          return DemoErrorWidget(
            errorDetails: errorDetails, // If you want to pass error details
          );
        };
        return widget!;
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const MyHomePage(title: 'Flutter Ahmedabad'),
      // home: const DemoExactAssetsImages(),
      // home: const DemoStatefulBuilder(),
      // home: const DemoFractionallySizedBox(),
      // home: const DemoNavigationRail(),
      home: const ListShimmerPage(
          containerHeight: 60.0,
          bottomMargin: 5.0,
          leftMargin: 10.0,
          rightMargin: 10.0,
          topMargin: 10.0,
          count: 10,
          borderRadius: 4.0,
          shinkWap: false,
          physics: false),
      // home: const DemoImageFilter(),
      // home: const DemoListWheelScrollView(),
      // home: const DemoFlutterLogoWidget(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int? _counter = 0;

  void _incrementCounter() {
    showAboutDialog(context: context, children: []);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _incrementCounter();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${_counter!}',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
