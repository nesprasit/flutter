import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'masterdata.g.dart';

@JsonSerializable()
class MasterData extends BaseStatus {
  @JsonKey(name: 'result')
  List<MasterDataResult>? result;

  MasterData({ResponseStatus? responseStatus, this.result})
      : super(responseStatus: responseStatus);

  factory MasterData.fromJson(Map<String, dynamic> json) {
    return _$MasterDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MasterDataToJson(this);
}

@JsonSerializable()
class MasterDataResult {
  @JsonKey(name: '_id')
  dynamic id;
  @JsonKey(name: 'channel_name')
  String? channelName;

  MasterDataResult({this.id, this.channelName});

  factory MasterDataResult.fromJson(Map<String, dynamic> json) {
    return _$MasterDataResultFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MasterDataResultToJson(this);
}
