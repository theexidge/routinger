//Flutter Packages
import 'package:flutter/material.dart';

class SettingsDarkModeSwitch extends StatefulWidget {
  @override
  State<SettingsDarkModeSwitch> createState() => _SettingsDarkModeSwitchState();
}

class _SettingsDarkModeSwitchState extends State<SettingsDarkModeSwitch> {
  bool darkModeToggle = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SwitchListTile(
        title: Text('Dark Mode'),
        subtitle: Text('Toggle Dark Mode for better \n readability'),
        isThreeLine: true,
        value: darkModeToggle,
        onChanged: (bool newVal) {
          setState(() {
            darkModeToggle = newVal;
          });
        },
        controlAffinity: ListTileControlAffinity.leading,
      ),
    );
  }
}
