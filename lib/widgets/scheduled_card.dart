import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// Third Party Packages
import 'package:provider/provider.dart';
import 'package:routinger/provider/task.dart';
import '../provider/tasks.dart';

class ScheduledCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final scheduledTask = Provider.of<ScheduledTask>(context);
    return ListTile(
      title: Text(scheduledTask.taskName),
      subtitle: Text(
        DateFormat.yMMMMd().format(scheduledTask.pickedDateTime) +
            "   " +
            DateFormat.jm().format(scheduledTask.pickedDateTime),
      ),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: () {
          Provider.of<Tasks>(context, listen: false)
              .removeScheduled(scheduledTask.id);
        },
      ),
    );
  }
}
