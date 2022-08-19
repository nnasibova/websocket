import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

class NotificationAwesome extends  StatefulWidget {
  @override
  State<NotificationAwesome> createState() => _HomeState();
}

class _HomeState extends State<NotificationAwesome> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Local Notification in Flutter"),
            backgroundColor: Colors.deepOrangeAccent,
        ),
        body: Container( 
            alignment: Alignment.topCenter,
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                    ElevatedButton(
                      onPressed: () async {
                            bool isallowed = await AwesomeNotifications().isNotificationAllowed();
                            if (!isallowed) {
                              //no permission of local notification
                              AwesomeNotifications().requestPermissionToSendNotifications();
                            }else{
                                //show notification
                                AwesomeNotifications().createNotification(
                                    content: NotificationContent( //simgple notification
                                        id: 123,
                                        channelKey: 'basic', //set configuration wuth key "basic"
                                        title: 'Welcome to FlutterCampus.com',
                                        body: 'This simple notification with action buttons in Flutter App',
                                        payload: {"name":"FlutterCampus"},
                                        autoDismissible: false,
                                    ),

                                    actionButtons: [
                                        NotificationActionButton(
                                          key: "Yes", 
                                          label: "Yes",
                                        ),

                                        NotificationActionButton(
                                          key: "No", 
                                          label: "No",
                                        )
                                    ]
                                );
                           }
                      }, 
                      child: Text("Show Notification With Button")
                    ),
                    
              ],
            ),
        ),
    );
  } 
}