import 'package:flutter_provider/src/remote/network/network_result.dart';

class ResponseResult<T> {
  Function(T data) success;
  Function() loading;
  Function() complete;
  Function(String messages, int code) error;
  Function() logout;
  Function(String message, int code) unknownError;
  Function(String message, int code) apiError;
  Function(String message, int code) timeout;
  Function(String message, int code) discounected;

  obseverLoading() {
    loading?.call();
  }

  obseverComplete() {
    complete?.call();
  }

  obsever(NetworkResult result) {
    switch (result.state) {
      case ResponseState.SUCCESS:
        success?.call(result.data);
        break;
      case ResponseState.ERROR:
        error?.call(result.statusMessage, result.statusCode);
        break;
      case ResponseState.LOGOUT:
        logout?.call();
        break;
      case ResponseState.UNKNOWN_ERROR:
        unknownError?.call(result.statusMessage, result.statusCode);
        break;
      case ResponseState.API_ERROR:
        apiError?.call(result.statusMessage, result.statusCode);
        break;
      case ResponseState.TIMEOUT:
        timeout?.call(result.statusMessage, result.statusCode);
        break;
      case ResponseState.DISCOUNTED:
        discounected?.call(result.statusMessage, result.statusCode);
        break;
    }
  }

  ResponseResult.obsever({
    this.loading,
    this.complete,
    this.success,
    this.error,
    this.logout,
    this.unknownError,
    this.apiError,
    this.timeout,
    this.discounected,
  });
}
