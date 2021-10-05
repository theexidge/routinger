//Flutter Package
import 'package:flutter/material.dart';

// Helper Imports
import '../helper/db_helper.dart';

class ChartStats with ChangeNotifier {
  List<DateTime> chartDates = [];
  List<double> tasksCompleted = [0, 0, 0, 0, 0, 0, 0];
  String? tasksCompletedString;

  void initialise(DateTime today) {
    if (chartDates.isEmpty) {
      _addingDatesToList(today);
    }
    for (int i = 0; i < chartDates.length; i++) {
      if (chartDates[i].year == today.year &&
          chartDates[i].month == today.month &&
          chartDates[i].day == today.day) {
        return;
      }
    }
    _addingDatesToList(today);
    _resettingThePointsList();

    notifyListeners();
  }

  void addTaskCompleted({int points = 1}) {
    tasksCompleted[DateTime.now().weekday] += points;
    _insertChartStats();
    notifyListeners();
  }

  double getMaximumTasksDouble() {
    double numToReturn = 0;
    for (int i = 0; i < tasksCompleted.length; i++) {
      if (numToReturn < tasksCompleted[i]) {
        numToReturn = tasksCompleted[i].toDouble();
      }
    }
    return numToReturn;
  }

  List<String> getDates() {
    return chartDates.map((e) => '${e.day}/${e.month}').toList();
  }

  void _addingDatesToList(DateTime today) {
    if (chartDates.length > 7) {
      return;
    }
    DateTime sundayOfTheWeek =
        DateTime.now().subtract(Duration(days: today.weekday));
    for (int i = 0; i < 7; i++) {
      chartDates.add(sundayOfTheWeek.add(Duration(days: i)));
    }
  }

  void _resettingThePointsList() {
    tasksCompleted = [0, 0, 0, 0, 0, 0, 0];
  }

  String? _getChartDatesString() {
    String? chartDatesStringCompare;
    for (int i = 0; i < chartDates.length; i++) {
      if (chartDatesStringCompare == null) {
        chartDatesStringCompare = chartDates[i].toString();
      } else {
        chartDatesStringCompare =
            chartDatesStringCompare + "," + chartDates[i].toString();
      }
    }
    print(chartDatesStringCompare);
    chartDatesStringCompare!.trim();
    return chartDatesStringCompare;
  }

  String? _getTasksCompletedString() {
    String? tasksCompletedStringCompare;
    for (int i = 0; i < tasksCompleted.length; i++) {
      if (tasksCompletedStringCompare == null) {
        tasksCompletedStringCompare = tasksCompleted[i].toString();
      } else {
        tasksCompletedStringCompare =
            tasksCompletedStringCompare + "," + tasksCompleted[i].toString();
      }
    }
    if (tasksCompletedString != tasksCompletedStringCompare) {
      tasksCompletedString = tasksCompletedStringCompare;
    }
    tasksCompletedString!.trim();
    return tasksCompletedString;
  }

  void _insertChartStats() {
    DBHelper.insert(
        'chart_stats',
        {
          'id': 1,
          'chartDates': _getChartDatesString(),
          'tasksCompleted': _getTasksCompletedString(),
        },
        3);
  }

  void _setValuesChartStats(String dateString, String pointsString) {
    List<double> onFlyListPoints = [];
    dateString.trim();
    pointsString.trim();

    final List<String> dateStringList = dateString.split(",");
    final List<String> pointsStringList = pointsString.split(",");
    pointsStringList.forEach((element) {
      double? tryParseInteger = double.tryParse(element);
      if (tryParseInteger != null) {
        onFlyListPoints.add(tryParseInteger);
      }
    });
    if (onFlyListPoints.length == 7) {
      tasksCompleted = onFlyListPoints;
    }
    if (chartDates.isNotEmpty) {
      return;
    }
    dateStringList.forEach((element) {
      DateTime? tryParseDateTime = DateTime.tryParse(element);
      if (tryParseDateTime != null) {
        chartDates.add(tryParseDateTime);
      }
    });
  }

  Future<void> setChartStats() async {
    final dataList = await DBHelper.getData('chart_stats', 3);
    if (dataList.isEmpty) {
      return;
    }
    dataList.forEach((element) {
      _setValuesChartStats(element['chartDates'], element['tasksCompleted']);
    });
  }
}
