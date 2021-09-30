import 'package:flutter/material.dart';

// Third Party Packages
import 'package:provider/provider.dart';
import 'package:routinger/helper/db_helper.dart';

// Provider Imports
import '../provider/task.dart';
import '../provider/tasks.dart';

class ToDoCard extends StatefulWidget {
  @override
  _ToDoCardState createState() => _ToDoCardState();
}

class _ToDoCardState extends State<ToDoCard> {
  @override
  Widget build(BuildContext context) {
    final toDo = Provider.of<Task>(context);
    bool _isOver = toDo.isOver;
    return CheckboxListTile(
      value: _isOver,
      controlAffinity: ListTileControlAffinity.leading,
      onChanged: (bool? newVal) {
        setState(() {
          _isOver = newVal as bool;
          toDo.isOver = newVal;
          DBHelper.updateIsOver(toDo.id, _isOver);
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
          Provider.of<Tasks>(context, listen: false).removeTask(toDo.id);
          DBHelper.deleteToDo(toDo.id);
        },
        icon: Icon(Icons.delete),
      ),
    );
  }
}
