// ignore_for_file: unnecessary_null_comparison, avoid_print

import 'dart:developer';
import 'dart:io';
import 'dart:math' as math;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:pyramakerz_atendnace/core/app-preferances/app_preferances.dart';
import 'package:pyramakerz_atendnace/core/di/dependency_config.dart';


class PushNotificationHelper {
  static final FlutterLocalNotificationsPlugin
      _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  static String? currentUserId;
  math.Random random = math.Random();
  static void configurePush() {
    _setupLocalNotification();
    _requestAndGetToken();
    _attachListeners();
    _initLocalNotification();
  }

  static void _setupLocalNotification() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings("kmm");
    const DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings();
    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsDarwin,
    );
    await _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: _onDidReceiveNotificationResponse,
    );
    final NotificationAppLaunchDetails? notificationAppLaunchDetails =
        await _flutterLocalNotificationsPlugin
            .getNotificationAppLaunchDetails();
    if (notificationAppLaunchDetails != null &&
        notificationAppLaunchDetails.notificationResponse != null) {
      _onDidReceiveNotificationResponse(
        notificationAppLaunchDetails.notificationResponse!,
      );
    }
  }

  static void _onDidReceiveNotificationResponse(
    NotificationResponse notificationResponse,
  ) async {
    // if (payload == 'freshchat_user') {
    //   await appRouter.replaceAll([DashboaredScreenRoute()]);
    //   Freshchat.showConversations();
    // }
  }

  static void _requestAndGetToken() {
    if (Platform.isAndroid) {
      _flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()!
          .requestNotificationsPermission();
    }
    FirebaseMessaging.instance
      ..requestPermission()
      ..getToken().then(
        (fcmToken) {
          log("FCM TOKEN $fcmToken");

          // Freshchat.setPushRegistrationToken(fcmToken!);
          final AppPreferences appPreferences = getIt<AppPreferences>();
          if (fcmToken != null) {
            appPreferences.saveFirbaseNotificationToken(fcmToken);
          }
        },
      )
      ..onTokenRefresh.listen(
        (event) {
          log("NEW FCM TOKEN $event");
          // _appPreferences.saveFirbaseNotificationToken(event);
        },
      );
  }

  static void _attachListeners() {
    FirebaseMessaging.onMessage.listen(_onMessage);
    FirebaseMessaging.onBackgroundMessage(_onMyBackground);
    FirebaseMessaging.onMessageOpenedApp.listen(_onResume);
    FirebaseMessaging.instance.getInitialMessage().then(_onLaunch);
  }

  static Future<void> _onLaunch(RemoteMessage? message) async {
    if (message == null) return;
    log('WARNING HAVE NOTIFICATION: ${message.data['type']}');

    // if (message.data['source'] == 'freshchat_user') {
    _showLocationNotification(
      message,
    );
    // }
  }

  static Future<void> _onResume(RemoteMessage message) async {
    // log('On Resume ${message.data['title']}');
    // _showLocationNotification(message);
  }

  /// Handle in app notification
  static Future<void> _onMessage(RemoteMessage message) async {
    log('On Message ${message.notification?.body}');
    // if (message.data['source'] == 'freshchat_user') {
    _showLocationNotification(
      message,
    );
    // }
  }

  static Future<void> _onMyBackground(RemoteMessage message) async {
    log('On Background ${message.data['source']}');
    // if (message.data['source'] == 'freshchat_user') {
    // _showLocationNotification(
    //   message,
    // );
    // }
  }

  static void _initLocalNotification() {}

  static void _showLocationNotification(
    RemoteMessage notification,
  ) async {
    String title = notification.notification!.title!;
    String body = notification.notification!.body!;

    AndroidNotificationDetails androidPlatformChannelSpecifics =
        const AndroidNotificationDetails(
      'kmm fitness Channel',
      'kmm fitness',
      showWhen: true,
    );
    NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
    );
    await _flutterLocalNotificationsPlugin.show(
      math.Random().nextInt(100),
      title,
      body,
      platformChannelSpecifics,
    );
  }
}
// 1ck8N6EI48FMjPZhzQKP
