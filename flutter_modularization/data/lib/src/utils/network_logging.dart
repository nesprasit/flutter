import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

final _logger = Logger(
  printer: PrettyPrinter(
    methodCount: 0,
    printEmojis: false,
  ),
);

class NetworkLogging extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    super.onRequest(options, handler);
    _logger.d("----> ${options.method} ${options.baseUrl}${options.path}");
    _logger.d("HEADER");
    _logger.d(options.headers);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
    final options = response.requestOptions;
    _logger.d("BODY");
    _logger.d(response.data);
    _logger.d("<---- END ${options.method} ${options.baseUrl}${options.path}");
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    super.onError(err, handler);
    final options = err.requestOptions;
    _logger.e("ERROR ${options.method} ${options.baseUrl}${options.path}");
    _logger.e(err.error);
  }
}
