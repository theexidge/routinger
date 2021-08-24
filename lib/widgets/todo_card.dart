import 'package:flutter/material.dart';

// Third Party Packages
import 'package:provider/provider.dart';

// Provider Imports
import '../provider/task.dart';
import '../provider/tasks.dart';

class ToDoCard extends StatefulWidget {
  @override
  _ToDoCardState createState() => _ToDoCardState();
}

class _ToDoCardState extends State<ToDoCard> {
  bool _isOver = false;
  @override
  Widget build(BuildContext context) {
    final toDo = Provider.of<Task>(context);
    return CheckboxListTile(
      value: _isOver,
      controlAffinity: ListTileControlAffinity.leading,
      onChanged: (bool? newVal) {
        setState(() {
          _isOver = newVal as bool;
        });
      },
      title: Text(
        toDo.taskName,
        style: _isOver
            ? TextStyle(
                fontFamily: 'KleeOne',
                decoration: TextDecoration.lineThrough,
              )
            : TextStyle(
                fontFamily: 'KleeOne',
              ),
      ),
      secondary: IconButton(
        onPressed: () {
          print(toDo.id);
          Provider.of<Tasks>(context, listen: false).removeTask(toDo.id);
        },
        icon: Icon(Icons.delete),
      ),
    );
  }
}
