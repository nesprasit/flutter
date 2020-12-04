import 'package:flutter/material.dart';
import 'package:flutter_web_socket/src/web_socket_manager.dart';

class ChatRoom extends StatefulWidget {
  List<String> messages = [];

  String user;
  String chatId;

  ChatRoom({this.chatId, this.user}) {
    // connect socket
    WebSocketManager().connect(Map.from(
      {
        'type': 'group',
        'chat': chatId,
        'user': user,
      },
    ));
  }

  @override
  _WebSockerState createState() => _WebSockerState();
}

class _WebSockerState extends State<ChatRoom> {
  TextEditingController messageInputController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    WebSocketManager().onReceiveMessage((data) {
      setState(() {
        widget.messages.add(data);
      });
    });
  }

  @override
  void dispose() {
    WebSocketManager().close(
      Map.from(
        {
          'chat': widget.chatId,
          'user': widget.user,
        },
      ),
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Flexible(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 10),
                    child: TextField(
                      controller: messageInputController,
                      decoration: InputDecoration(
                        hintText: 'Enter message.....',
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    final message = messageInputController.text;
                    if (message.isEmpty) return;

                    WebSocketManager().sendMessage(message);
                    messageInputController.text = '';
                  },
                  child: Text('Send'),
                )
              ],
            ),
            Flexible(
              child: ListView.builder(
                itemCount: widget.messages.length,
                reverse: false,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(widget.messages[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
