//Flutter Packages
import 'package:flutter/material.dart';

// Third Party Packages
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'package:flutter_native_timezone/flutter_native_timezone.dart';

class NotificationService with ChangeNotifier {
  List<int> recurringNoificationIds = [];

  void addRecurringNotificationIds(int id) {
    recurringNoificationIds.add(id);
  }

  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  Future<void> initialize() async {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();

    AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const DarwinInitializationSettings darwinInitializationSettings =
        DarwinInitializationSettings();

    final InitializationSettings initializationSettings =
        InitializationSettings(
          android: androidInitializationSettings,
          iOS: darwinInitializationSettings,
        );

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> instantNotification() async {
    const android = AndroidNotificationDetails(
      'instant_channel',
      'Instant Notifications',
      channelDescription: 'Immediate notifications',
      importance: Importance.max,
      priority: Priority.high,
    );
    const ios = DarwinNotificationDetails();

    const platform = NotificationDetails(android: android, iOS: ios);

    await _flutterLocalNotificationsPlugin.show(
      0,
      'Demo',
      'Demo Again',
      platform,
      payload: "Welcome",
    );
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
    String dtz = await FlutterNativeTimezone.getLocalTimezone();
    if (dtz == "Asia/Calcutta") {
      dtz = "Asia/Kolkata";
    }
    final localTimeZone = tz.getLocation(dtz);
    tz.setLocalLocation(localTimeZone);

    await _flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      'Routinger',
      taskName,
      tz.TZDateTime.now(
        tz.local,
      ).add(Duration(hours: hours, minutes: minutes, days: days)),
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'scheduledNotif',
          'Scheduled Notifications',
          channelDescription: 'Scheduled task reminders',
          importance: Importance.max,
          priority: Priority.high,
        ),
        iOS: DarwinNotificationDetails(),
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      payload: taskInfo,
    );
  }

  Future<void> recurringNotif(
    int id,
    String taskName,
    String taskInfo,
    int days,
    int hours,
    int minutes,
  ) async {
    tz.initializeTimeZones();
    String dtz = await FlutterNativeTimezone.getLocalTimezone();
    if (dtz == "Asia/Calcutta") {
      dtz = "Asia/Kolkata";
    }
    final localTimeZone = tz.getLocation(dtz);
    tz.setLocalLocation(localTimeZone);

    // await _flutterLocalNotificationsPlugin.cancelAll();
    await _flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      'Routinger',
      taskName,
      tz.TZDateTime.now(
        tz.local,
      ).add(Duration(hours: hours, minutes: minutes, days: days)),
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'recurringNotif',
          'Recurring Notifications',
          channelDescription: 'Recurring task reminders',
          importance: Importance.max,
          priority: Priority.high,
        ),
        iOS: DarwinNotificationDetails(),
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      payload: taskInfo,
      matchDateTimeComponents: DateTimeComponents.time,
    );
    final List<PendingNotificationRequest> pendingNotificationRequests =
        await _flutterLocalNotificationsPlugin.pendingNotificationRequests();
    print("${pendingNotificationRequests.length} Something");
    for (int i = 0; i < pendingNotificationRequests.length; i++) {
      print("${pendingNotificationRequests[i].title} YES");
    }
  }

  Future<void> cancelNotification(int id) async {
    await _flutterLocalNotificationsPlugin.cancel(id);
  }
}
