import 'dart:async';
import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';

class FCM {
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  final dataControl = StreamController<String>.broadcast();
  final titleControl = StreamController<String>.broadcast();
  final bodyControl = StreamController<String>.broadcast();

  setNotification() async {
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
        alert: true, sound: true, badge: true, provisional: false);

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print("user granted permission");

      foregroundNotification();
      backgroundNotification();
      terminateNotification();
    }

    final token = _firebaseMessaging
        .getToken()
        .then((value) => print("FCM Token : $value"));
  }

  void foregroundNotification() {
    FirebaseMessaging.onMessage.listen((event) {
      print("Foreground Notification");

      if (event.data.isNotEmpty) {
        dataControl.sink.add(jsonEncode(event.data));
      }

      if (event.notification != null) {
        titleControl.sink.add(event.notification!.title!);
        bodyControl.sink.add(event.notification!.body!);
      }
    });
  }

  void backgroundNotification() {
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      print("Background Notification");

      if (event.data.isNotEmpty) {
        dataControl.sink.add(jsonEncode(event.data));
      }

      if (event.notification != null) {
        titleControl.sink.add(event.notification!.title!);
        bodyControl.sink.add(event.notification!.body!);
      }
    });
  }

  void terminateNotification() async {
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      print("Terminate Notification");

      if (initialMessage.data.isNotEmpty) {
        dataControl.sink.add(jsonEncode(initialMessage.data));
      }

      if (initialMessage.notification != null) {
        titleControl.sink.add(initialMessage.notification!.title!);
        bodyControl.sink.add(initialMessage.notification!.body!);
      }
    }
  }

  @override
  void dispose() {
    dataControl.close();
    titleControl.close();
    bodyControl.close();
  }
}
