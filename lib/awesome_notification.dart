import 'dart:convert';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:websocket_proje/model/user_model.dart';

class NotificationAwesome extends StatefulWidget {
  @override
  State<NotificationAwesome> createState() => _HomeState();
}

class _HomeState extends State<NotificationAwesome> {
  final TextEditingController _controller = TextEditingController();
  final _channel = WebSocketChannel.connect(
    Uri.parse('wss://simple-realtime-server.herokuapp.com'),
  );

  @override
  void dispose() {
    _channel.sink.close();
    _controller.dispose();
    super.dispose();
  }

  void initState() {
 _channel.stream.listen((event) {
      Data f = Data.fromJson(jsonDecode(event));
        pushNotification(f.username,f.email);


    });
    

    super.initState();
  }

void pushNotification(title, body) async {
  bool isallowed = await AwesomeNotifications()
                      .isNotificationAllowed();
                  if (!isallowed) {
                    //no permission of local notification
                    AwesomeNotifications()
                        .requestPermissionToSendNotifications();
                  } else {
                    //show notification
                    AwesomeNotifications().createNotification(
                        content: NotificationContent(
                          //simgple notification
                          id: 123,
                          channelKey:
                              'basic', //set configuration wuth key "basic"
                          title: title,
                          body:body,
                             
                          payload: {"name": "FlutterCampus"},
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
                        ]);
                  }
}


String getExtracted(AsyncSnapshot<dynamic> snapshot, String info) {
    return snapshot.hasData ? '${jsonDecode(snapshot.data)[info]}' : '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Local Notification in Flutter"),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Container(
        width: 50,
        height: 50,
        color: Colors.red,
      )
    );
  }
}
