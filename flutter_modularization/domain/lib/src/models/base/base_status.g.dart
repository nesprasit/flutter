// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseStatus _$BaseStatusFromJson(Map<String, dynamic> json) {
  return BaseStatus(
    responseStatus: json['response_status'] == null
        ? null
        : ResponseStatus.fromJson(
            json['response_status'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$BaseStatusToJson(BaseStatus instance) =>
    <String, dynamic>{
      'response_status': instance.responseStatus,
    };

ResponseStatus _$ResponseStatusFromJson(Map<String, dynamic> json) {
  return ResponseStatus(
    code: json['code'] as String?,
    operation: json['operation'] as String?,
    message: json['message'] as String?,
    messageType: json['message_type'] as String?,
    status: json['status'] as String?,
  );
}

Map<String, dynamic> _$ResponseStatusToJson(ResponseStatus instance) =>
    <String, dynamic>{
      'code': instance.code,
      'operation': instance.operation,
      'message': instance.message,
      'message_type': instance.messageType,
      'status': instance.status,
    };
