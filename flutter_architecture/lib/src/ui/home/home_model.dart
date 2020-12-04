import 'package:flutter_provider/src/models/todo/todolist_response_model.dart';

class TodoListData {
  bool isExpanded = false;
  TodoListResponseData data;

  TodoListData({this.isExpanded = false,this.data});
}
