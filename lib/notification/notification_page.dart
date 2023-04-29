import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

import '../models/push_notification.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

Future _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print('Handling a background message: ${message.messageId}');
}

class _NotificationPageState extends State<NotificationPage> {
  FirebaseMessaging _messaging;
  PushNotification _notificationInfo;

  void registerNotification() async {
    // init the firebase app
    await Firebase.initializeApp();

    // instantiate firebase messaging
    _messaging = FirebaseMessaging.instance;

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    // on ios this helps to take the user permission
    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');

      // for handling the received notification
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        // Parse the message receiver
        PushNotification notification = PushNotification(
          title: message.notification.title,
          body: message.notification.body,
        );

        setState(() {
          _notificationInfo = notification;

          if (_notificationInfo != null) {
            showSimpleNotification(Text(_notificationInfo.title),
                subtitle: Text(_notificationInfo.body),
                background: Colors.blue,
                duration: Duration(seconds: 2));
          }
        });
      });
    } else {
      print('User declined or has not accepted permission');
    }
  }

  checkForInitalMessage() async {
    await Firebase.initializeApp();
    RemoteMessage initalMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    if (initalMessage != null) {
      // Parse the message receiver
      PushNotification notification = PushNotification(
        title: initalMessage.notification.title,
        body: initalMessage.notification.body,
      );

      setState(() {
        _notificationInfo = notification;
      });
    }
  }

  @override
  void initState() {
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      PushNotification notification = PushNotification(
        title: message.notification.title,
        body: message.notification.body,
      );

      setState(() {
        _notificationInfo = notification;
      });
    });

    checkForInitalMessage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notify'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _notificationInfo != null
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Title: ${_notificationInfo.title}'),
                    SizedBox(height: 8),
                    Text('Body: ${_notificationInfo.body}'),
                  ],
                )
              : Container(
                  child: Text('Empty'),
                )
        ],
      ),
    );
  }
}

class NotificationOverlay extends StatelessWidget {
  const NotificationOverlay({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
      child: MaterialApp(),
    );
  }
}
