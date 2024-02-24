class BaseException implements Exception {
  final String message;

  BaseException(this.message);

  @override
  String toString() {
    return 'BaseException: $message';
  }
}

class NetworkException extends BaseException {
  NetworkException(String message) : super(message);
}

class ServerException extends BaseException {
  ServerException(String message) : super(message);
}

class UnknownException extends BaseException {
  UnknownException(String message) : super(message);
}
