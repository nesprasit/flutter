import 'package:domain/src/model/base/base_status.dart';
import 'package:json_annotation/json_annotation.dart';
part 'character_list.g.dart';

@JsonSerializable()
class CharacterList extends BaseStatus {
  @JsonKey(name: 'data', defaultValue: [])
  List<CharacterData>? data;

  CharacterList({int? statusCode, String? statusMessage, this.data})
      : super(statusCode: statusCode, statusMessage: statusMessage);

  factory CharacterList.fromJson(Map<String, dynamic> json) =>
      _$CharacterListFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterListToJson(this);
}

@JsonSerializable()
class CharacterData {
  String? id;
  @JsonKey(name: 'character_name')
  String? characterName;
  @JsonKey(name: 'character_gender')
  String? characterGender;
  @JsonKey(name: 'character_age')
  String? characterAge;
  @JsonKey(name: 'character_picture')
  String? characterPicture;

  CharacterData({
    this.id,
    this.characterName,
    this.characterGender,
    this.characterAge,
    this.characterPicture,
  });

  factory CharacterData.fromJson(Map<String, dynamic> json) =>
      _$CharacterDataFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterDataToJson(this);
}
