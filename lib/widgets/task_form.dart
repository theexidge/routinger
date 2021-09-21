//Dart Packages
import 'dart:math';

import 'package:flutter/material.dart';

// Third Party Packages
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

// Services Imports
import '../services/notifications.dart';
import '../services/sleep_cycle.dart';

// Provider Imports
import '../provider/tasks.dart';

// Helper Imports
import '../helper/list_of_notif.dart';

class TaskForm extends StatefulWidget {
  @override
  _TaskFormState createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  late TextEditingController _titleController;
  late DateTime currentDate;
  late TimeOfDay curentTime;
  String dropDownValue = 'To-Do';
  int remindDropDownValue = 0;
  final List<String> _remindDropDownValues = [
    'Remind Every 30 min',
    'Remind Every Hour',
    'Remind Every 2 Hours',
    'Remind Every 3 Hours',
    'Remind Every 4 Hours',
    'Remind Every 5 Hours',
    'Remind Every 6 Hours',
    'Remind Every 7 Hours',
    'Remind Every 8 Hours',
    'Remind Every 9 Hours',
    'Remind Every 10 Hours',
    'Remind Every 11 Hours',
    'Remind Every 12 Hours',
  ];

  @override
  void initState() {
    _titleController = TextEditingController();
    currentDate = DateTime.now();
    curentTime = TimeOfDay(hour: currentDate.hour, minute: currentDate.minute);
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  int _randomInt() {
    int numberToReturn;
    int firstNum = Random().nextInt(10000000);
    int secondNum = Random().nextInt(9999999);

    if (firstNum >= secondNum) {
      numberToReturn = secondNum + 1;
      return numberToReturn;
    }
    numberToReturn = firstNum;
    return numberToReturn;
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2050),
    ) as DateTime;
    if (pickedDate != null && pickedDate != currentDate)
      setState(() {
        currentDate = pickedDate;
        curentTime =
            TimeOfDay(hour: currentDate.hour, minute: currentDate.minute);
        print(currentDate);
        print('Called');
      });
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ) as TimeOfDay;
    if (pickedTime != null)
      setState(() {
        print(pickedTime.hour);
        currentDate = currentDate.add(
          Duration(hours: pickedTime.hour, minutes: pickedTime.minute),
        );
        curentTime =
            TimeOfDay(hour: currentDate.hour, minute: currentDate.minute);
        print(currentDate);
        print(DateFormat.jm().format(currentDate));
      });
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
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
                width: double.infinity,
                child: DropdownButton(
                  isExpanded: true,
                  items: [
                    DropdownMenuItem(
                      child: Text('To-Do'),
                      value: 'To-Do',
                    ),
                    DropdownMenuItem(
                      child: Text('Scheduled-Task'),
                      value: 'Scheduled-Task',
                    ),
                    DropdownMenuItem(
                      child: Text('Recurring-Task'),
                      value: 'Recurring-Task',
                    ),
                  ],
                  value: dropDownValue,
                  onChanged: (String? newVal) {
                    if (newVal == null || newVal == dropDownValue) {
                      return;
                    }
                    setState(() {
                      dropDownValue = newVal;
                    });
                  },
                ),
              ),
              dropDownValue != "Scheduled-Task"
                  ? SizedBox(
                      height: 0,
                    )
                  : Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5.0, horizontal: 15.0),
                              child: Text(
                                DateFormat.yMMMd().format(currentDate),
                                style: TextStyle(
                                  fontFamily: 'KleeOne',
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5.0, horizontal: 15.0),
                              child: ElevatedButton.icon(
                                onPressed: () {
                                  _selectDate(context);
                                },
                                icon: Icon(Icons.date_range),
                                label: Text('Set Date'),
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5.0, horizontal: 15.0),
                              child: curentTime.minute < 10
                                  ? Text(
                                      '${curentTime.hour}:0${curentTime.minute}',
                                      style: TextStyle(
                                        fontFamily: 'KleeOne',
                                        fontSize: 16,
                                      ),
                                    )
                                  : Text(
                                      '${curentTime.hour}:${curentTime.minute}',
                                      style: TextStyle(
                                        fontFamily: 'KleeOne',
                                        fontSize: 16,
                                      ),
                                    ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5.0, horizontal: 15.0),
                              child: ElevatedButton.icon(
                                onPressed: () {
                                  _selectTime(context);
                                },
                                icon: Icon(Icons.alarm),
                                label: Text(
                                  'Set Time',
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
              dropDownValue != "Recurring-Task"
                  ? SizedBox(
                      height: 0,
                    )
                  : Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5.0, horizontal: 15.0),
                          width: double.infinity,
                          child: DropdownButton(
                            isExpanded: true,
                            value: remindDropDownValue,
                            items: _remindDropDownValues
                                .map<DropdownMenuItem>(
                                    (item) => DropdownMenuItem(
                                          child: Text(item),
                                          value: _remindDropDownValues
                                              .indexOf(item),
                                        ))
                                .toList(),
                            onChanged: (dynamic newVal) {
                              if (newVal == null) {
                                return;
                              } else {
                                setState(() {
                                  remindDropDownValue = newVal as int;
                                  // print(remindDropDownValue);
                                });
                              }
                            },
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5.0, horizontal: 15.0),
                          width: double.infinity,
                          child: Text(
                            'You will receive notifications between your Wake Up time and Sleep time only. Set them accordingly.',
                            softWrap: true,
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    )
            ],
          ),
        ),
        Container(
          width: double.infinity,
          child: ElevatedButton.icon(
            icon: Icon(Icons.add),
            onPressed: () async {
              if (_titleController.text.isEmpty) {
                return;
              }
              if (dropDownValue == 'Scheduled-Task') {
                final intChosen = _randomInt();
                final days = currentDate.day - DateTime.now().day;
                final hours = currentDate.hour - DateTime.now().hour;
                final minutes = currentDate.minute - DateTime.now().minute;

                if (days < 0) {
                  return;
                }
                if (days == 0 && hours < 0) {
                  return;
                }
                if (days == 0 && hours == 0 && minutes < 0) {
                  return;
                }

                // print('$days $hours $minutes');
                Provider.of<Tasks>(context, listen: false).addScheduled(
                  intChosen,
                  _titleController.text,
                  currentDate,
                  '',
                );

                Navigator.of(context).pop();
                await NotificationService().scheduledNotification(
                    intChosen, _titleController.text, '', days, hours, minutes);
                return;
              }
              if (dropDownValue == 'Recurring-Task') {
                List<ListOfNotif> listOfNotifTimes = [];
                DateTime dynamicTime = DateTime(
                  DateTime.now().year,
                  DateTime.now().month,
                  DateTime.now().day,
                  SleepCycle().wakeUpTime.hour,
                  SleepCycle().wakeUpTime.minute,
                );
                print('Running');
                if (remindDropDownValue == 0) {
                  for (int i = 0; i < 48; i++) {
                    dynamicTime = dynamicTime.add(Duration(minutes: 30));
                    if (dynamicTime.hour <
                            max(SleepCycle().wakeUpTime.hour,
                                SleepCycle().sleepTime.hour) &&
                        dynamicTime.hour >
                            min(SleepCycle().wakeUpTime.hour,
                                SleepCycle().sleepTime.hour)) {
                      print('Nope');
                    } else {
                      print(dynamicTime.toString() + " Your Time");
                      int _intChosen = _randomInt();
                      if (dynamicTime.hour < DateTime.now().hour ||
                          dynamicTime.minute < DateTime.now().minute) {
                        dynamicTime.add(Duration(days: 1));
                      }
                      final days = dynamicTime.day - DateTime.now().day;
                      final hours = dynamicTime.hour - DateTime.now().hour;
                      final minutes =
                          dynamicTime.minute - DateTime.now().minute;
                      listOfNotifTimes
                          .add(ListOfNotif(_intChosen, dynamicTime));
                      await NotificationService().recurringNotif(_randomInt(),
                          _titleController.text, '', days, hours, minutes);
                    }
                  }
                } else {
                  for (int i = 0; i < 24 / remindDropDownValue; i++) {
                    dynamicTime =
                        dynamicTime.add(Duration(hours: remindDropDownValue));
                    if (dynamicTime.hour <
                            max(SleepCycle().wakeUpTime.hour,
                                SleepCycle().sleepTime.hour) &&
                        dynamicTime.hour >
                            min(SleepCycle().wakeUpTime.hour,
                                SleepCycle().sleepTime.hour)) {
                      print('Nope');
                    } else {
                      print(dynamicTime.toString() + " Your Time");
                      int _intChosen = _randomInt();
                      listOfNotifTimes
                          .add(ListOfNotif(_intChosen, dynamicTime));
                    }
                  }
                }
                // print(listOfNotifTimes
                //         .map<int>((e) => e.intId)
                //         .toList()[0]
                //         .toString() +
                //     " " +
                //     listOfNotifTimes[0].intId.toString());
                Provider.of<Tasks>(context, listen: false).addRecurring(
                    _randomInt(),
                    _remindDropDownValues[remindDropDownValue],
                    _titleController.text,
                    '',
                    listOfNotifTimes.map<int>((e) => e.intId).toList());
                Navigator.of(context).pop();
                return;
              }
              final onFlyId = DateTime.now().toString();
              Provider.of<Tasks>(context, listen: false).addToDo(
                onFlyId,
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
