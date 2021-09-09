// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterList _$CharacterListFromJson(Map<String, dynamic> json) {
  return CharacterList(
    statusCode: json['status_code'] as int? ?? 0,
    statusMessage: json['status_message'] as String? ?? '',
    data: (json['data'] as List<dynamic>?)
        ?.map((e) => CharacterData.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$CharacterListToJson(CharacterList instance) =>
    <String, dynamic>{
      'status_code': instance.statusCode,
      'status_message': instance.statusMessage,
      'data': instance.data,
    };

CharacterData _$CharacterDataFromJson(Map<String, dynamic> json) {
  return CharacterData(
    id: json['id'] as String?,
    characterName: json['character_name'] as String?,
    characterGender: json['character_gender'] as String?,
    characterAge: json['character_age'] as String?,
    characterPicture: json['character_picture'] as String?,
  );
}

Map<String, dynamic> _$CharacterDataToJson(CharacterData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'character_name': instance.characterName,
      'character_gender': instance.characterGender,
      'character_age': instance.characterAge,
      'character_picture': instance.characterPicture,
    };
