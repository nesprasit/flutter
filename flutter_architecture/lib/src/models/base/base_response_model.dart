import 'package:json_annotation/json_annotation.dart';

part 'base_response_model.g.dart';

@JsonSerializable()
class BaseResponseModel {
  @JsonKey(name: 'status_code', defaultValue: 0)
  int statusCode;
  @JsonKey(name: 'status_message', defaultValue: '')
  String statusMessage;

  BaseResponseModel({this.statusCode, this.statusMessage});

  factory BaseResponseModel.fromJson(Map<String, dynamic> json) =>
      _$BaseResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$BaseResponseModelToJson(this);
}
