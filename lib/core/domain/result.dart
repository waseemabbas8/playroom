/// represents a result of an operation
/// [T] is the type of the data to be returned
library;

import 'exceptions.dart';

sealed class Result<T> {
  Result._();

  factory Result.success(T data) = Success;

  factory Result.failure(NetworkException e) = Failure;
}

final class Success<T> extends Result<T> {
  final T data;

  Success(this.data) : super._();
}

final class Failure<T> extends Result<T> {
  final NetworkException e;

  Failure(this.e) : super._();
}
