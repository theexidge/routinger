import 'package:flutter/material.dart';

class ChartStats with ChangeNotifier {
  List<DateTime> chartDates = [];
  List<int> tasksCompleted = [0, 0, 0, 0, 0, 0, 0];

  void initialise(DateTime today) {
    if (chartDates.isEmpty) {
      _addingDatesToList(today);
    }
    for (int i = 0; i < chartDates.length; i++) {
      if (chartDates[i].year == today.year &&
          chartDates[i].month == today.month &&
          chartDates[i].day == today.day) {
        print('Okay');
        return;
      }
    }
    _addingDatesToList(today);
    _resettingThePointsList();

    notifyListeners();
  }

  void addTaskCompleted({int points = 1}) {
    tasksCompleted[DateTime.now().weekday] += points;
  }

  int getMaximumTasksInteger() {
    int numToReturn = 0;
    for (int i = 0; i < tasksCompleted.length; i++) {
      if (numToReturn < tasksCompleted[i]) {
        numToReturn = tasksCompleted[i];
      }
    }
    return numToReturn;
  }

  List<String> getDates() {
    return chartDates.map((e) => '${e.day}/${e.month}').toList();
  }

  void _addingDatesToList(DateTime today) {
    DateTime sundayOfTheWeek =
        DateTime.now().subtract(Duration(days: today.weekday));
    for (int i = 0; i < 7; i++) {
      chartDates.add(sundayOfTheWeek.add(Duration(days: 1)));
    }
  }

  void _resettingThePointsList() {
    tasksCompleted = [0, 0, 0, 0, 0, 0, 0];
  }
}
