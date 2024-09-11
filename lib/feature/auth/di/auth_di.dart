import 'package:get_it/get_it.dart';

import '../bloc/auth_bloc.dart';
import '../data/firebase_auth_repository.dart';
import '../domain/auth_repository.dart';
import '../domain/usecase/observe_auth_status.dart';
import '../domain/usecase/signin_with_email_password.dart';
import '../presentation/login/bloc/login_bloc.dart';

class AuthModule {
  final GetIt getIt;

  AuthModule(this.getIt) {
    getIt.registerFactory<AuthRepository>(() => FirebaseAuthRepository());
    getIt.registerFactory<ObserveAuthStatus>(() => ObserveAuthStatusImpl(getIt.get()));
    getIt.registerFactory<AuthBloc>(() => AuthBloc(getIt.get()));

    getIt.registerFactory<SignInWithEmailAndPassword>(
      () => SignInWithEmailAndPasswordImpl(getIt.get()),
    );
    getIt.registerFactory<LoginBloc>(() => LoginBloc(getIt.get()));
  }
}
