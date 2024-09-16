import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:playroom/core/util/stream_to_listenable.dart';

import '../../feature/auth/bloc/auth_bloc.dart';
import '../../feature/auth/presentation/login/login_route.dart';
import '../../feature/home/home_route.dart';
import '../../feature/main/main_route.dart';
import '../../feature/splash/splash_route.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

GoRouter routerConfig({
  required AuthBloc authBloc,
}) =>
    GoRouter(
      initialLocation: splashPath,
      navigatorKey: _rootNavigatorKey,
      debugLogDiagnostics: true,
      routes: [
        SplashRoute(),
        LoginRoute(),
        MainRoute(
          branches: [
            HomeRoute()
          ],
        ),
      ],
      refreshListenable: StreamToListenable([authBloc.stream]),
      redirect: (context, state) {
        context.read<AuthBloc>();
        switch (authBloc.state) {
          case AuthInitial():
            return null;
          case Authenticated():
            return homePath;
          case Unauthenticated():
            return loginPath;
        }
      },
    );
