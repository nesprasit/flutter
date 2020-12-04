class NetworkResult<T> {
  ResponseState state;
  int statusCode;
  String statusMessage;

  T data;

  NetworkResult();

  NetworkResult.success({this.data}) : state = ResponseState.SUCCESS;
  NetworkResult.error({this.statusMessage, this.statusCode})
      : state = ResponseState.ERROR;
  NetworkResult.logout() : state = ResponseState.LOGOUT;
  NetworkResult.unknownError({this.statusMessage, this.statusCode})
      : state = ResponseState.UNKNOWN_ERROR;
  NetworkResult.apiError({this.statusMessage, this.statusCode})
      : state = ResponseState.API_ERROR;
  NetworkResult.timeOut({this.statusMessage, this.statusCode})
      : state = ResponseState.TIMEOUT;

  NetworkResult.disconnected({this.statusMessage})
      : state = ResponseState.DISCOUNTED;
}

enum ResponseState {
  SUCCESS,
  ERROR,
  LOGOUT,
  UNKNOWN_ERROR,
  API_ERROR,
  TIMEOUT,
  DISCOUNTED
}
