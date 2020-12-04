// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todolist_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoListResponseModel _$TodoListResponseModelFromJson(
    Map<String, dynamic> json) {
  return TodoListResponseModel(
    statusCode: json['status_code'] as int ?? 0,
    statusMessage: json['status_message'] as String ?? '',
    data: (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : TodoListResponseData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$TodoListResponseModelToJson(
        TodoListResponseModel instance) =>
    <String, dynamic>{
      'status_code': instance.statusCode,
      'status_message': instance.statusMessage,
      'data': instance.data,
    };

TodoListResponseData _$TodoListResponseDataFromJson(Map<String, dynamic> json) {
  return TodoListResponseData(
    id: json['id'] as String,
    title: json['title'] as String,
    detail: json['detail'] as String,
    file: json['file'] as String,
  );
}

Map<String, dynamic> _$TodoListResponseDataToJson(
        TodoListResponseData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'detail': instance.detail,
      'file': instance.file,
    };
