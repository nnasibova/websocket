// import 'package:awesome_notifications/awesome_notifications.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// class NotificationExample extends StatefulWidget {
//   NotificationExample({Key? key}) : super(key: key);

//   @override
//   _NotificationExampleState createState() => _NotificationExampleState();
// }

// class _NotificationExampleState extends State<NotificationExample> {

//   late FlutterLocalNotificationsPlugin flutterNotificationPlugin;

//   @override
//   void initState() {

//     var initializationSettingsAndroid = const AndroidInitializationSettings('ic_launcher');

//     var initializationSettingsIOS = IOSInitializationSettings();

//     var initializationSettings = InitializationSettings(android: initializationSettingsAndroid, iOS: initializationSettingsIOS);

//     flutterNotificationPlugin = FlutterLocalNotificationsPlugin();

//     flutterNotificationPlugin.initialize(initializationSettings,onSelectNotification: onSelectNotification);

//   }


//   void  onSelectNotification(String? payload) {
//     showDialog(
//         context: context,
//         builder: (_) => AlertDialog(
//           title: Text(
//               "Hello Everyone"
//           ),
//           content: Text(
//               "$payload"
//           ),
//         )
//     );
//   }

//   @override
//   Widget build(BuildContext context) {

//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Notification"),
//       ),
//       body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               RaisedButton(
//                 child: Text(
//                     "Notification with Default Sound"
//                 ),
//                 onPressed: () {
//                   notificationDefaultSound();
//                 },
//               ),

           
              
//             ],
//           )
//       ),
//     );
//   }



//   Future notificationDefaultSound() async{

//     var androidPlatformChannelSpecifics =
//     AndroidNotificationDetails(
//       'Notification Channel ID',
//       'Channel Name',
//       importance: Importance.max,
//       priority: Priority.high,
//       icon: "@mipmap/ic_launcher"
//     );

//     var iOSPlatformChannelSpecifics =
//     IOSNotificationDetails();

//     var platformChannelSpecifics =
//     NotificationDetails(
//         android: androidPlatformChannelSpecifics,
//         iOS: iOSPlatformChannelSpecifics
//     );

//     flutterNotificationPlugin.show(
//         0,
//         'New Alert',
//         'How to show Local Notification',
//         platformChannelSpecifics,
//         payload: 'Default Sound'
//     );
//   }


// }