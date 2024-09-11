import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/domain/result.dart';
import '../domain/usecase/observe_auth_status.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final ObserveAuthStatus _observeAuthStatus;

  AuthBloc(this._observeAuthStatus) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      switch (event) {
        case OnCheckAuthStatus():
          await emit.forEach(_observeAuthStatus(), onData: _resultToState);
          break;
      }
    });
  }

  AuthState _resultToState(Result<bool> result) {
    if (result is Success && (result as Success).data) {
      return Authenticated();
    }
    return Unauthenticated();
  }
}
