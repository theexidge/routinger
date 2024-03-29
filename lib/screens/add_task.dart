//Flutter Packages
import 'package:flutter/material.dart';

// Third Party Packages
import 'package:provider/provider.dart';

// Provider Imports
import '../provider/tasks.dart';

// Widget Imports
import '../widgets/add_task/task_form.dart';

class AddTask extends StatelessWidget {
  static final routeName = '/add-task';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme:
            IconThemeData(color: Theme.of(context).textTheme.headlineMedium!.color),
        title: Text(
          'Add Task',
          style: TextStyle(color: Theme.of(context).textTheme.headlineMedium!.color),
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
