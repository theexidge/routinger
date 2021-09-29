import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';

// Third Party Packages Imports
import 'package:provider/provider.dart';
import 'package:routinger/constants/enums.dart';
import 'package:routinger/provider/charts_stats.dart';
import 'package:routinger/provider/experience_points.dart';

// Helper Imports
import '../helper/db_helper.dart';

// Services Imports
import '../services/notifications.dart';

// Provider Imports
import '../provider/task.dart';
import '../provider/tasks.dart';

class RecurringCard extends StatelessWidget {
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
    final recurringTask = Provider.of<RecurringTask>(context);
    return ListTile(
      title: Text(
        recurringTask.taskName,
        style: TextStyle(
          fontFamily: 'KleeOne',
        ),
      ),
      subtitle: Wrap(
        children: [
          Text(
            recurringTask.remindTime,
            style: TextStyle(
              fontFamily: 'KleeOne',
            ),
          ),
          getIcon(recurringTask.difficulty),
        ],
      ),
      trailing: Wrap(
        children: [
          IconButton(
            onPressed: () {
              Provider.of<Tasks>(context, listen: false)
                  .removeRecurring(recurringTask.id);
              DBHelper.deleteRecurring(recurringTask.id);
              var tempList = recurringTask.getRecurringTaskId();
              for (int i = 0; i < tempList.length; i++) {
                NotificationService().cancelNotification(tempList[i]);
              }
            },
            icon: Icon(Icons.delete),
          ),
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () {
              Provider.of<ExperiencePoints>(context, listen: false)
                  .addPointsWithDifficulty(recurringTask.difficulty);
              Provider.of<ChartStats>(context, listen: false)
                  .addTaskCompleted();
            },
          ),
        ],
      ),
    );
  }
}
