import 'dart:developer';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:permission_handler/permission_handler.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:injectable/injectable.dart' as injectable;

abstract class NotificationsService {
  Future<void> scheduleNotification({required DateTime dateTime});
  Future<bool> requestPermissionIfNeeded();
  Future<void> cancelNotification();
  Future<void> cancelAllNotifiations();
}

@injectable.Order(-3)
@injectable.Singleton(as: NotificationsService)
class NotificationsServiceImpl implements NotificationsService {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  NotificationsServiceImpl() {
    _initializeNotifications();
  }

  // Initialize the notifications
  void _initializeNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings(('@mipmap/ic_launcher'));

    const DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings();

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );
    try {
      await _flutterLocalNotificationsPlugin.initialize(
        initializationSettings,
        onDidReceiveNotificationResponse: (NotificationResponse response) {
          // Handle notification action when the app is opened
          _handleNotificationAction(response.payload);
        },
      );

      // Initialize timezone data
      tz.initializeTimeZones();
    } catch (e) {
      log("Error initializing notifications: $e");
    }
  }

  @override
  Future<bool> requestPermissionIfNeeded() async {
    // Check if notification permission is denied
    if (await Permission.notification.isDenied) {
      // Request notification permission
      final notificationPermission = await _flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()!
          .requestNotificationsPermission();
      final exactAlarmPermission = await _flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()!
          .requestExactAlarmsPermission();

      // Return true if permission is granted
      return notificationPermission == true && exactAlarmPermission == true;
    }

    // If permission was already granted
    if (await Permission.notification.isGranted) {
      return true;
    }

    // If the permission is denied or restricted, return false
    return false;
  }

  Future<void> _createNotificationChannel() async {
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'schedule_notification_channel_id', // Channel ID
      'Schedule Notification', // Channel Name
      description: 'Schedule notification for clock out', // Channel Description
      importance: Importance.max,
    );
    try {
      await _flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(channel);
    } catch (e) {
      log('Error creating notification channel: $e');
    }
  }

  @override
  Future<void> scheduleNotification({required DateTime dateTime}) async {
    // Check and request permission if needed
    bool permissionGranted = await requestPermissionIfNeeded();
    if (!permissionGranted) {
      log('Notification permission denied');
      return;
    }

    // Initialize time zones if not already done globally
    tz.initializeTimeZones();

    // Create notification channel if needed
    await _createNotificationChannel();

    // Setup notification details with action buttons
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'schedule_notification_channel_id',
      'Schedule Notification',
      channelDescription: 'Schedule notification for clock out',
      importance: Importance.max,
      priority: Priority.high,
    );

    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    // Get current date in Cairo timezone
    final tz.TZDateTime localNow =
        tz.TZDateTime.now(tz.getLocation("Africa/Cairo"));

    // Combine the time from the passed dateTime with the current date
    final tz.TZDateTime scheduledTime = tz.TZDateTime(
      tz.getLocation("Africa/Cairo"),
      localNow.year,
      localNow.month,
      localNow.day,
      dateTime.hour,
      dateTime.minute,
      dateTime.second,
    );

    // Log the current local and scheduled times
    log('System time (UTC): ${DateTime.now()}'); // Log system time (UTC)
    log('Current local time in Cairo: $localNow'); // Log Cairo timezone time
    log('Scheduled time in Cairo timezone: $scheduledTime'); // Log scheduled time

    // Check if the scheduled time is in the past
    if (scheduledTime.isBefore(localNow)) {
      log('Scheduled time $scheduledTime is in the past.');
      return;
    }

    // If the scheduled time is valid (in the future), schedule the notification
    int notificationId = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    try {
      await _flutterLocalNotificationsPlugin.zonedSchedule(
        notificationId,
        'Time to Clock Out!',
        'You have exceeded your full working hours. Do not forget to clock out if you are done for the day.',
        scheduledTime, // Schedule notification using the correctly parsed time
        platformChannelSpecifics,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
      );
    } catch (e) {
      log('Error scheduling notification: $e');
    }
  }

  @override
  Future<void> cancelNotification() async {
    await _flutterLocalNotificationsPlugin.cancel(0);
  }

  @override
  Future<void> cancelAllNotifiations() async {
    await _flutterLocalNotificationsPlugin.cancelAll();
  }

  void _handleNotificationAction(String? payload) {
    if (payload == 'accept_action') {
      log('Accepted');
    } else if (payload == 'decline_action') {
      log('Declined');
    }
  }
}
