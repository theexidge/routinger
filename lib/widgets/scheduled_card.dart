// Dart Imports

// Flutter Libraries Imports
import 'package:flutter/material.dart';

// Third Party Packages
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:mdi/mdi.dart';
import 'package:routinger/provider/charts_stats.dart';

// Constant Imports
import '../constants/enums.dart';

// Helper Imports
import '../helper/db_helper.dart';

// Provider Imports
import '../provider/experience_points.dart';
import '../provider/task.dart';
import '../provider/tasks.dart';

// Services Imports
import '../services/notifications.dart';

class ScheduledCard extends StatelessWidget {
  Widget getIcon(Difficulty difficulty) {
    if (difficulty == Difficulty.Doable) {
      return Icon(
        Mdi.alphaM,
        color: Colors.orange,
      );
    } else if (difficulty == Difficulty.Hard) {
      return Icon(
        Mdi.alphaH,
        color: Colors.red,
      );
    }
    return Icon(
      Mdi.alphaE,
      color: Colors.green,
    );
  }

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
      subtitle: Wrap(
        children: [
          Text(
            DateFormat.yMMMMd().format(scheduledTask.pickedDateTime) +
                "   " +
                DateFormat.jm().format(scheduledTask.pickedDateTime),
            style: TextStyle(
              fontFamily: 'KleeOne',
            ),
          ),
          getIcon(scheduledTask.difficulty),
        ],
      ),
      trailing: Wrap(
        children: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              Provider.of<ExperiencePoints>(context, listen: false)
                  .subtractPoints(3);
              Provider.of<Tasks>(context, listen: false)
                  .removeScheduled(scheduledTask.id);
              DBHelper.deleteScheduled(scheduledTask.id);
              NotificationService().cancelNotification(scheduledTask.id);
            },
          ),
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () {
              Provider.of<ExperiencePoints>(context, listen: false)
                  .addPointsWithDifficulty(scheduledTask.difficulty);
              Provider.of<ChartStats>(context, listen: false)
                  .addTaskCompleted();
              Provider.of<Tasks>(context, listen: false)
                  .removeScheduled(scheduledTask.id);
              DBHelper.deleteScheduled(scheduledTask.id);
              NotificationService().cancelNotification(scheduledTask.id);
            },
          ),
        ],
      ),
    );
  }
}
