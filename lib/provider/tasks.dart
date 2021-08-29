import 'package:flutter/material.dart';

// Services Imports
import '../services/notifications.dart';

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

  static List<RecurringTask> recurringList = [
    RecurringTask(0, 'Remind Every 8 Hours', 'Recuring Test', '', []),
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

  void addRecurring(int id, String remindTime, String taskName, String taskDesc,
      List<int> intList) {
    recurringList = [
      ...recurringList,
      RecurringTask(id, remindTime, taskName, taskDesc, intList)
    ];
  }

  int toDosLength() {
    return toDosList.length;
  }

  int scheduledLength() {
    return scheduledList.length;
  }

  int recurringLength() {
    return recurringList.length;
  }

  List<Task> getToDos() {
    return [...toDosList];
  }

  List<ScheduledTask> getScheduled() {
    return [...scheduledList];
  }

  List<RecurringTask> getRecurring() {
    return [...recurringList];
  }

  void removeTask(String id) {
    toDosList.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  Future<void> removeScheduled(int id) async {
    scheduledList.removeWhere((element) => element.id == id);
    await NotificationService().cancelNotification(id);
    notifyListeners();
  }

  void removeRecurring(int id) async {
    recurringList.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
