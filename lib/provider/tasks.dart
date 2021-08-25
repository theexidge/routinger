import 'package:flutter/material.dart';

// Provider Imports
import './task.dart';

class Tasks with ChangeNotifier {
  static List<Task> toDosList = [
    Task(DateTime.now().toString(), 'Test Task', ''),
    Task('2', 'Task 2', ''),
  ];

  static List<ScheduledTask> scheduledList = [
    ScheduledTask(0, DateTime.now(), 'Test Scheduled', ''),
  ];

  void addToDo(String id, String taskName, String taskDesc) {
    toDosList = [...toDosList, Task(id, taskName, taskDesc)];
    notifyListeners();
  }

  void addScheduled(
      int id, String taskName, DateTime pickedDateTime, String taskDesc) {
    scheduledList = [
      ...scheduledList,
      ScheduledTask(id, pickedDateTime, taskName, taskDesc)
    ];
  }

  int toDosLength() {
    return toDosList.length;
  }

  int scheduledLength() {
    return scheduledList.length;
  }

  List<Task> getToDos() {
    return [...toDosList];
  }

  List<ScheduledTask> getScheduled() {
    return [...scheduledList];
  }

  void removeTask(String id) {
    toDosList.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  void removeScheduled(int id) {
    scheduledList.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
