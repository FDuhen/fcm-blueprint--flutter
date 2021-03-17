import 'package:fcm_cleanarch_flutter/commons/messaging_manager.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get_it/get_it.dart';

class BaseComponent extends StatelessWidget {
  final Widget child;

  BaseComponent({this.child});

  @override
  Widget build(BuildContext context) {
    MessagingManager manager = GetIt.I.get<MessagingManager>();

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification notification = message.notification;
      AndroidNotification android = message.notification?.android;

      if (notification != null && android != null) {
        manager.flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                MessagingManager.channel.id,
                MessagingManager.channel.name,
                MessagingManager.channel.description,
                // TODO add a proper drawable resource to android, for now using
                //      one that already exists in example app.
                icon: 'launch_background',
              ),
            ));
      }
    });


    return child;
  }
}
