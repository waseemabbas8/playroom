import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:playroom/core/util/stream_to_listenable.dart';
import 'package:playroom/feature/auth/presentation/login/login_route.dart';
import 'package:playroom/feature/main/main_route.dart';
import 'package:playroom/feature/splash/splash_route.dart';

import '../../feature/auth/bloc/auth_bloc.dart';

GoRouter routerConfig({
  required AuthBloc authBloc,
}) =>
    GoRouter(
      initialLocation: splashPath,
      routes: [
        SplashRoute(),
        MainRoute(),
        LoginRoute(),
      ],
      refreshListenable: StreamToListenable([authBloc.stream]),
      redirect: (context, state) {
        context.read<AuthBloc>();
        switch(authBloc.state) {
          case AuthInitial(): return null;
          case Authenticated(): return mainPath;
          case Unauthenticated(): return loginPath;
        }
      },
    );
