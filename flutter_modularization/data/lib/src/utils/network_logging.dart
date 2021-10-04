import 'package:commons/commons.dart';
import 'package:dio/dio.dart';

class NetworkLogging extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    super.onRequest(options, handler);
    final url = '${options.baseUrl}${options.path}';
    Print().d("----> ${options.method} $url");
    Print().d("HEADER");
    Print().d(options.headers);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
    final options = response.requestOptions;
    final url = '${options.baseUrl}${options.path}';
    Print().d("BODY");
    Print().d(response.data);
    Print().d("<---- END ${options.method} $url");
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    super.onError(err, handler);
    final options = err.requestOptions;
    final url = "${options.baseUrl}${options.path}";
    Print().e("ERROR ${options.method} $url");
    Print().e(err.error);
  }
}
