import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/domain/result.dart';
import '../../../domain/usecase/signin_with_email_password.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final SignInWithEmailAndPassword _signInWithEmailAndPassword;

  LoginBloc(this._signInWithEmailAndPassword) : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      switch (event) {
        case OnLogin():
          await _onLogin(event, emit);
          break;
      }
    });
  }

  Future _onLogin(OnLogin event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    final result = await _signInWithEmailAndPassword(
      SignInParams(email: event.email, password: event.password),
    );
    switch(result) {
      case Success<bool>():
        emit(LoginSuccess());
        break;
      case Failure<bool>():
        emit(LoginError(message: result.e.message));
    }
  }
}
