import 'package:flutter/material.dart';

class Task with ChangeNotifier {
  final String id;
  final String taskName;
  final String taskDesc;

  Task(this.id, this.taskName, this.taskDesc);
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

  RecurringTask(this.id, this.remindTime, this.taskName, this.taskDesc);
}
