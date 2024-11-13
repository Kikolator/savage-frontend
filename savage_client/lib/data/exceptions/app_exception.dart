abstract class AppException implements Exception {
  final String message;
  final String? code;

  AppException({required this.code, required this.message});

  @override
  toString() {
    return message;
  }
}
