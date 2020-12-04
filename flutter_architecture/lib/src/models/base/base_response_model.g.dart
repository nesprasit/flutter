// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponseModel _$BaseResponseModelFromJson(Map<String, dynamic> json) {
  return BaseResponseModel(
    statusCode: json['status_code'] as int ?? 0,
    statusMessage: json['status_message'] as String ?? '',
  );
}

Map<String, dynamic> _$BaseResponseModelToJson(BaseResponseModel instance) =>
    <String, dynamic>{
      'status_code': instance.statusCode,
      'status_message': instance.statusMessage,
    };
