abstract class AuthRepository {
  Stream<bool> observeAuthStatus();

  Future<bool> login({required String email, required String password});
}