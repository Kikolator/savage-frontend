// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, implementation_imports, depend_on_referenced_packages

import 'package:stacked_services/src/bottom_sheet/bottom_sheet_service.dart';
import 'package:stacked_services/src/dialog/dialog_service.dart';
import 'package:stacked_services/src/navigation/router_service.dart';
import 'package:stacked_shared/stacked_shared.dart';

import '../services/dependency_wrappers/analytics_service.dart';
import '../services/dependency_wrappers/authentication_service.dart';
import '../services/dependency_wrappers/crashlytics_service.dart';
import '../services/dependency_wrappers/database_service.dart';
import '../services/dependency_wrappers/functions_service.dart';
import '../services/dependency_wrappers/storage_service.dart';
import '../services/user_service.dart';
import 'app.router.dart';

final locator = StackedLocator.instance;

Future<void> setupLocator({
  String? environment,
  EnvironmentFilter? environmentFilter,
  StackedRouterWeb? stackedRouter,
}) async {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerLazySingleton(() => BottomSheetService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => RouterService());
  locator.registerLazySingleton(() => AuthenticationService.getInstance());
  locator.registerLazySingleton(() => DatabaseService.getInstance());
  locator.registerLazySingleton(() => FunctionsService());
  locator.registerLazySingleton(() => StorageService());
  locator.registerLazySingleton(() => AnalyticsService());
  locator.registerLazySingleton(() => CrashlyticsService());
  locator.registerLazySingleton(() => UserService());
  if (stackedRouter == null) {
    throw Exception(
        'Stacked is building to use the Router (Navigator 2.0) navigation but no stackedRouter is supplied. Pass the stackedRouter to the setupLocator function in main.dart');
  }

  locator<RouterService>().setRouter(stackedRouter);
}
