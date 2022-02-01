import 'package:domain/src/models/base/base_status.dart';
import 'package:json_annotation/json_annotation.dart';
part 'login.g.dart';

@JsonSerializable()
class Login extends BaseStatus {
  @JsonKey(name: 'result')
  Token? result;

  Login({ResponseStatus? responseStatus, this.result})
      : super(responseStatus: responseStatus);

  factory Login.fromJson(Map<String, dynamic> json) => _$LoginFromJson(json);

  Map<String, dynamic> toJson() => _$LoginToJson(this);
}

@JsonSerializable()
class Token {
  String? token;

  Token({this.token});
  
  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);

  Map<String, dynamic> toJson() => _$TokenToJson(this);
}
