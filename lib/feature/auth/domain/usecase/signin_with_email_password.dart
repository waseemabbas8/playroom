import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/domain/exceptions.dart';
import '../../../../core/domain/result.dart';
import '../../../../core/domain/usecase.dart';
import '../auth_repository.dart';

abstract class SignInWithEmailAndPassword implements UseCase<bool, SignInParams> {}

class SignInWithEmailAndPasswordImpl implements SignInWithEmailAndPassword {
  final AuthRepository _authRepository;

  SignInWithEmailAndPasswordImpl(this._authRepository);

  @override
  Future<Result<bool>> call(SignInParams params) async {
    try {
      final res = await _authRepository.login(email: params.email, password: params.password);
      return Result.success(res);
    } on FirebaseAuthException catch (e) {
      return Result.failure(NetworkException.auth(e));
    }
  }
}

final class SignInParams {
  final String email;
  final String password;

  SignInParams({required this.email, required this.password});
}
