import 'package:go_router/go_router.dart';
import 'package:playroom/feature/splash/splash_page.dart';

const String splashPath = '/';

class SplashRoute extends GoRoute {
  SplashRoute()
      : super(
          path: splashPath,
          builder: (context, state) => const SplashPage(),
        );
}
