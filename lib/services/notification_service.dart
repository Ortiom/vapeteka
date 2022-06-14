import 'dart:developer';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description:
        'This channel is used for important notifications.', // description
    importance: Importance.high,
    playSound: true);

class PushNotificationService {
  init() async {
    var initializationSettingsAndroid =
        const AndroidInitializationSettings('@drawable/vapeteka_push_logo');
    var initializationSettingsIOs = const IOSInitializationSettings();
    var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOs,
    );
    flutterLocalNotificationsPlugin.initialize(initializationSettings);

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      sound: true,
    );

    String? fcmToken = await FirebaseMessaging.instance.getToken();
    print("FCM TOKEN:");
    print(fcmToken);

    FirebaseMessaging _messaging = FirebaseMessaging.instance;
    if (Platform.isIOS) {
      _requestPermissionToNotifications(_messaging);
    }

    _messaging.getInitialMessage().then((RemoteMessage? message) async {
      log("getInitialMessage() is $message");
      if (message == null) {
        return;
      }

      log('Message is: $message');
      if (message.notification != null) {
        print('Message not null+');
      }
    });

    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

    //When the app is in the background, but not terminated.
    FirebaseMessaging.onMessageOpenedApp.listen(
      (RemoteMessage event) async {
        log("openedAppMessage is: $event");
      },
    );

    FirebaseMessaging.onMessage.listen((RemoteMessage event) async {
      RemoteNotification? notification = event.notification;

      AndroidNotification? android =
          Platform.isAndroid ? event.notification?.android : null;

      if (notification != null) {
        if (Platform.isAndroid && android != null) {
          flutterLocalNotificationsPlugin.show(
              notification.hashCode,
              notification.title,
              notification.body,
              NotificationDetails(
                android: AndroidNotificationDetails(
                  channel.id,
                  channel.name,
                  playSound: true,
                  icon: '@drawable/vapeteka_push_logo',
                ),
              ));
        }
      }
    });
  }

  Future<void> _requestPermissionToNotifications(
      FirebaseMessaging _messaging) async {
    final NotificationSettings settings = await _messaging.requestPermission();

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      if (kDebugMode) {
        print('User granted permission');
      }
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      if (kDebugMode) {
        print('User granted provisional permission');
      }
    } else {
      if (kDebugMode) {
        print('User declined or has not accepted permission');
      }
    }
  }
}
