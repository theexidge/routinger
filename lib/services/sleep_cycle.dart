import 'package:flutter/material.dart';
import 'package:routinger/helper/db_helper.dart';

class SleepCycle {
  static TimeOfDay _sleepTime = TimeOfDay(hour: 2, minute: 16);
  static TimeOfDay _wakeUpTime = TimeOfDay(hour: 10, minute: 16);

  TimeOfDay get sleepTime {
    return _sleepTime;
  }

  TimeOfDay get wakeUpTime {
    return _wakeUpTime;
  }

  void setSleepTime(TimeOfDay newSleepTime) {
    _sleepTime = newSleepTime;
    DBHelper.insertSleepCycle('sleep_cycle', {
      'id': 0,
      'sleepTimeHour': _sleepTime.hour.toString(),
      'sleepTimeMinute': _sleepTime.minute.toString(),
      'wakeTimeHour': _wakeUpTime.hour.toString(),
      'wakeTimeMinute': _wakeUpTime.minute.toString(),
    });
  }

  void setWakeUpTime(TimeOfDay newWakeUpTime) {
    _wakeUpTime = newWakeUpTime;
    DBHelper.insertSleepCycle('sleep_cycle', {
      'id': 0,
      'sleepTimeHour': _sleepTime.hour.toString(),
      'sleepTimeMinute': _sleepTime.minute.toString(),
      'wakeTimeHour': _wakeUpTime.hour.toString(),
      'wakeTimeMinute': _wakeUpTime.minute.toString(),
    });
  }
}
