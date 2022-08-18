import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'home_page.dart';

void main() {
  runApp(const MyApp());
    final channel = WebSocketChannel.connect(
    Uri.parse('wss://simple-realtime-server.herokuapp.com'));

      channel.stream.listen(
    (data) {
      print(data);
    },
    onError: (error) => print(error),
  );


}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
        const title = 'WebSocket Demo';

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  MyHomePage(),
    );
  }
}

