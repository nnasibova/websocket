import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:websocket_proje/awesome_notification.dart';
import 'home_page.dart';
import 'notification_example.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  AwesomeNotifications().initialize('resource://drawable/ic_launcher', [
    // notification icon
    NotificationChannel(
      channelGroupKey: 'basic_test',
      channelKey: 'basic',
      channelName: 'Basic notifications',
      channelDescription: 'Notification channel for basic tests',
      channelShowBadge: true,
      importance: NotificationImportance.High,
      enableVibration: true,
    ),
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AwesomeNotifications().actionStream.listen((action) {
      if (action.buttonKeyPressed == "Yes") {
        print("Yes button is pressed");
      } else if (action.buttonKeyPressed == "No") {
        print("No button is pressed.");
      } else {
        print(action.payload); //notification was pressed
      }
    });
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NotificationAwesome(),
    );
  }
}
