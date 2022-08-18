import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> list = [];

  final TextEditingController _controller = TextEditingController();
  final _channel = WebSocketChannel.connect(
    Uri.parse('wss://simple-realtime-server.herokuapp.com'),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All users"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: list
                .map((e) => Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                                height: 50,
                                width: 50,
                                child: Image.network(
                                  jsonDecode(e)["avatar"].toString(),
                                  fit: BoxFit.cover,
                                )),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(jsonDecode(e)["username"].toString()),
                                Text(jsonDecode(e)["email"].toString()),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    _channel.stream.listen((event) => setState(() => list.add(event)));
    super.initState();
  }

  @override
  void dispose() {
    _channel.sink.close();
    _controller.dispose();
    super.dispose();
  }
}
