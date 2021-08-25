import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class NotificationService with ChangeNotifier {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  Future<void> initialize() async {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();

    AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings('ic_launcher');

    IOSInitializationSettings iosInitializationSettings =
        IOSInitializationSettings();

    final InitializationSettings initializationSettings =
        new InitializationSettings(
            android: androidInitializationSettings,
            iOS: iosInitializationSettings);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> instantNotification() async {
    var android = AndroidNotificationDetails('id', 'channel', 'desc');
    var ios = IOSNotificationDetails();

    var platform = new NotificationDetails(android: android, iOS: ios);

    await _flutterLocalNotificationsPlugin
        .show(0, 'Demo', 'Demo Again', platform, payload: "Welcome");
  }

  Future<void> scheduledNotification(
    int id,
    String taskName,
    String taskInfo,
    int days,
    int hours,
    int minutes,
  ) async {
    tz.initializeTimeZones();
    await _flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      taskName,
      taskInfo,
      tz.TZDateTime.now(tz.local).add(
        Duration(
          hours: DateTime.now().timeZoneOffset.inHours + hours,
          minutes: DateTime.now().timeZoneOffset.inMinutes + minutes,
          days: days,
        ),
      ),
      const NotificationDetails(
          android: AndroidNotificationDetails(
              'scheduledNotif', 'scheduledNotif', 'scheduledNotif')),
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle: true,
    );
  }
}
