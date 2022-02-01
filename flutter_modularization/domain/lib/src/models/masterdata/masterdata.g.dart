// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'masterdata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MasterData _$MasterDataFromJson(Map<String, dynamic> json) {
  return MasterData(
    responseStatus: json['response_status'] == null
        ? null
        : ResponseStatus.fromJson(
            json['response_status'] as Map<String, dynamic>),
    result: (json['result'] as List<dynamic>?)
        ?.map((e) => MasterDataResult.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$MasterDataToJson(MasterData instance) =>
    <String, dynamic>{
      'response_status': instance.responseStatus,
      'result': instance.result,
    };

MasterDataResult _$MasterDataResultFromJson(Map<String, dynamic> json) {
  return MasterDataResult(
    id: json['_id'],
    channelName: json['channel_name'] as String?,
  );
}

Map<String, dynamic> _$MasterDataResultToJson(MasterDataResult instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'channel_name': instance.channelName,
    };
