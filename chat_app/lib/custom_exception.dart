class HttpRequestException implements Exception {

  final String message;

  HttpRequestException(this.message);
}

enum Status {
  loading,
  success,
  failed, initial,
}