import 'package:flutter/material.dart';

// Third Party Packages
import 'package:provider/provider.dart';

// Provider Imports
import '../provider/tasks.dart';

// Widgets Imports
import './toDo_card.dart';

class ListOfTasks extends StatefulWidget {
  const ListOfTasks({Key? key}) : super(key: key);

  @override
  _ListOfTasksState createState() => _ListOfTasksState();
}

class _ListOfTasksState extends State<ListOfTasks> {
  List<TaskProfile> _taskProfile = [
    TaskProfile('To Dos', false),
  ];
  @override
  Widget build(BuildContext context) {
    final toDos = Provider.of<Tasks>(context).getToDos();
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
      child: ExpansionPanelList(
        expansionCallback: (int index, bool isExpanded) {
          setState(() {
            _taskProfile[index].isExpanded = !isExpanded;
          });
        },
        children: [
          ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return ListTile(
                title: Text(
                  _taskProfile[0].headerValue,
                  style: TextStyle(
                    fontFamily: 'KleeOne',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              );
            },
            body: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
                value: toDos[i],
                child: ToDoCard(),
              ),
              itemCount: Provider.of<Tasks>(context).toDosLength(),
            ),
            isExpanded: _taskProfile[0].isExpanded,
          ),
        ],
      ),
    );
  }
}

class TaskProfile {
  String headerValue;
  bool isExpanded;

  TaskProfile(this.headerValue, this.isExpanded);
}
