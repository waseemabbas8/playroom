import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'presentation/home_page.dart';

const String homePath = '/home';

class HomeRoute extends StatefulShellBranch {
  final List<RouteBase> childRoutes;

  HomeRoute({
    this.childRoutes = const [],
  }) : super(
          navigatorKey: GlobalKey<NavigatorState>(debugLabel: 'homeNav'),
          routes: [
            GoRoute(
              path: homePath,
              builder: (context, state) => const HomePage(),
              routes: childRoutes,
            ),
          ],
        );
}
