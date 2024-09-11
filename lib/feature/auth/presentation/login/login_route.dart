import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import 'bloc/login_bloc.dart';
import 'login_page.dart';

const String loginPath = '/login';

class LoginRoute extends GoRoute {
  LoginRoute() : super(
    path: loginPath,
    builder: (context, state) => LoginPage(
      loginBloc: GetIt.I<LoginBloc>(),
    ),
  );
}