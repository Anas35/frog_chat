class ApiException implements Exception {

  const ApiException([this.message = '']);

  final String message;

}
