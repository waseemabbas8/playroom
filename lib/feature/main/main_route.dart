import 'package:go_router/go_router.dart';

import 'main_page.dart';

class MainRoute extends StatefulShellRoute {
  MainRoute({
    required super.branches,
  }) : super.indexedStack(builder: (context, state, child) => MainPage(child: child));
}
