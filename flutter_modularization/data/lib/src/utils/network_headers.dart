
import 'package:dio/dio.dart';

class NetworkHeaders extends Interceptor{

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    super.onRequest(options, handler);
    options.headers["content-type"] = "application/json";
    options.headers["token"] = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaXJzdG5hbWUiOiJQcmFzaXQiLCJsYXN0bmFtZSI6InNpbmd6b20iLCJwaG9uZSI6bnVsbCwiZW1haWwiOiJwcmFzaXQuc0BjbGlja25leHQuY29tIiwiaW1hZ2UiOiJodHRwczovL2Rldi1hc3NldC5jaGF0Y29uZS5jb20vdXNlcnMvcHJvZmlsZS9wcmFzaXQtcy1jbGlja25leHQtY29tLmpwZWciLCJ1c2VyX2lkIjoiNjAxYTFlZWVjNzJhNjE2YmZkMGNiZTFiIiwiaWF0IjoxNjMzMzQ0NTk1LCJleHAiOjE2NjQ4ODA1OTV9.A1IfHED1OxdXv7sIrtKvi-9hb7bhJ40LKl5crmTBP6I";
    options.headers["device"] = "";
    options.headers["version"] = "";
  }
}