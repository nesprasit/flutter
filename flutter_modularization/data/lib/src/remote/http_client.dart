import 'dart:io';
import 'package:alice/alice.dart';
import 'package:commons/commons.dart';
import 'package:data/src/utils/constans.dart';
import 'package:data/src/utils/network_headers.dart';
import 'package:data/src/utils/network_logging.dart';
import 'package:dio/dio.dart';
import 'package:domain/domain.dart';
import 'package:flutter/foundation.dart';

class HttpClient {

  String _baseUrl = "";
  final _dio = inject<Dio>();

  HttpClient() {
    _dio.options = BaseOptions(baseUrl: _baseUrl);
    _addInterceptors();
  }

  /*
   * GET 
   * @param [headers] is headers special key–value pair 
   * @param [endpoint] is one end of a communication channel
   * @param [param] is query string parameters appear after a question mark ( ? )
   */
  Future<NetworkResponse> get({
    Map<String, String>? headers,
    String endpoint = '',
    Map<String, dynamic>? param,
  }) async {
    dynamic responsed;
    try {
      _addHeaderRequest(headers);
      final response = await _dio.get(endpoint, queryParameters: param);
      responsed = _onHandlerNetworkResponse(response);
    } catch (e) {
      responsed = NetworkResponse.disconnected(
        statusMessage: 'network disconnect',
      );
    }
    return responsed;
  }

  /*
   * POST 
   * @param [headers] is headers special key–value pair 
   * @param [endpoint] is one end of a communication channel
   * @param [body] is data payload can be sent to the server in the body of the request.
   */
  Future<NetworkResponse> post({
    Map<String, String>? headers,
    String endpoint = '',
    Map<String, dynamic>? body,
  }) async {
    var responsed;
    try {
      _addHeaderRequest(headers);
      final response = await _dio.post(endpoint, data: body);
      responsed = _onHandlerNetworkResponse(response);
    } catch (e) {
      responsed = NetworkResponse.disconnected(
        statusMessage: 'network disconnect',
      );
    }
    return responsed;
  }

  /*
   * Handler Network Response 
   * HTTP status codes.
   */
  NetworkResponse _onHandlerNetworkResponse(Response response) {
    switch (response.statusCode) {
      case HttpStatus.ok:
        final json = response.data ?? null;
        if (json != null) {
          final model = BaseStatus.fromJson(json);
          return _onHandlerResponse(model, json);
        }

        return NetworkResponse.apiError(
          statusMessage: 'api error',
          statusCode: response.statusCode.toString(),
        );
      case HttpStatus.gatewayTimeout:
      case HttpStatus.requestTimeout:
        return NetworkResponse.timeOut(
          statusMessage: 'Time out',
          statusCode: response.statusCode.toString(),
        );
      default:
        return NetworkResponse.unknownError(
          statusMessage: 'Unknown error',
          statusCode: response.statusCode.toString(),
        );
    }
  }

  /*
   * Handler Response 
   * Api status codes.
   */
  NetworkResponse _onHandlerResponse(BaseStatus model, dynamic json) {
    final responseStatus = model.responseStatus;
    final code = int.parse(responseStatus?.code ?? '0');

    switch (StatusCode.NONE.byValue(code)) {
      case StatusCode.SUCCESS:
        return NetworkResponse.success(data: json);
      case StatusCode.LOGOUT:
        return NetworkResponse.logout();
      default:
        return NetworkResponse.error(
          statusMessage: responseStatus?.message,
          statusCode: responseStatus?.code,
        );
    }
  }

  _addInterceptors() {
    _dio.interceptors.add(NetworkHeaders());

    if (kDebugMode) {
      _dio.interceptors.add(inject<Alice>().getDioInterceptor());
      _dio.interceptors.add(NetworkLogging());
    }
  }

  _addHeaderRequest(Map<String, String>? headers) {
    if (headers == null || headers.isEmpty) {
      _dio.options.headers.clear();
    }

    headers?.forEach((key, value) {
      _dio.options.headers[key] = value;
    });
  }
}
