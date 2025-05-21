import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/services/notification/notification_detail_screen.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  //PUSH NOTIFICATION
  Future<void> firebaseMessaging() async {
    //firebase messaging intialize

    FirebaseMessaging messaging = FirebaseMessaging.instance;
    //FCM Token
    String? token = await messaging.getToken();

    print('FCM TOKEN:$token');

    //foreground notification

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      final title = message.notification?.title ?? "N/A";
      final body = message.notification?.body ?? "N/A";

      showDialog(
        context: context,
        builder: (builder) {
          return AlertDialog(
            title: Text(title),
            content: Text(
              body,
              maxLines: 1,
              style: TextStyle(overflow: TextOverflow.ellipsis),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancel"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (ctx) => NotificationDetailScreen(
                            title: title,
                            body: body,
                          ),
                    ),
                  );
                },
                child: Text("Next"),
              ),
            ],
          );
        },
      );
    });

    //app is not close but is in background
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      final title = message.notification?.title ?? "N/A";
      final body = message.notification?.body ?? "N/A";
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (ctx) => NotificationDetailScreen(title: title, body: body),
        ),
      );
    });

    //app is terminated state
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        final title = message.notification?.title ?? "N/A";
        final body = message.notification?.body ?? "N/A";
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (ctx) => NotificationDetailScreen(title: title, body: body),
          ),
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();
    firebaseMessaging();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: Text(
          "Push Notifications",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
    );
  }
}
