// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, implementation_imports, depend_on_referenced_packages

import 'package:stacked_services/src/bottom_sheet/bottom_sheet_service.dart';
import 'package:stacked_services/src/dialog/dialog_service.dart';
import 'package:stacked_services/src/navigation/router_service.dart';
import 'package:stacked_shared/stacked_shared.dart';

import '../services/analytics_service.dart';
import '../services/authentication_service.dart';
import '../services/crashlytics_service.dart';
import '../services/database_service.dart';
import '../services/functions_service.dart';
import '../services/storage_service.dart';
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
  locator.registerLazySingleton(() => DatabaseService());
  locator.registerLazySingleton(() => FunctionsService());
  locator.registerLazySingleton(() => StorageService());
  locator.registerLazySingleton(() => AnalyticsService());
  locator.registerLazySingleton(() => CrashlyticsService());
  if (stackedRouter == null) {
    throw Exception(
        'Stacked is building to use the Router (Navigator 2.0) navigation but no stackedRouter is supplied. Pass the stackedRouter to the setupLocator function in main.dart');
  }

  locator<RouterService>().setRouter(stackedRouter);
}
