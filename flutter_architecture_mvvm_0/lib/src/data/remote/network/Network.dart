import 'package:alice/alice.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_architecture_mvvm_0/src/data/models/base/BaseResponseModel.dart';
import 'package:flutter_architecture_mvvm_0/src/data/remote/network/NetworkResponse.dart';
import 'package:flutter_architecture_mvvm_0/src/servicelocator/ServiceLocator.dart';

final _baseUrl = 'https://us-central1-playground-24194.cloudfunctions.net/api/';
final dio = serviceLocator<Dio>();

Future<NetworkResponse> get({
  Map<String, String> headers,
  String endpoint,
  Map<String, dynamic> param,
}) async {
  var responsed;
  try {
    _addInterceptors();
    _addHeaderRequest(headers);
    final response = await dio.get(
      '$_baseUrl$endpoint',
      queryParameters: param,
    );
    responsed = _onHandlerNetworkResponse(response);
  } catch (e) {
    responsed = NetworkResponse.disconnected(
      statusMessage: 'network disconnect',
    );
  }
  return responsed;
}

Future<NetworkResponse> post({
  Map<String, String> headers,
  String endpoint,
  String token,
  Map<String, dynamic> body,
}) async {
  var responsed;
  try {
    _addInterceptors();
    _addHeaderRequest(headers);
    final response = await dio.post('$_baseUrl$endpoint', data: body);
    responsed = _onHandlerNetworkResponse(response);
  } catch (e) {
    responsed = NetworkResponse.disconnected(
      statusMessage: 'network disconnect',
    );
  }
  return responsed;
}

NetworkResponse _onHandlerNetworkResponse(Response response) {
  switch (response.statusCode) {
    case 200:
      final json = response?.data ?? null;
      if (json != null) {
        final baseModel = BaseResponseModel.fromJson(json);
        return _onHandlerResponseModel(baseModel, json);
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

_addInterceptors() {
  if (kDebugMode) {
    serviceLocator<Dio>()
        .interceptors
        .add(serviceLocator<Alice>().getDioInterceptor());
  }
}

_addHeaderRequest(Map<String, String> headers) {
  if (headers == null || headers.isEmpty) {
    dio.options.headers.clear();
    return;
  }
  headers.forEach((key, value) {
    dio.options.headers[key] = value;
  });
}
