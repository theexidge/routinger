import 'package:flutter/material.dart';

class Task with ChangeNotifier {
  final String id;
  final String taskName;
  final String taskDesc;

  Task(this.id, this.taskName, this.taskDesc);
}
