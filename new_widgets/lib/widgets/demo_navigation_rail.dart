import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DemoNavigationRail extends StatefulWidget {
  const DemoNavigationRail({Key? key}) : super(key: key);

  @override
  State<DemoNavigationRail> createState() => _DemoNavigationRailState();
}

class _DemoNavigationRailState extends State<DemoNavigationRail> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Row(
          children: <Widget>[
            if (kIsWeb) ...[
              NavigationRail(
                selectedIndex: _selectedIndex,
                useIndicator: true,
                leading: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.abc),
                ),
                trailing: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.settings),
                ),
                selectedIconTheme: IconThemeData(color: Colors.white),
                onDestinationSelected: (int index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                labelType: NavigationRailLabelType.selected,
                destinations: const <NavigationRailDestination>[
                  NavigationRailDestination(
                    icon: Icon(Icons.favorite_border),
                    selectedIcon: Icon(Icons.favorite),
                    label: Text('First'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.bookmark_border),
                    selectedIcon: Icon(Icons.book),
                    label: Text('Second'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.star_border),
                    selectedIcon: Icon(Icons.star),
                    label: Text('Third'),
                  ),
                ],
              ),
              const VerticalDivider(thickness: 1, width: 1),
            ], // This is the main content.
            Expanded(
              child: Center(
                child: Text('selectedIndex: $_selectedIndex'),
              ),
            )
          ],
        ),
        bottomNavigationBar: kIsWeb
            ? null
            : BottomNavigationBar(
                currentIndex: _selectedIndex,
                onTap: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.favorite_border),
                    label: 'First',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.bookmark_border),
                    label: 'Second',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.star_border),
                    label: 'Third',
                  ),
                ],
              ),
      ),
    );
  }
}
