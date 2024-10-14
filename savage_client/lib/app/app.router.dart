// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i9;
import 'package:stacked/stacked.dart' as _i8;
import 'package:stacked_services/stacked_services.dart' as _i7;

import '../ui/views/add_user_data/add_user_data_view.dart' as _i5;
import '../ui/views/home/home_view.dart' as _i2;
import '../ui/views/login/login_view.dart' as _i3;
import '../ui/views/startup/startup_view.dart' as _i1;
import '../ui/views/unknown/unknown_view.dart' as _i6;
import '../ui/views/verify_email/verify_email_view.dart' as _i4;

final stackedRouter =
    StackedRouterWeb(navigatorKey: _i7.StackedService.navigatorKey);

class StackedRouterWeb extends _i8.RootStackRouter {
  StackedRouterWeb({_i9.GlobalKey<_i9.NavigatorState>? navigatorKey})
      : super(navigatorKey);

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    StartupViewRoute.name: (routeData) {
      return _i8.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.StartupView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    HomeViewRoute.name: (routeData) {
      return _i8.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i2.HomeView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    LoginViewRoute.name: (routeData) {
      return _i8.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i3.LoginView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    VerifyEmailViewRoute.name: (routeData) {
      return _i8.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i4.VerifyEmailView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    AddUserDataViewRoute.name: (routeData) {
      return _i8.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i5.AddUserDataView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    UnknownViewRoute.name: (routeData) {
      return _i8.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i6.UnknownView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i8.RouteConfig> get routes => [
        _i8.RouteConfig(
          StartupViewRoute.name,
          path: '/',
        ),
        _i8.RouteConfig(
          HomeViewRoute.name,
          path: '/home-view',
        ),
        _i8.RouteConfig(
          LoginViewRoute.name,
          path: '/login-view',
        ),
        _i8.RouteConfig(
          VerifyEmailViewRoute.name,
          path: '/verify-email-view',
        ),
        _i8.RouteConfig(
          AddUserDataViewRoute.name,
          path: '/add-user-data-view',
        ),
        _i8.RouteConfig(
          UnknownViewRoute.name,
          path: '/404',
        ),
        _i8.RouteConfig(
          '*#redirect',
          path: '*',
          redirectTo: '/404',
          fullMatch: true,
        ),
      ];
}

/// generated route for
/// [_i1.StartupView]
class StartupViewRoute extends _i8.PageRouteInfo<void> {
  const StartupViewRoute()
      : super(
          StartupViewRoute.name,
          path: '/',
        );

  static const String name = 'StartupView';
}

/// generated route for
/// [_i2.HomeView]
class HomeViewRoute extends _i8.PageRouteInfo<void> {
  const HomeViewRoute()
      : super(
          HomeViewRoute.name,
          path: '/home-view',
        );

  static const String name = 'HomeView';
}

/// generated route for
/// [_i3.LoginView]
class LoginViewRoute extends _i8.PageRouteInfo<void> {
  const LoginViewRoute()
      : super(
          LoginViewRoute.name,
          path: '/login-view',
        );

  static const String name = 'LoginView';
}

/// generated route for
/// [_i4.VerifyEmailView]
class VerifyEmailViewRoute extends _i8.PageRouteInfo<void> {
  const VerifyEmailViewRoute()
      : super(
          VerifyEmailViewRoute.name,
          path: '/verify-email-view',
        );

  static const String name = 'VerifyEmailView';
}

/// generated route for
/// [_i5.AddUserDataView]
class AddUserDataViewRoute extends _i8.PageRouteInfo<void> {
  const AddUserDataViewRoute()
      : super(
          AddUserDataViewRoute.name,
          path: '/add-user-data-view',
        );

  static const String name = 'AddUserDataView';
}

/// generated route for
/// [_i6.UnknownView]
class UnknownViewRoute extends _i8.PageRouteInfo<void> {
  const UnknownViewRoute()
      : super(
          UnknownViewRoute.name,
          path: '/404',
        );

  static const String name = 'UnknownView';
}

extension RouterStateExtension on _i7.RouterService {
  Future<dynamic> navigateToStartupView(
      {void Function(_i8.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const StartupViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToHomeView(
      {void Function(_i8.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const HomeViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToLoginView(
      {void Function(_i8.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const LoginViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToVerifyEmailView(
      {void Function(_i8.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const VerifyEmailViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToAddUserDataView(
      {void Function(_i8.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const AddUserDataViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToUnknownView(
      {void Function(_i8.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const UnknownViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithStartupView(
      {void Function(_i8.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const StartupViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithHomeView(
      {void Function(_i8.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const HomeViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithLoginView(
      {void Function(_i8.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const LoginViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithVerifyEmailView(
      {void Function(_i8.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const VerifyEmailViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithAddUserDataView(
      {void Function(_i8.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const AddUserDataViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithUnknownView(
      {void Function(_i8.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const UnknownViewRoute(),
      onFailure: onFailure,
    );
  }
}
