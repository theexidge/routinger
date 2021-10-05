//Flutter Package
import 'package:flutter/material.dart';

// Third Party Packages
import 'package:provider/provider.dart';

// Provider Imports
import '../provider/tasks.dart';

// Widgets Imports
import 'cards/recurring_card.dart';
import 'cards/todo_card.dart';
import 'cards/scheduled_card.dart';

class ListOfTasks extends StatefulWidget {
  const ListOfTasks({Key? key}) : super(key: key);

  @override
  _ListOfTasksState createState() => _ListOfTasksState();
}

class _ListOfTasksState extends State<ListOfTasks> {
  List<TaskProfile> _taskProfile = [
    TaskProfile('To Dos', false),
    TaskProfile('Scheduled Tasks', false),
    TaskProfile('Recurring Tasks', false),
  ];

  @override
  Widget build(BuildContext context) {
    final toDos = Provider.of<Tasks>(context).getToDos();
    final scheduledTasks = Provider.of<Tasks>(context).getScheduled();
    final recurringTasks = Provider.of<Tasks>(context).getRecurring();
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
          ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return ListTile(
                title: Text(
                  _taskProfile[1].headerValue,
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
                value: scheduledTasks[i],
                child: ScheduledCard(),
              ),
              itemCount: Provider.of<Tasks>(context).scheduledLength(),
            ),
            isExpanded: _taskProfile[1].isExpanded,
          ),
          ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return ListTile(
                title: Text(
                  _taskProfile[2].headerValue,
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
                value: recurringTasks[i],
                child: RecurringCard(),
              ),
              itemCount: Provider.of<Tasks>(context).recurringLength(),
            ),
            isExpanded: _taskProfile[2].isExpanded,
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
