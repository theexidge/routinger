import 'package:flutter/material.dart';

// Third Party Packages
import 'package:provider/provider.dart';

// provider Imports
import '../provider/tasks.dart';

class TaskForm extends StatefulWidget {
  @override
  _TaskFormState createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  late TextEditingController _titleController;
  @override
  void initState() {
    _titleController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
                child: TextField(
                  controller: _titleController,
                  decoration: InputDecoration(
                    labelText: 'Task Name',
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          child: ElevatedButton.icon(
            icon: Icon(Icons.add),
            onPressed: () {
              Provider.of<Tasks>(context, listen: false).addToDo(
                DateTime.now().toString(),
                _titleController.text,
                '',
              );
              Navigator.of(context).pop();
            },
            label: Text(
              'Add Task',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            style: ButtonStyle(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ),
        ),
      ],
    );
  }
}
