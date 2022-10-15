import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:rainbow/model/send_notification_model.dart';
import 'package:rainbow/screens/Home/settings/connections/connections_controller.dart';
import 'package:rainbow/screens/Home/settings/connections/connections_screen.dart';
import 'package:rainbow/screens/notification/notification_controller.dart';
import 'package:http/http.dart' as http;

class NotificationService {
  static final NotificationsController _notyController =
      Get.put(NotificationsController());

  static Future<void> init() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true, // Required to display a heads up notification
      badge: true,
      sound: true,
    );

    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      importance: Importance.max,
    );

    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    FirebaseMessaging.onMessage.listen((RemoteMessage? message) {
      RemoteNotification? notification = message?.notification;
      AndroidNotification? android = message?.notification?.android;

      // If `onMessage` is triggered with a notification, construct our own
      // local notification to show to users using the created channel.
      if (notification != null && android != null) {
        _notyController.getNotifications();
        Map<String, dynamic> payload = message!.data;
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              icon: android.smallIcon,
              // other properties...
            ),
          ),
          payload: jsonEncode(payload),
        );
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      _notyController.getNotifications();
      if (true) {
        Future.delayed(8.seconds, () {
          ConnectionsController connectionController =
              Get.put(ConnectionsController());
          connectionController.init();
          Get.to(() => ConnectionsScreen());
        });
      }
    });

    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) async {
      if (message != null) {
        Future.delayed(5.seconds, () {
          ConnectionsController connectionController =
              Get.put(ConnectionsController());
          connectionController.init();
          Get.to(() => ConnectionsScreen());
        });
      }
    });

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings(
            onDidReceiveLocalNotification: onDidReceiveLocalNotification);
    const InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsIOS);

    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (String? payload) async {
      if (payload != null) {
        if (true) {
          ConnectionsController connectionController =
              Get.put(ConnectionsController());
          connectionController.init();
          Get.to(() => ConnectionsScreen());
        }
      }
    });
  }

  static Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    _notyController.getNotifications();
  }

  static Future onDidReceiveLocalNotification(
    int id,
    String? title,
    String? body,
    String? payload,
  ) async {}

  static Future<String?> getToken() async {
    try {
      return await FirebaseMessaging.instance.getToken();
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  static FirebaseMessaging message = FirebaseMessaging.instance;

  static const String serverToken =
      'AAAAGtivm7A:APA91bE9gn9PIUo2AxRo8ADwUcYkiBFFg-XjKrlTok95L6rVdlwjseh-0HitR5rFt_hrAZUXFSxdlmfzGfG3UciEuAq4nTpumTsDOK35_ZVt0p-gKyrBQNomGROY5gkz7vUnVJFIenfv';

  static Future<String?> getFcmToken() async {
    return await message.getToken();
  }

  static Future<void> sendNotification(
      SendNotificationModel notification) async {
    await http.post(
      Uri.parse('https://fcm.googleapis.com/fcm/send'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'key=$serverToken',
      },
      body: jsonEncode(notification.toMap()),
    );
  }
}
