//Flutter Packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routinger/config/theme_provider.dart';

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
        inactiveThumbColor: Theme.of(context).primaryColor,
        title: Text(
          'Dark Mode',
          style: TextStyle(
            color: Theme.of(context).textTheme.headlineMedium!.color,
          ),
        ),
        subtitle: Text(
          'Toggle Dark Mode for better \n readability',
          style: TextStyle(
            color: Theme.of(context).textTheme.headlineMedium!.color,
          ),
        ),
        isThreeLine: true,
        value: Provider.of<ThemeProvider>(context).isDarkMode,
        onChanged: (bool newVal) {
          Provider.of<ThemeProvider>(context, listen: false)
              .toggleTheme(newVal);
          setState(() {
            darkModeToggle = newVal;
          });
        },
        controlAffinity: ListTileControlAffinity.leading,
      ),
    );
  }
}
