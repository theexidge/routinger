//Flutter Packages
import 'package:flutter/material.dart';

//Widget Imports
import '../widgets/settings_screen_body.dart';

class SettingsScreen extends StatelessWidget {
  static final routeName = '/settings';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Routinger',
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.grey,
      ),
      body: SettingsScreenBody(),
    );
  }
}
