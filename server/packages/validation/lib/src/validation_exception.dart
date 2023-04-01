class ValidationException implements Exception {
  
  final String message;

  const ValidationException([this.message = '']);

}