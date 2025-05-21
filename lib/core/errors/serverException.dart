// lib/data/exceptions/server_exception.dart

class ServerException implements Exception {
  final String message;
  final int? statusCode;

  ServerException({required this.message, this.statusCode});

  @override
  String toString() {
    return 'ServerException: $message (Status Code: $statusCode)';
  }
}
