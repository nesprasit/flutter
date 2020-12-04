import 'package:flutter/material.dart';
import 'package:flutter_web_socket/src/chat_room.dart';

class ChatList extends StatefulWidget {
  @override
  _ChatListState createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  final chatList = [
    {
      "chat_id": "chat_1000",
      "chat_name": "Chat A",
    },
    {
      "chat_id": "chat_1001",
      "chat_name": "Chat B",
    },
    {
      "chat_id": "chat_1002",
      "chat_name": "Chat C",
    }
  ];

  final users = [
    'USER_A',
    'USER_B',
    'USER_C',
    'USER_D',
  ];

  List<DropdownMenuItem<String>> _dropdownMenuItem = [];
  String _currentUserItem = '';

  @override
  void initState() {
    super.initState();
    _currentUserItem = users[0];
    _dropdownMenuItem = users.map((String value) {
      return DropdownMenuItem<String>(
        value: value ?? '',
        child: Text(value ?? ''),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Flexible(
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: DropdownButton(
                  isExpanded: true,
                  items: _dropdownMenuItem,
                  value: _currentUserItem,
                  onChanged: (selected) {
                    setState(() {
                      _currentUserItem = selected;
                    });
                  },
                  hint: Container(
                    child: Text('selected user'),
                  ),
                ),
              ),
            ),
            Flexible(
                child: ListView.builder(
              itemCount: chatList.length,
              itemBuilder: (context, index) {
                final list = chatList[index];
                final chatId = list['chat_id'];
                final chatName = list['chat_name'];

                return ListTile(
                  title: Text(chatName),
                  onTap: () {
                    ChatRoom myWebSocker =
                        ChatRoom(chatId: chatId, user: _currentUserItem);

                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => myWebSocker));
                  },
                );
              },
            ))
          ],
        ),
      );
}
