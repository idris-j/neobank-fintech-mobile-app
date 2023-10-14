// import 'package:get_it/get_it.dart';

import 'package:payprice/core/api/api_utils/api_helper.dart';
import 'package:payprice/core/api/auth_api/auth_api.dart';
import 'package:payprice/core/api/auth_api/auth_implementation.dart';
import 'package:payprice/core/api/user_api/user_api.dart';
import 'package:payprice/core/api/user_api/user_implementation.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;
void setupLocator() {
  locator.registerLazySingleton<API>(() => API());

  // // API
  // // locator.registerLazySingleton<AuthenticationApi>(() => AuthenticationApiImpl());
  locator.registerLazySingleton<AuthApi>(() => AuthImpl());
  locator.registerLazySingleton<UserApi>(() => UserApiImpl());

  // // Infrastructure
  // locator.registerLazySingleton<UserInfoCache>(() => UserInfoCache());
}
