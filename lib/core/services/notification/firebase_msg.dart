import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseMsg {
  final msgService = FirebaseMessaging.instance;
  initFCM() async {
    await msgService.requestPermission();
    var token = await msgService.getToken();

    print("Token: $token");

    FirebaseMessaging.onBackgroundMessage(handleNotification);
    FirebaseMessaging.onMessage.listen(handleNotification);
  }

  initializeFCM() async {
    await msgService.requestPermission();

    var token = await msgService.getToken();
    print("FCM Token: $token");

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      // Handle foreground message
      print('Received a foreground message: ${message.messageId}');
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      // Handle background message when app is brought to foreground
      print('Message clicked!: ${message.messageId}');
    });

    RemoteMessage? initialMessage = await msgService.getInitialMessage();
    if (initialMessage != null) {
      // Handle the message which opened the app from a terminated state
      print(
        'App opened from terminated state by message: ${initialMessage.messageId}',
      );
    }
  }

  Future<void> handleNotification(RemoteMessage msg) async {}
}
