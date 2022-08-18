import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'model/user_model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var myStreamController = StreamController<bool>.broadcast();

  bool showvalue = false;
  List<Data> userList = [];

  final TextEditingController _controller = TextEditingController();
  final _channel = WebSocketChannel.connect(
    Uri.parse('wss://simple-realtime-server.herokuapp.com'),
  );

  @override
  void initState() {
 _channel.stream.listen((event) {
      updateList(Data.fromJson(jsonDecode(event)));
    });

    super.initState();
  }

  @override
  void dispose() {
    _channel.sink.close();
    _controller.dispose();
    super.dispose();
  }

  void updateList(Data data) {
    setState(() {
      if(showvalue == false) {
  if (userList.length <= 5) {
        userList = [data, ...userList];
        return;
      }
      userList.removeAt(userList.length - 1);
      userList = [data, ...userList];
      } else {
        userList;
      }
    
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All users"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
            child: Column(
          children: [
            Column(
              children: userList
                  .map((e) => Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: Image.network(
                                    e.avatar!,
                                    fit: BoxFit.cover,
                                  )),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(e.username!),
                                  Text(e.email!),
                                  Text(e.birthdate!),
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
            Checkbox(
              value: showvalue,
              onChanged: (value) {
                setState(() {
                  showvalue = value!;
                  print(showvalue);
                });
              },
            ),
          ],
        )),
      ),
    );
  }
}
