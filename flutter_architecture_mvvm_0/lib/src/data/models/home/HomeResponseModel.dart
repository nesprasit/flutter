import 'package:flutter_architecture_mvvm_0/src/data/models/base/BaseResponseModel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'HomeResponseModel.g.dart';

@JsonSerializable()
class HomeResponseModel extends BaseResponseModel {
  List<HomeResponseData> data;

  HomeResponseModel({int statusCode, String statusMessage, this.data})
      : super(statusCode: statusCode, statusMessage: statusMessage);

  factory HomeResponseModel.fromJson(Map<String, dynamic> json) =>
      _$HomeResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$HomeResponseModelToJson(this);
}

@JsonSerializable()
class HomeResponseData {
  String id;
  @JsonKey(name: 'character_name')
  String characterName;
  @JsonKey(name: 'character_gender')
  String characterGender;
  @JsonKey(name: 'character_age')
  String characterAge;
  @JsonKey(name: 'character_picture')
  String characterPicture;

  HomeResponseData(
      {this.id,
      this.characterName,
      this.characterGender,
      this.characterAge,
      this.characterPicture});

  factory HomeResponseData.fromJson(Map<String, dynamic> json) =>
      _$HomeResponseDataFromJson(json);

  Map<String, dynamic> toJson() => _$HomeResponseDataToJson(this);
}
