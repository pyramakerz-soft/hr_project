import 'dart:developer';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class NotificationsService {
  static final FlutterLocalNotificationsPlugin
      _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  static Future init() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings(('@drawable/notification'));

    const DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings();

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();
    // flutterLocalNotificationsPlugin.initialize(
    //   initializationSettings,
    // );
    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );
  }

  static void scheduleNotification(
      {required DateTime dateTime, String? title, String? body}) {
    tz.initializeTimeZones();
    final tz.TZDateTime localNow =
        tz.TZDateTime.now(tz.getLocation("Africa/Cairo"));
    final tz.TZDateTime scheduledTime = tz.TZDateTime(
      tz.getLocation("Africa/Cairo"),
      localNow.year,
      localNow.month,
      localNow.day,
      dateTime.hour,
      dateTime.minute,
      dateTime.second,
    );

    log('System time (UTC): ${DateTime.now()}');
    log('Current local time in Cairo: $localNow');
    log('Scheduled time in Cairo timezone: $scheduledTime');

    if (scheduledTime.isBefore(localNow)) {
      log('Scheduled time $scheduledTime is in the past.');
      return;
    }

    _flutterLocalNotificationsPlugin.zonedSchedule(
      2 + dateTime.minute,
      title ?? 'Time to Clock Out!',
      body ??
          'You have exceeded your full working hours. Do not forget to clock out if you are done for the day.',
      scheduledTime, // Schedule notification using the correctly parsed time
      const NotificationDetails(
          android: AndroidNotificationDetails(
        'schedule_notification_channel_id',
        'Schedule Notification',
        channelDescription: 'Schedule notification for clock out',
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'ticker',
        icon: '@drawable/notification',
      )),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  static Future cancelNotification(int id) async {
    await _flutterLocalNotificationsPlugin.cancel(id);
  }

  static Future cancelAll() async {
    await _flutterLocalNotificationsPlugin.cancelAll();
  }
}
