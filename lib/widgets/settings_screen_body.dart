import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';

class SettingsScreenBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(5.0),
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: Icon(Mdi.google),
            title: Text('Connect With Google Calendar'),
            subtitle: Text(
              'Connect with Google Calendar to' +
                  '\n' +
                  'synchronise your tasks with Calendar.',
              textAlign: TextAlign.justify,
            ),
            onTap: () {
              // TODO: Implement connecting with Google Calendar
            },
          ),
        ),
      ],
    );
  }
}
