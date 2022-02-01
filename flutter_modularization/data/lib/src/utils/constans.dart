enum StatusCode {
  SUCCESS,
  API_ERROR,
  TOKEN_INVALID,
  TOKEN_EXPIRED,
  LOGOUT,
  NONE,
}

extension StatusCodeParse on StatusCode {
  StatusCode byValue(int value) {
    StatusCode code = StatusCode.NONE;
    switch (value) {
      case 00000:
        code = StatusCode.SUCCESS;
        break;
      case 10000:
        code = StatusCode.API_ERROR;
        break;
      case 20000:
        code = StatusCode.LOGOUT;
        break;
      case 90001:
        code = StatusCode.TOKEN_INVALID;
        break;
      case 90003:
        code = StatusCode.TOKEN_EXPIRED;
        break;
      default:
        code = StatusCode.NONE;
        break;
    }
    return code;
  }
}
