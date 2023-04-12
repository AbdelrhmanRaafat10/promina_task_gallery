class Failure implements Exception {
  final String error;
  final String message;
  final int code;

  Failure({
    required this.code,
    required this.error,

    required this.message,
  });
}

