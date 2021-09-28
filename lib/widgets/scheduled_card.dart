import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// Third Party Packages
import 'package:provider/provider.dart';
import 'package:routinger/constants/enums.dart';
import 'package:routinger/provider/experience_points.dart';

// Helper Imports
import '../helper/db_helper.dart';

// Services Imports
import '../services/notifications.dart';

// Provider Imports
import '../provider/task.dart';
import '../provider/tasks.dart';

class ScheduledCard extends StatelessWidget {
  Widget getIcon(Difficulty difficulty) {
    if (difficulty == Difficulty.Doable) {
      return Icon(
        Icons.exposure_plus_1,
        size: 18,
      );
    } else if (difficulty == Difficulty.Hard) {
      return Icon(
        Icons.exposure_plus_2,
        size: 18,
      );
    }
    return Icon(
      Icons.exposure_zero,
      size: 18,
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
      subtitle: Row(
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
