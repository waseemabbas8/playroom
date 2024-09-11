import 'package:firebase_auth/firebase_auth.dart';

sealed class NetworkException implements Exception {
  final String message;
  NetworkException(this.message);

  factory NetworkException.auth(FirebaseAuthException e) => AuthException(e.message ?? 'Something went wrong');

  factory NetworkException.fromException(Exception e) {
    if (e is FirebaseAuthException) {
      return AuthException(e.message ?? 'Something went wrong');
    }
    return UnknownException(e.toString());
  }
}

final class AuthException extends NetworkException {
  AuthException(super.message);
}

final class UnknownException extends NetworkException {
  UnknownException(super.message);
}