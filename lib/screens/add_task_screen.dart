//Flutter Packages
import 'package:flutter/material.dart';

// Third Party Packages
import 'package:provider/provider.dart';

// Provider Imports
import '../provider/tasks.dart';

// Widget Imports
import '../widgets/add_task_screen/task_form.dart';

class AddTask extends StatelessWidget {
  static final routeName = '/add-task';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Task',
        ),
      ),
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
            value: Tasks(),
          ),
        ],
        child: TaskForm(),
      ),
    );
  }
}
