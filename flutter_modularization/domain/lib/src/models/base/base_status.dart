import 'package:json_annotation/json_annotation.dart';

part 'base_status.g.dart';

@JsonSerializable()
class BaseStatus {
  @JsonKey(name: 'response_status')
  ResponseStatus? responseStatus;

  BaseStatus({this.responseStatus});

  factory BaseStatus.fromJson(Map<String, dynamic> json) =>
      _$BaseStatusFromJson(json);

  Map<String, dynamic> toJson() => _$BaseStatusToJson(this);
}

@JsonSerializable()
class ResponseStatus {
  String? code;
  String? operation;
  String? message;
  @JsonKey(name: 'message_type')
  String? messageType;
  String? status;

  ResponseStatus({
    this.code,
    this.operation,
    this.message,
    this.messageType,
    this.status,
  });

  factory ResponseStatus.fromJson(Map<String, dynamic> json) {
    return _$ResponseStatusFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ResponseStatusToJson(this);
}
