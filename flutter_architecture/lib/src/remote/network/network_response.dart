import 'dart:convert';
import 'dart:io';
import 'package:flutter_provider/src/models/base/base_response_model.dart';
import 'package:flutter_provider/src/remote/network/network_result.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_provider/src/utils/constans.dart';
import 'package:http/http.dart';

class NetworkResponse {
  final _baseUrl = Configs.baseUrl;

  Future<NetworkResult<dynamic>> get({
    Map<String, String> headers,
    String endpoint,
    Map<String, dynamic> parameter,
  }) async {
    var response;
    try {
      final queryString = Uri(queryParameters: parameter)?.query ?? '';

      var url = '$_baseUrl$endpoint';
      url += queryString.isNotEmpty ? '?$queryString' : '';

      final result = await http.get(url, headers: headers);
      response = _onHandlerResponseResult(result);
    } on SocketException {
      response = NetworkResult.disconnected(statusMessage: 'network disconnect');
    }

    return response;
  }

  Future<NetworkResult<dynamic>> post({
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

      response = _onHandlerResponseResult(result);
    } on SocketException {
      response = NetworkResult.disconnected(statusMessage: 'network disconnect');
    }
    return response;
  }

  NetworkResult _onHandlerResponseResult(Response response) {
    switch (response.statusCode) {
      case 200:
        final jsonStr = response?.body?.toString() ?? "";
        if (jsonStr.isNotEmpty) {
          final jsonResponse = json.decode(jsonStr);
          final baseModel = BaseResponseModel.fromJson(jsonResponse);

          switch (baseModel.statusCode) {
            case 200:
              return NetworkResult.success(data: jsonResponse);
            case 90000:
              return NetworkResult.logout();
            default:
              return NetworkResult.error(
                statusMessage: baseModel.statusMessage,
                statusCode: baseModel.statusCode,
              );
          }
        }

        return NetworkResult.apiError(
          statusMessage: 'api error',
          statusCode: response.statusCode,
        );
      case 408:
        return NetworkResult.timeOut(
          statusMessage: 'Time out',
          statusCode: response.statusCode,
        );
      default:
        return NetworkResult.unknownError(
          statusMessage: 'Unknown error',
          statusCode: response.statusCode,
        );
    }
  }
}
