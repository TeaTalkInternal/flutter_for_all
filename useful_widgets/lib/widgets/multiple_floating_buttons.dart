// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

double buttonSize = 80.0;

class MultipleFloatingButtonsWidget extends StatefulWidget {
  const MultipleFloatingButtonsWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<MultipleFloatingButtonsWidget> createState() =>
      _MultipleFloatingButtonsWidgetState();
}

class _MultipleFloatingButtonsWidgetState
    extends State<MultipleFloatingButtonsWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _myAnimation;
  final List<IconData> _icons = <IconData>[
    Icons.menu,
    Icons.email,
    Icons.new_releases,
    Icons.notifications,
    Icons.bluetooth,
    Icons.wifi,
  ];

  @override
  void initState() {
    super.initState();

    _myAnimation = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
  }

  Widget _buildItem(IconData icon) {
    return FloatingActionButton(
      onPressed: () {
        _myAnimation.status == AnimationStatus.completed
            ? _myAnimation.reverse()
            : _myAnimation.forward();
      },
      child: Icon(icon),
      splashColor: Colors.grey,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Flow(
        delegate: MyFlowDelegate(animation: _myAnimation),
        children:
            _icons.map<Widget>((IconData icon) => _buildItem(icon)).toList(),
      ),
    );
  }
}

class MyFlowDelegate extends FlowDelegate {
  MyFlowDelegate({required this.animation}) : super(repaint: animation);

  Animation<double> animation;

  @override
  void paintChildren(FlowPaintingContext context) {
    final size = context.size;
    final xStart = size.width - buttonSize;
    final yStart = size.height - buttonSize;

    for (int i = 0; i < context.childCount; i++) {
      const margin = 8;
      final childSize = context.getChildSize(i)!.width;
      final dx = (childSize + margin) * i;
      final x = xStart;
      final y = yStart - dx * animation.value;

      context.paintChild(i, transform: Matrix4.translationValues(x, y, 0));
    }
  }

  @override
  bool shouldRepaint(MyFlowDelegate oldDelegate) {
    return animation != oldDelegate.animation;
  }
}
