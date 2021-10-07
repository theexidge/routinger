//Flutter Packages
import 'package:flutter/material.dart';

// Third Party Packages
import 'package:mdi/mdi.dart';
import 'package:provider/provider.dart';

//Constants Imports
import '../../../constants/enums.dart';

// Helper Imports
import '../../../helper/db_helper.dart';

// Provider Imports
import '../../../provider/task.dart';
import '../../../provider/tasks.dart';
import '../../../provider/charts_stats.dart';
import '../../../provider/experience_points.dart';

// Services Imports
import '../../../services/notifications.dart';

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
      isThreeLine: true,
      subtitle: Wrap(
        children: [
          Text(
            recurringTask.remindTime.split('y ')[0] +
                'y' +
                '\n' +
                recurringTask.remindTime.split('y ')[1],
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
