import 'package:flutter/material.dart';

// Third PArty Packages
import 'package:provider/provider.dart';

// Widget Imports
import '../widgets/task_form.dart';

// Provider Imports
import '../provider/tasks.dart';

class AddTask extends StatelessWidget {
  static final routeName = '/add-task';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: const Text(
          'Add Task',
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
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
