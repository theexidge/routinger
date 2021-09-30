import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';

class SettingsScreenBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
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
      ],
    );
  }
}
