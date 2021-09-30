import 'package:flutter/material.dart';
import 'package:routinger/constants/enums.dart';
import 'package:routinger/helper/util_functions.dart';
import 'package:routinger/services/sleep_cycle.dart';

// Services Imports
import '../services/notifications.dart';

// Provider Imports
import './task.dart';

// Helper Imports
import '../helper/db_helper.dart';

class Tasks with ChangeNotifier {
  static List<Task> toDosList = [];

  static List<ScheduledTask> scheduledList = [];

  static List<RecurringTask> recurringList = [
    // RecurringTask(0, 'Remind Every 8 Hours', 'Recuring Test', '', []),
  ];

  void addToDo(String id, String taskName, String taskDesc) {
    toDosList = [...toDosList, Task(id, taskName, taskDesc)];
    DBHelper.insert(
        'todo',
        {
          'id': id,
          'taskname': taskName,
          'taskdesc': taskDesc,
          'isOver': 'false',
        },
        1);
    notifyListeners();
  }

  void addScheduled(
      int id, String taskName, DateTime pickedDateTime, String taskDesc,
      {Difficulty difficultyOfTask = Difficulty.Easy}) {
    scheduledList = [
      ...scheduledList,
      ScheduledTask(id, pickedDateTime, taskName, taskDesc,
          difficulty: difficultyOfTask)
    ];
    int difficultyInt = difficultyToIntConverter(difficultyOfTask);
    DBHelper.insert(
        'user_scheduled',
        {
          'id': id,
          'taskName': taskName,
          'taskDesc': taskDesc,
          'dateTime': pickedDateTime.toString(),
          'difficulty': difficultyInt
        },
        2);
  }

  void addRecurring(int id, String remindTime, String taskName, String taskDesc,
      List<int> intList,
      {Difficulty difficultyOfTask = Difficulty.Easy}) {
    recurringList = [
      ...recurringList,
      RecurringTask(id, remindTime, taskName, taskDesc, intList,
          difficulty: difficultyOfTask)
    ];
    int difficultyInt = difficultyToIntConverter(difficultyOfTask);
    DBHelper.insert(
        'user_recurring',
        {
          'id': id,
          'taskName': taskName,
          'taskDesc': taskDesc,
          'remindTime': remindTime,
          'notifInts':
              intList.map<String>((e) => e.toString()).toList().join(','),
          'difficulty': difficultyInt,
        },
        3);
  }

  Future<void> fetchAndSetToDos() async {
    final dataList = await DBHelper.getData('todo', 1);
    if (dataList.isEmpty) {
      return;
    }
    toDosList = dataList
        .map((item) => Task(item['id'], item['taskname'], item['taskdesc'],
            (item['isOver'] as String).toLowerCase() == 'true'))
        .toList();
  }

  Future<void> fetchAndSetScheduled() async {
    final dataList = await DBHelper.getData('user_scheduled', 2);
    if (dataList.isEmpty) {
      return;
    }
    scheduledList = dataList
        .map((e) => ScheduledTask(e['id'], DateTime.parse(e['dateTime']),
            e['taskName'], e['taskDesc'],
            difficulty: intToDifficultyCoverter(
              e['difficulty'],
            )))
        .toList();
  }

  Future<void> fetchAndSetRecurring() async {
    final dataList = await DBHelper.getData('user_recurring', 3);
    if (dataList.isEmpty) {
      return;
    }
    recurringList = dataList
        .map((e) => RecurringTask(
            e['id'],
            e['remindTime'],
            e['taskName'],
            e['taskDesc'],
            (e['notifInts'] as String)
                .split(',')
                .map((e) => int.parse(e))
                .toList(),
            difficulty: intToDifficultyCoverter(e['difficulty'])))
        .toList();
  }

  Future<void> fetchAndSetSleepCycle() async {
    final dataList = await DBHelper.getDataSleepCycle('sleep_cycle');
    if (dataList.isEmpty) {
      return;
    }
    SleepCycle().setSleepTime(TimeOfDay(
        hour: int.parse(dataList[0]['sleepTimeHour']),
        minute: int.parse(dataList[0]['sleepTimeMinute'])));

    SleepCycle().setWakeUpTime(TimeOfDay(
        hour: int.parse(dataList[0]['wakeTimeHour']),
        minute: int.parse(dataList[0]['wakeTimeMinute'])));
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
