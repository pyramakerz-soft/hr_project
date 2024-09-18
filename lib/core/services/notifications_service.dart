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
    final iOSPlugin =
        _flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>();

    if (iOSPlugin != null) {
      final isIOSGranted = await iOSPlugin.requestPermissions(
        alert: true,
        badge: true,
        sound: true,
      );

      if (isIOSGranted == true) return true;

      return false;
    }

    if (await Permission.notification.isDenied) {
      final androidPermissionStatus = await Permission.notification.request();
      if (androidPermissionStatus.isGranted) return true;
      return false;
    }

    if (await Permission.notification.isGranted) {
      return true;
    }
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
      // actions: <AndroidNotificationAction>[
      //   AndroidNotificationAction(
      //     'accept_action',
      //     'Stay Clocked in',
      //     contextual: true,
      //     showsUserInterface: true,
      //   ),
      //   AndroidNotificationAction(
      //     'decline_action',
      //     'Clock out now',
      //     contextual: true,
      //     showsUserInterface: true,
      //   ),
      // ],
    );

    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    // Schedule the notification at the specified time
    final tz.TZDateTime scheduledTime = tz.TZDateTime.from(dateTime, tz.local);

    // Check if the scheduled time is in the past
    if (scheduledTime.isBefore(tz.TZDateTime.now(tz.local))) {
      log('Scheduled time is in the past: $scheduledTime');
      return;
    }

    int notificationId = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    try {
      await _flutterLocalNotificationsPlugin.zonedSchedule(
        notificationId,
        'Time to Clock Out!',
        'You have exceeded your full working hours. Do not forget to clock out if you are done for the day.',
        tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
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
    // Handle what happens when the notification is tapped
    if (payload == 'accept_action') {
      // Handle positive action, like Accept
      log('Accepted');
    } else if (payload == 'decline_action') {
      // Handle negative action, like Decline
      log('Declined');
    }
  }
}
