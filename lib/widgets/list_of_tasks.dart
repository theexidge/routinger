import 'package:flutter/material.dart';

class ListOfTasks extends StatefulWidget {
  const ListOfTasks({Key? key}) : super(key: key);

  @override
  _ListOfTasksState createState() => _ListOfTasksState();
}

class DummyData {
  DummyData(this.headerValue, this.expandedValue, this.isExpanded);

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

class _ListOfTasksState extends State<ListOfTasks> {
  List<DummyData> _dummy = [
    DummyData('Recurring Tasks', '', false),
    DummyData('Scheduled Tasks', '', false),
    DummyData('To Dos', '', false),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
      child: ExpansionPanelList(
        expansionCallback: (int index, bool isExpanded) {
          setState(() {
            _dummy[index].isExpanded = !isExpanded;
          });
        },
        children: _dummy
            .map<ExpansionPanel>(
              (DummyData dummy) => ExpansionPanel(
                  headerBuilder: (BuildContext _, bool isExpanded) => ListTile(
                        title: Text(
                          dummy.headerValue,
                          style: TextStyle(
                            fontFamily: 'KleeOne',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                  body: Column(
                    children: [
                      Text(
                        dummy.expandedValue,
                        style: TextStyle(
                          fontFamily: 'KleeOne',
                        ),
                      ),
                    ],
                  ),
                  isExpanded: dummy.isExpanded),
            )
            .toList(),
      ),
    );
  }
}
