import 'package:flutter/material.dart';

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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Puzzle()
      ),
    );
  }
}

class Puzzle extends StatefulWidget {
  const Puzzle({Key? key}) : super(key: key);

  @override
  _PuzzleState createState() => _PuzzleState();
}

GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey();

class _PuzzleState extends State<Puzzle> {
  bool _isBlueDropped = false;
  bool _isRedDropped = false;
  bool _isYelloDropped = false;
  bool _isGreenDropped = false;
  String _blue = 'blue';
  String _red = 'red';
  String _yellow = 'yellow';
  String _green = 'green';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Visibility(
                      visible: !_isRedDropped,
                      child: Draggable<String>(
                        // Data is the value this Draggable stores.
                        data: _red,
                        child: Container(
                          height: 65.0,
                          width: 65.0,
                          child: Center(
                            child: Image.asset('assets/images/ro.png'),
                          ),
                        ),
                        feedback: Container(
                          height: 65.0,
                          width: 65.0,
                          child: Center(
                            child: Image.asset('assets/images/ro.png'),
                          ),
                        ),
                        childWhenDragging: Container(),
                      ),
                    ),
                    Visibility(
                      visible: !_isGreenDropped,
                      child: Draggable<String>(
                        // Data is the value this Draggable stores.
                        data: _green,
                        child: Container(
                          height: 65.0,
                          width: 65.0,
                          child: Center(
                            child: Image.asset('assets/images/go.png'),
                          ),
                        ),
                        feedback: Container(
                          height: 65.0,
                          width: 65.0,
                          child: Center(
                            child: Image.asset('assets/images/go.png'),
                          ),
                        ),
                        childWhenDragging: Container(),
                      ),
                    ),
                    Visibility(
                      visible: !_isBlueDropped,
                      child: Draggable<String>(
                        // Data is the value this Draggable stores.
                        data: _blue,
                        child: Container(
                          height: 65.0,
                          width: 65.0,
                          child: Center(
                            child: Image.asset('assets/images/bo.png'),
                          ),
                        ),
                        feedback: Container(
                          height: 65.0,
                          width: 65.0,
                          child: Center(
                            child: Image.asset('assets/images/bo.png'),
                          ),
                        ),
                        childWhenDragging: Container(),
                      ),
                    ),
                    Visibility(
                      visible: !_isYelloDropped,
                      child: Draggable<String>(
                        // Data is the value this Draggable stores.
                        data: _yellow,
                        child: Container(
                          height: 65.0,
                          width: 65.0,
                          child: Center(
                            child: Image.asset('assets/images/yo.png'),
                          ),
                        ),
                        feedback: Container(
                          height: 65.0,
                          width: 65.0,
                          child: Center(
                            child: Image.asset('assets/images/yo.png'),
                          ),
                        ),
                        childWhenDragging: Container(),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DragTarget<String>(
                      builder: (
                          BuildContext context,
                          List<dynamic> accepted,
                          List<dynamic> rejected,
                          ) {
                        return Container(
                          height: 65,
                          width: 65,
                          child: Image.asset(_isBlueDropped
                              ? 'assets/images/bo.png'
                              : 'assets/images/bt.png'),
                        );
                      },
                      onWillAccept: (data) {
                        return data == _blue;
                      },
                      onAccept: (data) {
                        setState(() {
                          _isBlueDropped = true;
                        });
                      },
                    ),
                    DragTarget<String>(
                      builder: (
                          BuildContext context,
                          List<dynamic> accepted,
                          List<dynamic> rejected,
                          ) {
                        return Container(
                          height: 65,
                          width: 65,
                          child: Image.asset(_isRedDropped
                              ? 'assets/images/ro.png'
                              : 'assets/images/rt.png'),
                        );
                      },
                      onWillAccept: (data) {
                        return data == _red;
                      },
                      onAccept: (data) {
                        setState(() {
                          _isRedDropped = true;
                        });
                      },
                    ),
                    DragTarget<String>(
                      builder: (
                          BuildContext context,
                          List<dynamic> accepted,
                          List<dynamic> rejected,
                          ) {
                        return Container(
                          height: 65,
                          width: 65,
                          child: Image.asset(_isYelloDropped
                              ? 'assets/images/yo.png'
                              : 'assets/images/yt.png'),
                        );
                      },
                      onWillAccept: (data) {
                        return data == _yellow;
                      },
                      onAccept: (data) {
                        setState(() {
                          _isYelloDropped = true;
                        });
                      },
                    ),
                    DragTarget<String>(
                      builder: (
                          BuildContext context,
                          List<dynamic> accepted,
                          List<dynamic> rejected,
                          ) {
                        return Container(
                          height: 65,
                          width: 65,
                          child: Image.asset(_isGreenDropped
                              ? 'assets/images/go.png'
                              : 'assets/images/gt.png'),
                        );
                      },
                      onWillAccept: (data) {
                        return data == _green;
                      },
                      onAccept: (data) {
                        setState(() {
                          _isGreenDropped = true;
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.15,
                ),
                Divider(
                  thickness: 5,
                  color: Colors.white,
                ),

              ],
            ),
          )),
    );
  }

  void showSnackBarGlobal(BuildContext context, String message) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          message,
          textScaleFactor: 2,
        )));
  }
}


class BasicDragDrop extends StatefulWidget {
  const BasicDragDrop({Key? key}) : super(key: key);

  @override
  _BasicDragDropState createState() => _BasicDragDropState();
}

// GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey();

class _BasicDragDropState extends State<BasicDragDrop> {
  bool _isDropped = false;
  String _color = 'red';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Draggable<String>(
                    // Data is the value this Draggable stores.
                    data: 'red',
                    child: Container(
                      height: 120.0,
                      width: 120.0,
                      child: Center(
                        child: Image.asset('assets/images/tomato.png'),
                      ),
                    ),
                    feedback: Container(
                      height: 120.0,
                      width: 120.0,
                      child: Center(
                        child: Image.asset('assets/images/tomato.png'),
                      ),
                    ),
                    childWhenDragging: Container(
                      height: 120.0,
                      width: 120.0,
                      child: Center(
                        child: Image.asset('assets/images/tomato_greyed.png'),
                      ),
                    ),
                    onDragStarted: () {
                      //showSnackBarGlobal(context, 'Drag started');
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.15,
                  ),
                  DragTarget<String>(
                    builder: (
                        BuildContext context,
                        List<dynamic> accepted,
                        List<dynamic> rejected,
                        ) {
                      return Container(
                        height: 300,
                        width: 300,
                        child: Center(
                          child: Image.asset(_isDropped
                              ? 'assets/images/bowl_full.png'
                              : 'assets/images/bowl.png'),
                        ),
                      );
                    },
                    onWillAccept: (data) {
                      return data == 'red';
                    },
                    onAccept: (data) {
                      setState(() {
                        showSnackBarGlobal(context, 'Dropped successfully!');
                        _isDropped = true;
                      });
                    },
                    onLeave: (data) {
                      showSnackBarGlobal(context, 'Missed');
                    },
                  ),
                ],
              ),
            ),
          )),
    );
  }

  void showSnackBarGlobal(BuildContext context, String message) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          message,
          textScaleFactor: 2,
        )));
  }
}
