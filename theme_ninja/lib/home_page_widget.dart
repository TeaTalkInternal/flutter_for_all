import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theme_ninja/app_theme_provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _appThemeStateProvider = context.read(appThemeStateProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Theme Ninja',
        ),
      ),
      body: Container(
        child: Center(
          child: ElevatedButton(
            child: Text('Toggle App Theme'),
            onPressed: () => _appThemeStateProvider.toggleAppTheme(context),
          ),
        ),
      ),
    );
  }
}
