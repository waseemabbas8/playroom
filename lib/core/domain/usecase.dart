import 'result.dart';

abstract class UseCase<T, Params> {
  Future<Result<T>> call(Params params);
}

abstract class ObservableUseCase<T> {
  Stream<Result<T>> call();
}

final class NoParams {}