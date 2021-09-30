//Dart Packages
import 'dart:math';

import 'package:flutter/material.dart';

// Third Party Packages
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:routinger/constants/enums.dart';

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
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late TextEditingController _dateController;
  late TextEditingController _timeController;
  late DateTime currentDate;
  late TimeOfDay currentTime;

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

  Difficulty difficultyDropDownValue = Difficulty.Easy;

  int notifOnOrOffDropDownValue = 0;

  @override
  void initState() {
    currentDate = DateTime.now();
    currentTime = TimeOfDay(hour: currentDate.hour, minute: currentDate.minute);
    _titleController = TextEditingController();
    _dateController = TextEditingController();
    _timeController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _dateController.dispose();
    _timeController.dispose();
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
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2050),
    );
    if (pickedDate != null && pickedDate != currentDate)
      setState(() {
        currentDate = pickedDate;
        currentTime =
            TimeOfDay(hour: currentDate.hour, minute: currentDate.minute);
        _dateController.text = DateFormat.yMMMd().format(pickedDate);
      });
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    final tempDate = DateTime.now();
    currentDate = tempDate
        .subtract(Duration(hours: tempDate.hour, minutes: tempDate.minute));
    if (pickedTime != null)
      setState(() {
        currentDate = currentDate.add(
          Duration(hours: pickedTime.hour, minutes: pickedTime.minute),
        );
        currentTime =
            TimeOfDay(hour: currentDate.hour, minute: currentDate.minute);
        _timeController.text = pickedTime.toString().substring(10, 15);
      });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 15.0),
                  child: TextFormField(
                    controller: _titleController,
                    decoration: InputDecoration(
                      labelText: 'Task Name',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please name your task';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 15.0),
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
                dropDownValue == "To-Do"
                    ? SizedBox(
                        height: 0,
                      )
                    : Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 15.0),
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DropdownButton(
                              // isExpanded: true,
                              items: [
                                DropdownMenuItem(
                                  child: Text('Easy'),
                                  value: Difficulty.Easy,
                                ),
                                DropdownMenuItem(
                                  child: Text('Doable'),
                                  value: Difficulty.Doable,
                                ),
                                DropdownMenuItem(
                                  child: Text('Hard'),
                                  value: Difficulty.Hard,
                                ),
                              ],
                              value: difficultyDropDownValue,
                              onChanged: (Difficulty? newVal) {
                                if (newVal == null ||
                                    newVal == difficultyDropDownValue) {
                                  return;
                                }
                                setState(() {
                                  difficultyDropDownValue = newVal;
                                });
                              },
                            ),
                            DropdownButton(
                              // isExpanded: true,
                              items: [
                                DropdownMenuItem(
                                  child: Text('Notif On'),
                                  value: 0,
                                ),
                                DropdownMenuItem(
                                  child: Text('Notif Off'),
                                  value: 1,
                                ),
                              ],
                              value: notifOnOrOffDropDownValue,
                              onChanged: (int? newVal) {
                                if (newVal == null ||
                                    newVal == notifOnOrOffDropDownValue) {
                                  return;
                                }
                                setState(() {
                                  notifOnOrOffDropDownValue = newVal;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                dropDownValue != "Scheduled-Task"
                    ? SizedBox(
                        height: 0,
                      )
                    : Column(
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5.0, horizontal: 15.0),
                                child: GestureDetector(
                                  onTap: () => _selectDate(context),
                                  child: AbsorbPointer(
                                    child: TextFormField(
                                      controller: _dateController,
                                      keyboardType: TextInputType.datetime,
                                      decoration: InputDecoration(
                                        labelText: 'Task Date',
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please enter a date for your task';
                                        }
                                        return null;
                                      },
                                    ),
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
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5.0, horizontal: 15.0),
                                child: GestureDetector(
                                  onTap: () => _selectTime(context),
                                  child: AbsorbPointer(
                                    child: TextFormField(
                                      controller: _timeController,
                                      keyboardType: TextInputType.datetime,
                                      decoration: InputDecoration(
                                        labelText: 'Task Time',
                                      ),
                                      validator: (value) {
                                        final days = currentDate.day -
                                            DateTime.now().day;
                                        final hours = currentDate.hour -
                                            DateTime.now().hour;
                                        final minutes = currentDate.minute -
                                            DateTime.now().minute;
                                        final DateFormat formatter =
                                            DateFormat('yyyy-MM-dd');
                                        final DateTime now = DateTime.now();
                                        final String nowFormatted =
                                            formatter.format(now);
                                        final currentDateFormatted =
                                            formatter.format(currentDate);
                                        if (value!.isEmpty) {
                                          return 'Please enter a time for your task';
                                        } else if (value ==
                                                TimeOfDay.now()
                                                    .toString()
                                                    .substring(10, 15) &&
                                            currentDateFormatted ==
                                                nowFormatted) {
                                          return 'You cannot select the current time';
                                        }
                                        if (days < 0) {
                                          return 'Please provide a valid time';
                                        }
                                        if (days == 0 && hours < 0) {
                                          return 'Please provide a valid time';
                                        }
                                        if (days == 0 &&
                                            hours == 0 &&
                                            minutes < 0) {
                                          return 'Please provide a valid time';
                                        }
                                        return null;
                                      },
                                    ),
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
                if (_formKey.currentState!.validate()) {
                  if (dropDownValue == 'Scheduled-Task') {
                    final intChosen = _randomInt();
                    final days = currentDate.day - DateTime.now().day;
                    final hours = currentDate.hour - DateTime.now().hour;
                    final minutes = currentDate.minute - DateTime.now().minute;
                    Provider.of<Tasks>(context, listen: false).addScheduled(
                        intChosen, _titleController.text, currentDate, '',
                        difficultyOfTask: difficultyDropDownValue);

                    await NotificationService().scheduledNotification(intChosen,
                        _titleController.text, '', days, hours, minutes);

                    Navigator.of(context).pop();
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
                    if (remindDropDownValue == 0) {
                      for (int i = 0; i < 48; i++) {
                        dynamicTime = dynamicTime.add(Duration(minutes: 30));
                        if (dynamicTime.hour <
                                max(SleepCycle().wakeUpTime.hour,
                                    SleepCycle().sleepTime.hour) &&
                            dynamicTime.hour >
                                min(SleepCycle().wakeUpTime.hour,
                                    SleepCycle().sleepTime.hour)) {
                        } else {
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
                          await NotificationService().recurringNotif(
                              _randomInt(),
                              _titleController.text,
                              '',
                              days,
                              hours,
                              minutes);
                        }
                      }
                    } else {
                      for (int i = 0; i < 24 / remindDropDownValue; i++) {
                        dynamicTime = dynamicTime
                            .add(Duration(hours: remindDropDownValue));
                        if (dynamicTime.hour <
                                max(SleepCycle().wakeUpTime.hour,
                                    SleepCycle().sleepTime.hour) &&
                            dynamicTime.hour >
                                min(SleepCycle().wakeUpTime.hour,
                                    SleepCycle().sleepTime.hour)) {
                        } else {
                          int _intChosen = _randomInt();
                          listOfNotifTimes
                              .add(ListOfNotif(_intChosen, dynamicTime));
                        }
                      }
                    }

                    Provider.of<Tasks>(context, listen: false).addRecurring(
                        _randomInt(),
                        _remindDropDownValues[remindDropDownValue],
                        _titleController.text,
                        '',
                        listOfNotifTimes.map<int>((e) => e.intId).toList(),
                        difficultyOfTask: difficultyDropDownValue);
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
                }
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
      ),
    );
  }
}
