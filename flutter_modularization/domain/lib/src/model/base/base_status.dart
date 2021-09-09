
import 'package:json_annotation/json_annotation.dart';

part 'base_status.g.dart';

@JsonSerializable()
class BaseStatus {
  @JsonKey(name: "status_code", defaultValue: 0)
  int? statusCode = 0;
  @JsonKey(name: "status_message", defaultValue: '')
  String? statusMessage = '';

  BaseStatus({this.statusCode, this.statusMessage});

  factory BaseStatus.fromJson(Map<String, dynamic> json) =>
      _$BaseStatusFromJson(json);

  Map<String, dynamic> toJson() => _$BaseStatusToJson(this);
}