//Flutter Packages
import 'package:flutter/material.dart';
import 'package:routinger/widgets/app_drawer/app_drawer.dart';

//Widget Imports
import '../widgets/settings/settings_screen_body.dart';

class SettingsScreen extends StatelessWidget {
  static final routeName = '/settings';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        title: Text(
          'Routinger',
          style: TextStyle(
            color: Theme.of(context).textTheme.headline4!.color,
          ),
        ),
      ),
      drawer: AppDrawer(),
      body: SettingsScreenBody(),
    );
  }
}
