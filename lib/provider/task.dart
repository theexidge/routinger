import 'package:flutter/material.dart';

class Task with ChangeNotifier {
  final String id;
  final String taskName;
  final String taskDesc;
  bool isOver;

  Task(this.id, this.taskName, this.taskDesc, [this.isOver = false]);
}

class ScheduledTask with ChangeNotifier {
  final int id;
  final DateTime pickedDateTime;
  final String taskName;
  final String taskDesc;

  ScheduledTask(this.id, this.pickedDateTime, this.taskName, this.taskDesc);
}

class RecurringTask with ChangeNotifier {
  final int id;
  final String remindTime;
  final String taskName;
  final String taskDesc;
  List<int> _thisRecurringTaskIds = [];

  RecurringTask(this.id, this.remindTime, this.taskName, this.taskDesc,
      this._thisRecurringTaskIds);

  void addRecurringTaskId(int id) {
    _thisRecurringTaskIds.add(id);
  }

  List<int> getRecurringTaskId() {
    return [..._thisRecurringTaskIds];
  }
}
