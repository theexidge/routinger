import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// Third Party Packages
import 'package:provider/provider.dart';

// Helper Imports
import '../helper/db_helper.dart';

// Services Imports
import '../services/notifications.dart';

// Provider Imports
import '../provider/task.dart';
import '../provider/tasks.dart';

class ScheduledCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final scheduledTask = Provider.of<ScheduledTask>(context);
    return ListTile(
      title: Text(
        scheduledTask.taskName,
        style: TextStyle(
          fontFamily: 'KleeOne',
        ),
      ),
      subtitle: Text(
        DateFormat.yMMMMd().format(scheduledTask.pickedDateTime) +
            "   " +
            DateFormat.jm().format(scheduledTask.pickedDateTime),
        style: TextStyle(
          fontFamily: 'KleeOne',
        ),
      ),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: () {
          Provider.of<Tasks>(context, listen: false)
              .removeScheduled(scheduledTask.id);
          DBHelper.deleteScheduled(scheduledTask.id);
          NotificationService().cancelNotification(scheduledTask.id);
        },
      ),
    );
  }
}
