import 'package:go_router/go_router.dart';

import 'main_page.dart';

const String mainPath = '/main';

class MainRoute extends GoRoute {
  MainRoute()
      : super(
          path: mainPath,
          builder: (context, state) => const MainPage(),
        );
}