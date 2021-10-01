//Flutter Packages
import 'package:flutter/material.dart';

//Dart Packages
import 'package:mdi/mdi.dart';

//Widget Imports
import './settings_dark_mode_switch.dart';

class SettingsScreenBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          margin: const EdgeInsets.symmetric(vertical: 7.0, horizontal: 2.0),
          child: ListTile(
            leading: Icon(
              Mdi.google,
              size: 30,
            ),
            title: Text('Connect With Google Calendar'),
            subtitle: Text(
              'Connect with Google Calendar to' +
                  '\n' +
                  'synchronise your tasks with Calendar.',
              textAlign: TextAlign.justify,
            ),
            isThreeLine: true,
            onTap: () {
              // TODO: Implement connecting with Google Calendar
            },
          ),
        ),
        SettingsDarkModeSwitch(),
      ],
    );
  }
}
