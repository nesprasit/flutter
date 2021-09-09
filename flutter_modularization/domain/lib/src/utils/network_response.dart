class NetworkResponse<T> {
  NetworkResponseState? state;
  int? statusCode;
  String? statusMessage;

  T? data;

  NetworkResponse(NetworkResponse response) {
    this.state = response.state;
    this.statusCode = response.statusCode;
    this.statusMessage = response.statusMessage;
    this.data = response.data;
  }

  NetworkResponse.success({this.data}) : state = NetworkResponseState.SUCCESS;

  NetworkResponse.error({this.statusMessage, this.statusCode})
      : state = NetworkResponseState.ERROR;

  NetworkResponse.logout() : state = NetworkResponseState.LOGOUT;

  NetworkResponse.unknownError({this.statusMessage, this.statusCode})
      : state = NetworkResponseState.UNKNOWN_ERROR;

  NetworkResponse.apiError({this.statusMessage, this.statusCode})
      : state = NetworkResponseState.API_ERROR;

  NetworkResponse.timeOut({this.statusMessage, this.statusCode})
      : state = NetworkResponseState.TIMEOUT;

  NetworkResponse.disconnected({this.statusMessage})
      : state = NetworkResponseState.DISCOUNTED;
}

enum NetworkResponseState {
  SUCCESS,
  ERROR,
  LOGOUT,
  UNKNOWN_ERROR,
  API_ERROR,
  TIMEOUT,
  DISCOUNTED
}
