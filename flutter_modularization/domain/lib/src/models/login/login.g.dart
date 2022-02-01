// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Login _$LoginFromJson(Map<String, dynamic> json) {
  return Login(
    responseStatus: json['response_status'] == null
        ? null
        : ResponseStatus.fromJson(
            json['response_status'] as Map<String, dynamic>),
    result: json['result'] == null
        ? null
        : Token.fromJson(json['result'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$LoginToJson(Login instance) => <String, dynamic>{
      'response_status': instance.responseStatus,
      'result': instance.result,
    };

Token _$TokenFromJson(Map<String, dynamic> json) {
  return Token(
    token: json['token'] as String?,
  );
}

Map<String, dynamic> _$TokenToJson(Token instance) => <String, dynamic>{
      'token': instance.token,
    };
