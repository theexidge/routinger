import 'package:flutter/material.dart';

// Provider Imports
import './task.dart';

class Tasks with ChangeNotifier {
  static List<Task> toDosList = [
    Task(DateTime.now().toString(), 'Test Task', ''),
    Task('2', 'Task 2', ''),
  ];

  void addToDo(String id, String taskName, String taskDesc) {
    toDosList = [...toDosList, Task(id, taskName, taskDesc)];
    notifyListeners();
  }

  int toDosLength() {
    return toDosList.length;
  }

  List<Task> getToDos() {
    return [...toDosList];
  }

  void removeTask(String id) {
    toDosList.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
