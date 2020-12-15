// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HomeResponseModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeResponseModel _$HomeResponseModelFromJson(Map<String, dynamic> json) {
  return HomeResponseModel(
    statusCode: json['status_code'] as int ?? 0,
    statusMessage: json['status_message'] as String ?? '',
    data: (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : HomeResponseData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$HomeResponseModelToJson(HomeResponseModel instance) =>
    <String, dynamic>{
      'status_code': instance.statusCode,
      'status_message': instance.statusMessage,
      'data': instance.data,
    };

HomeResponseData _$HomeResponseDataFromJson(Map<String, dynamic> json) {
  return HomeResponseData(
    id: json['id'] as String,
    characterName: json['character_name'] as String,
    characterGender: json['character_gender'] as String,
    characterAge: json['character_age'] as String,
    characterPicture: json['character_picture'] as String,
  );
}

Map<String, dynamic> _$HomeResponseDataToJson(HomeResponseData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'character_name': instance.characterName,
      'character_gender': instance.characterGender,
      'character_age': instance.characterAge,
      'character_picture': instance.characterPicture,
    };
