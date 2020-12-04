import 'package:flutter_provider/src/models/base/base_response_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'todolist_response_model.g.dart';

@JsonSerializable()
class TodoListResponseModel extends BaseResponseModel {
  List<TodoListResponseData> data;

  TodoListResponseModel({int statusCode, String statusMessage, this.data})
      : super(statusCode: statusCode, statusMessage: statusMessage);

  factory TodoListResponseModel.fromJson(Map<String, dynamic> json) =>
      _$TodoListResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$TodoListResponseModelToJson(this);
}

@JsonSerializable()
class TodoListResponseData {
  String id;
  String title;
  String detail;
  String file;

  TodoListResponseData({this.id, this.title, this.detail, this.file});

  factory TodoListResponseData.fromJson(Map<String, dynamic> json) =>
      _$TodoListResponseDataFromJson(json);

  Map<String, dynamic> toJson() => _$TodoListResponseDataToJson(this);
}
