
import 'package:dio/dio.dart';

class NetworkHeaders extends Interceptor{

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    super.onRequest(options, handler);
    options.headers["content-type"] = "application/json";
    options.headers["token"] = "";
    options.headers["device"] = "";
    options.headers["version"] = "";
  }
}