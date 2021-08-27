import 'package:flutter/material.dart';

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
  }

  void setWakeUpTime(TimeOfDay newWakeUpTime) {
    _wakeUpTime = newWakeUpTime;
  }
}
