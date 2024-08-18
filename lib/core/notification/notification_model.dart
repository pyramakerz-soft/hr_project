// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

class NotificationModel {
  final String fcmToken;
  NotificationModel({
    required this.fcmToken,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'fcmToken': fcmToken,
      'platform': Platform.isAndroid ? 'Android' : 'IOS',
      'date': DateTime.now(),
    };
  }
}
