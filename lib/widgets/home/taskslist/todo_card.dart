//Flutter Import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Third Party Packages
import 'package:provider/provider.dart';

//Helper Imports
import '../../../helper/db_helper.dart';

// Provider Imports
import '../../../provider/task.dart';
import '../../../provider/tasks.dart';

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
        onPressed: () => showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: Center(child: Text('Delete Task ?')),
            content: Text('Are you sure, you want delete this task?'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  print('can');
                  Navigator.pop(context);
                },
                child: Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  print('del');
                  Provider.of<Tasks>(context, listen: false).removeTask(toDo.id);
                  DBHelper.deleteToDo(toDo.id);
                  Navigator.pop(context);
                },
                child: Text('Delete'),
              ),
            ],
          ),
        ),
        icon: Icon(Icons.delete),
      ),
    );
  }
}
