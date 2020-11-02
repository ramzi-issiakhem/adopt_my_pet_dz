class ServerException implements Exception {
  final String message;

  ServerException(this.message);
}

class LoginException implements Exception {
  final String code;

  LoginException(this.code);
}

class RegisterException implements Exception {
  final String code;

  RegisterException(this.code);
}
