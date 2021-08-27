import 'package:flutter/material.dart';

// Third Party Packages Imports
import 'package:provider/provider.dart';

// Provider Imports
import '../provider/task.dart';
import '../provider/tasks.dart';

class RecurringCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final recurringTask = Provider.of<RecurringTask>(context);
    return ListTile(
      title: Text(
        recurringTask.taskName,
        style: TextStyle(
          fontFamily: 'KleeOne',
        ),
      ),
      subtitle: Text(
        recurringTask.remindTime,
        style: TextStyle(
          fontFamily: 'KleeOne',
        ),
      ),
      trailing: IconButton(
        onPressed: () {
          Provider.of<Tasks>(context, listen: false)
              .removeRecurring(recurringTask.id);
        },
        icon: Icon(Icons.delete),
      ),
    );
  }
}
