import 'package:flutter/material.dart';
import 'package:flutter_provider/src/di/service_locator.dart';
import 'package:flutter_provider/src/models/todo/todolist_response_model.dart';
import 'package:flutter_provider/src/remote/repository/home_repository.dart';
import 'package:flutter_provider/src/remote/response_result.dart';
import 'package:flutter_provider/src/ui/home/home_model.dart';

class HomeViewModel {
  final _repo = serviceLocator<HomeRepository>();

  Future getTodoList(ResponseResult<TodoListResponseModel> result) async {
    result.obseverLoading();
    final json = await _repo.getTodoList();
    result.obseverComplete();
    json.data = TodoListResponseModel.fromJson(json.data);
    result?.obsever(json);
  }
}

class HomeTodoListData extends ChangeNotifier {
  List<TodoListData> data;

  setData(List<TodoListData> data) {
    this.data = data;
    this.notifyListeners();
  }

  updateItem(int index, TodoListData data) {
    this.data[index] = data;
    this.notifyListeners();
  }
}
