import 'dart:convert';
import 'dart:io';

class WebSocketManager {
  static final WebSocketManager _singleton = WebSocketManager._internal();

  factory WebSocketManager() {
    return _singleton;
  }

  WebSocketManager._internal();

  //wss://nes-web-socket.herokuapp.com/
  //ws://localhost:3000/
  String _url = 'wss://nes-web-socket.herokuapp.com/';

  Map<String, dynamic> _headers;
  bool _isClose = false;
  WebSocket _channel;
  Function(dynamic) _onReceiveMessage;

  connect(Map<String, dynamic> headers) async {
    _channel = await _connect(_headers = headers);
    print('Starting socket completed');
    _channel.done.then(
      (value) {
        print('done then');
        _reconnect(headers);
      },
    );

    _channel.listen(
      (event) {
        print('event $event');
        _onReceiveMessage?.call(event);
      },
      onDone: () {
        print('done');
        _reconnect(headers);
      },
      onError: (err) {
        print('error $err');
        _reconnect(headers);
      },
    );

    _isClose = false;
  }

  close(Map<String, dynamic> arguments) {
    _isClose = true;
    _channel?.close(1000, json.encode(arguments));
  }

  onReceiveMessage(Function receive) {
    this._onReceiveMessage = receive;
  }

  sendMessage(String message) {
    Map<String, dynamic> messages = Map.from(
      {
        'headers': _headers,
        'message': message,
      },
    );

    _channel..add(json.encode(messages));
  }

  _reconnect(Map<String, dynamic> headers) async {
    if (!_isClose) {
      await connect(headers);
    }
  }

  Future<WebSocket> _connect(Map<String, dynamic> headers) async {
    try {
      print('Starting socket connection...');
      return await WebSocket.connect(_url, headers: headers);
    } catch (e) {
      print("Socket reconnecting....");
      await Future.delayed(Duration(seconds: 7));
      return await _connect(headers);
    }
  }
}
