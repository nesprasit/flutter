import 'dart:convert';
import 'dart:io';
import 'package:flutter_architecture_mvvm_0/src/data/models/base/BaseResponseModel.dart';
import 'package:flutter_architecture_mvvm_0/src/data/remote/network/NetworkResponse.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

final _baseUrl =
    'https://us-central1-playground-nes-6f456.cloudfunctions.net/api2/';

Future<NetworkResponse> get({
  Map<String, String> headers,
  String endpoint,
  Map<String, dynamic> param,
}) async {
  var response;
  try {
    final responseResult = await http.get(
      _getUrl(endpoint, param),
      headers: headers,
    );
    response = _onHandlerNetworkResponse(responseResult);
  } on SocketException {
    response = NetworkResponse.disconnected(
      statusMessage: 'network disconnect',
    );
  }

  return response;
}

Future<NetworkResponse> post({
  Map<String, String> headers,
  String endpoint,
  String token,
  dynamic body,
}) async {
  var response;
  try {
    final result = await http.post(
      '$_baseUrl$endpoint',
      headers: headers,
      body: json.encode(body),
    );

    response = _onHandlerNetworkResponse(result);
  } on SocketException {
    response = NetworkResponse.disconnected(
      statusMessage: 'network disconnect',
    );
  }

  return response;
}

NetworkResponse _onHandlerNetworkResponse(Response response) {
  switch (response.statusCode) {
    case 200:
      final jsonStr = response?.body?.toString() ?? "";
      if (jsonStr.isNotEmpty) {
        final jsonResponse = json.decode(jsonStr);
        final baseModel = BaseResponseModel.fromJson(jsonResponse);
        return _onHandlerResponseModel(baseModel, jsonResponse);
      }

      return NetworkResponse.apiError(
        statusMessage: 'api error',
        statusCode: response.statusCode,
      );
    case 408:
      return NetworkResponse.timeOut(
        statusMessage: 'Time out',
        statusCode: response.statusCode,
      );
    default:
      return NetworkResponse.unknownError(
        statusMessage: 'Unknown error',
        statusCode: response.statusCode,
      );
  }
}

NetworkResponse _onHandlerResponseModel(BaseResponseModel base, dynamic json) {
  switch (base.statusCode) {
    case 200:
      return NetworkResponse.success(data: json);
    case 90000:
      return NetworkResponse.logout();
    default:
      return NetworkResponse.error(
        statusMessage: base.statusMessage,
        statusCode: base.statusCode,
      );
  }
}

_getUrl(String endpoint, Map<String, dynamic> param) {
  final queryString = Uri(queryParameters: param)?.query ?? '';
  var url = '$_baseUrl$endpoint';
  url += queryString.isNotEmpty ? '?$queryString' : '';
  return url;
}
