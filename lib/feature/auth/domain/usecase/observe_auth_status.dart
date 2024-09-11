import '../../../../core/domain/exceptions.dart';
import '../../../../core/domain/result.dart';
import '../auth_repository.dart';

abstract class ObserveAuthStatus {
  Stream<Result<bool>> call();
}

class ObserveAuthStatusImpl implements ObserveAuthStatus {
  final AuthRepository _authRepository;

  ObserveAuthStatusImpl(this._authRepository);

  @override
  Stream<Result<bool>> call() {
    try {
      return _authRepository.observeAuthStatus().map((status) => Result.success(status));
    } on Exception catch (e) {
      return Stream.value(Result.failure(NetworkException.fromException(e)));
    }
  }
}
