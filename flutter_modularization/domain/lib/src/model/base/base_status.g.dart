// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseStatus _$BaseStatusFromJson(Map<String, dynamic> json) {
  return BaseStatus(
    statusCode: json['status_code'] as int? ?? 0,
    statusMessage: json['status_message'] as String? ?? '',
  );
}

Map<String, dynamic> _$BaseStatusToJson(BaseStatus instance) =>
    <String, dynamic>{
      'status_code': instance.statusCode,
      'status_message': instance.statusMessage,
    };
