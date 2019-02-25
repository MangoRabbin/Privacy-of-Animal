import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationHelper {
  FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;
  BuildContext _context;

  // Notification 세팅/초기화
  void initializeNotification(BuildContext context) {
    var initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettingsiOS =IOSInitializationSettings();

    var initializationSettings =InitializationSettings(
      initializationSettingsAndroid, initializationSettingsiOS
    );

    this._context = context;

    _flutterLocalNotificationsPlugin =FlutterLocalNotificationsPlugin();
    _flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onSelectNotification: _onSelectNotification);
  }

  // Notification 눌렀을 때 나오는 메시지
  Future<void> _onSelectNotification(String payload) async {
    showDialog(
      context: _context,
      builder: (_) => AlertDialog(
        title: Text('Payload'),
        content: Text('Payload: $payload'),
      )
    );
  }

  // Notification 메시지
  Future<void> showFriendsRequestNotification(QuerySnapshot friendsRequest) async {
    var android =AndroidNotificationDetails(
      'FriendsRequest Notification ID',
      'FriendsRequest Notification NAME',
      'FriendsRequest Notification',
      priority: Priority.High, importance: Importance.Max
    );
    var iOS =IOSNotificationDetails();
    var platform =NotificationDetails(android,iOS);

    String sender = friendsRequest.documentChanges[0].document.documentID;

    await _flutterLocalNotificationsPlugin.show(
      0, '친구 신청','$sender 님으로부터 친구신청이 왔습니다.',platform,
      payload: '친구 신청 알림'
    );
  }
}