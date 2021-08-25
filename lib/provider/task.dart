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
