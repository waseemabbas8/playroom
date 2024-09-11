import 'package:get_it/get_it.dart';

import 'feature/auth/di/auth_di.dart';

void setupDi() {
  final getIt = GetIt.instance;

  AuthModule(getIt);
}