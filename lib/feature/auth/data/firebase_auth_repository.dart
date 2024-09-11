import 'package:firebase_auth/firebase_auth.dart';

import '../domain/auth_repository.dart';

class FirebaseAuthRepository implements AuthRepository {
  final _firebaseAuth = FirebaseAuth.instance;

  @override
  Stream<bool> observeAuthStatus() {
    return _firebaseAuth.authStateChanges().map((user) {
      return user != null;
    });
  }

  @override
  Future<bool> login({required String email, required String password}) async {
    final user =await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    return true;
  }


}
