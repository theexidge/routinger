//Flutter Packages
import 'package:flutter/material.dart';
import 'package:routinger/constants/palette.dart';
//Screen Imports
import 'package:routinger/screens/home_screen.dart';
import 'package:routinger/screens/settings_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text('Hello User!'),
            automaticallyImplyLeading: false,
          ),
          //const Divider(),
          ListTile(
            leading: const Icon(Icons.home),
            title: Text('Home',style: TextStyle(color: kRoyalBlueDark),),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(HomeScreen.routeName);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings),
            title:  Text('Settings',style: TextStyle(color: kRoyalBlueDark),),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(SettingsScreen.routeName);
            },
          ),
          const Divider(),
        ],
      ),
    );
  }
}
