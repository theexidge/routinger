import 'package:flutter/material.dart';

// Services Imports
import '../services/sleep_cycle.dart';

class SleepCycleColumn extends StatefulWidget {
  @override
  _SleepCycleColumnState createState() => _SleepCycleColumnState();
}

class _SleepCycleColumnState extends State<SleepCycleColumn> {
  TimeOfDay wakeUpTime = SleepCycle().wakeUpTime;
  TimeOfDay sleepTime = SleepCycle().sleepTime;

  Future<void> _selectTime(BuildContext context, int index) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ) as TimeOfDay;
    if (pickedTime != null)
      setState(() {
        if (index == 0) {
          wakeUpTime =
              TimeOfDay(hour: pickedTime.hour, minute: pickedTime.minute);
          SleepCycle().setWakeUpTime(wakeUpTime);
        } else {
          sleepTime =
              TimeOfDay(hour: pickedTime.hour, minute: pickedTime.minute);
          SleepCycle().setSleepTime(sleepTime);
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
          child: wakeUpTime.minute < 10
              ? Text(
                  '${wakeUpTime.hour}:0${wakeUpTime.minute}',
                  style: TextStyle(
                    fontFamily: 'KleeOne',
                    fontSize: 16,
                  ),
                )
              : Text(
                  '${wakeUpTime.hour}:${wakeUpTime.minute}',
                  style: TextStyle(
                    fontFamily: 'KleeOne',
                    fontSize: 16,
                  ),
                ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
          child: ElevatedButton.icon(
            onPressed: () {
              _selectTime(context, 0);
            },
            icon: Icon(Icons.access_alarm),
            label: Text('Set Wake Time'),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
          child: sleepTime.minute < 10
              ? Text(
                  '${sleepTime.hour}:0${sleepTime.minute}',
                  style: TextStyle(
                    fontFamily: 'KleeOne',
                    fontSize: 16,
                  ),
                )
              : Text(
                  '${sleepTime.hour}:${sleepTime.minute}',
                  style: TextStyle(
                    fontFamily: 'KleeOne',
                    fontSize: 16,
                  ),
                ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
          child: ElevatedButton.icon(
            onPressed: () {
              _selectTime(context, 1);
            },
            icon: Icon(Icons.access_alarm),
            label: Text('Set Sleep Time'),
          ),
        )
      ],
    );
  }
}
