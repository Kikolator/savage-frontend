// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i19;
import 'package:stacked/stacked.dart' as _i18;
import 'package:stacked_services/stacked_services.dart' as _i16;

import '../route_guards/authentication_guard.dart' as _i17;
import '../ui/views/add_user_data/add_user_data_view.dart' as _i5;
import '../ui/views/billing/billing_view.dart' as _i12;
import '../ui/views/bookings/bookings_view.dart' as _i14;
import '../ui/views/create_business_profile/create_business_profile_view.dart'
    as _i6;
import '../ui/views/home/home_view.dart' as _i2;
import '../ui/views/hot_desks/hot_desks_view.dart' as _i10;
import '../ui/views/invoices/invoices_view.dart' as _i15;
import '../ui/views/login/login_view.dart' as _i3;
import '../ui/views/meeting_room/meeting_room_view.dart' as _i11;
import '../ui/views/overview/overview_view.dart' as _i8;
import '../ui/views/profile/profile_view.dart' as _i13;
import '../ui/views/savages/savages_view.dart' as _i9;
import '../ui/views/startup/startup_view.dart' as _i1;
import '../ui/views/unknown/unknown_view.dart' as _i7;
import '../ui/views/verify_email/verify_email_view.dart' as _i4;

final stackedRouter = StackedRouterWeb(
  navigatorKey: _i16.StackedService.navigatorKey,
  authenticationGuard: _i17.AuthenticationGuard(),
);

class StackedRouterWeb extends _i18.RootStackRouter {
  StackedRouterWeb({
    _i19.GlobalKey<_i19.NavigatorState>? navigatorKey,
    required this.authenticationGuard,
  }) : super(navigatorKey);

  final _i17.AuthenticationGuard authenticationGuard;

  @override
  final Map<String, _i18.PageFactory> pagesMap = {
    StartupViewRoute.name: (routeData) {
      return _i18.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.StartupView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    HomeViewRoute.name: (routeData) {
      return _i18.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i2.HomeView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    LoginViewRoute.name: (routeData) {
      final args =
          routeData.argsAs<LoginViewArgs>(orElse: () => const LoginViewArgs());
      return _i18.CustomPage<dynamic>(
        routeData: routeData,
        child: _i3.LoginView(
          onLoginCallback: args.onLoginCallback,
          key: args.key,
        ),
        opaque: true,
        barrierDismissible: false,
      );
    },
    VerifyEmailViewRoute.name: (routeData) {
      return _i18.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i4.VerifyEmailView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    AddUserDataViewRoute.name: (routeData) {
      return _i18.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i5.AddUserDataView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    CreateBusinessProfileViewRoute.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.CreateBusinessProfileView(),
      );
    },
    UnknownViewRoute.name: (routeData) {
      return _i18.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i7.UnknownView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    OverviewViewRoute.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.OverviewView(),
      );
    },
    SavagesViewRoute.name: (routeData) {
      return _i18.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i9.SavagesView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    HotDesksViewRoute.name: (routeData) {
      return _i18.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i10.HotDesksView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    MeetingRoomViewRoute.name: (routeData) {
      return _i18.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i11.MeetingRoomView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    BillingViewRoute.name: (routeData) {
      return _i18.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i12.BillingView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    ProfileViewRoute.name: (routeData) {
      return _i18.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i13.ProfileView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    BookingsViewRoute.name: (routeData) {
      return _i18.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i14.BookingsView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    InvoicesViewRoute.name: (routeData) {
      return _i18.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i15.InvoicesView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i18.RouteConfig> get routes => [
        _i18.RouteConfig(
          StartupViewRoute.name,
          path: '/',
        ),
        _i18.RouteConfig(
          HomeViewRoute.name,
          path: '/',
          guards: [authenticationGuard],
          children: [
            _i18.RouteConfig(
              OverviewViewRoute.name,
              path: 'overview',
              parent: HomeViewRoute.name,
            ),
            _i18.RouteConfig(
              SavagesViewRoute.name,
              path: 'savages',
              parent: HomeViewRoute.name,
            ),
            _i18.RouteConfig(
              HotDesksViewRoute.name,
              path: 'hot-desks',
              parent: HomeViewRoute.name,
            ),
            _i18.RouteConfig(
              MeetingRoomViewRoute.name,
              path: 'meeting-room',
              parent: HomeViewRoute.name,
            ),
            _i18.RouteConfig(
              BillingViewRoute.name,
              path: 'billing',
              parent: HomeViewRoute.name,
            ),
            _i18.RouteConfig(
              ProfileViewRoute.name,
              path: 'profile',
              parent: HomeViewRoute.name,
            ),
            _i18.RouteConfig(
              BookingsViewRoute.name,
              path: 'bookings',
              parent: HomeViewRoute.name,
            ),
            _i18.RouteConfig(
              InvoicesViewRoute.name,
              path: 'invoices',
              parent: HomeViewRoute.name,
            ),
          ],
        ),
        _i18.RouteConfig(
          LoginViewRoute.name,
          path: '/login-view',
        ),
        _i18.RouteConfig(
          VerifyEmailViewRoute.name,
          path: '/verify-email-view',
          guards: [authenticationGuard],
        ),
        _i18.RouteConfig(
          AddUserDataViewRoute.name,
          path: '/add-user-data-view',
          guards: [authenticationGuard],
        ),
        _i18.RouteConfig(
          CreateBusinessProfileViewRoute.name,
          path: '/create-business-profile-view',
          guards: [authenticationGuard],
        ),
        _i18.RouteConfig(
          UnknownViewRoute.name,
          path: '/404',
        ),
        _i18.RouteConfig(
          '*#redirect',
          path: '*',
          redirectTo: '/404',
          fullMatch: true,
        ),
      ];
}

/// generated route for
/// [_i1.StartupView]
class StartupViewRoute extends _i18.PageRouteInfo<void> {
  const StartupViewRoute()
      : super(
          StartupViewRoute.name,
          path: '/',
        );

  static const String name = 'StartupView';
}

/// generated route for
/// [_i2.HomeView]
class HomeViewRoute extends _i18.PageRouteInfo<void> {
  const HomeViewRoute({List<_i18.PageRouteInfo>? children})
      : super(
          HomeViewRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'HomeView';
}

/// generated route for
/// [_i3.LoginView]
class LoginViewRoute extends _i18.PageRouteInfo<LoginViewArgs> {
  LoginViewRoute({
    dynamic Function(bool)? onLoginCallback,
    _i19.Key? key,
  }) : super(
          LoginViewRoute.name,
          path: '/login-view',
          args: LoginViewArgs(
            onLoginCallback: onLoginCallback,
            key: key,
          ),
        );

  static const String name = 'LoginView';
}

class LoginViewArgs {
  const LoginViewArgs({
    this.onLoginCallback,
    this.key,
  });

  final dynamic Function(bool)? onLoginCallback;

  final _i19.Key? key;

  @override
  String toString() {
    return 'LoginViewArgs{onLoginCallback: $onLoginCallback, key: $key}';
  }
}

/// generated route for
/// [_i4.VerifyEmailView]
class VerifyEmailViewRoute extends _i18.PageRouteInfo<void> {
  const VerifyEmailViewRoute()
      : super(
          VerifyEmailViewRoute.name,
          path: '/verify-email-view',
        );

  static const String name = 'VerifyEmailView';
}

/// generated route for
/// [_i5.AddUserDataView]
class AddUserDataViewRoute extends _i18.PageRouteInfo<void> {
  const AddUserDataViewRoute()
      : super(
          AddUserDataViewRoute.name,
          path: '/add-user-data-view',
        );

  static const String name = 'AddUserDataView';
}

/// generated route for
/// [_i6.CreateBusinessProfileView]
class CreateBusinessProfileViewRoute extends _i18.PageRouteInfo<void> {
  const CreateBusinessProfileViewRoute()
      : super(
          CreateBusinessProfileViewRoute.name,
          path: '/create-business-profile-view',
        );

  static const String name = 'CreateBusinessProfileView';
}

/// generated route for
/// [_i7.UnknownView]
class UnknownViewRoute extends _i18.PageRouteInfo<void> {
  const UnknownViewRoute()
      : super(
          UnknownViewRoute.name,
          path: '/404',
        );

  static const String name = 'UnknownView';
}

/// generated route for
/// [_i8.OverviewView]
class OverviewViewRoute extends _i18.PageRouteInfo<void> {
  const OverviewViewRoute()
      : super(
          OverviewViewRoute.name,
          path: 'overview',
        );

  static const String name = 'OverviewView';
}

/// generated route for
/// [_i9.SavagesView]
class SavagesViewRoute extends _i18.PageRouteInfo<void> {
  const SavagesViewRoute()
      : super(
          SavagesViewRoute.name,
          path: 'savages',
        );

  static const String name = 'SavagesView';
}

/// generated route for
/// [_i10.HotDesksView]
class HotDesksViewRoute extends _i18.PageRouteInfo<void> {
  const HotDesksViewRoute()
      : super(
          HotDesksViewRoute.name,
          path: 'hot-desks',
        );

  static const String name = 'HotDesksView';
}

/// generated route for
/// [_i11.MeetingRoomView]
class MeetingRoomViewRoute extends _i18.PageRouteInfo<void> {
  const MeetingRoomViewRoute()
      : super(
          MeetingRoomViewRoute.name,
          path: 'meeting-room',
        );

  static const String name = 'MeetingRoomView';
}

/// generated route for
/// [_i12.BillingView]
class BillingViewRoute extends _i18.PageRouteInfo<void> {
  const BillingViewRoute()
      : super(
          BillingViewRoute.name,
          path: 'billing',
        );

  static const String name = 'BillingView';
}

/// generated route for
/// [_i13.ProfileView]
class ProfileViewRoute extends _i18.PageRouteInfo<void> {
  const ProfileViewRoute()
      : super(
          ProfileViewRoute.name,
          path: 'profile',
        );

  static const String name = 'ProfileView';
}

/// generated route for
/// [_i14.BookingsView]
class BookingsViewRoute extends _i18.PageRouteInfo<void> {
  const BookingsViewRoute()
      : super(
          BookingsViewRoute.name,
          path: 'bookings',
        );

  static const String name = 'BookingsView';
}

/// generated route for
/// [_i15.InvoicesView]
class InvoicesViewRoute extends _i18.PageRouteInfo<void> {
  const InvoicesViewRoute()
      : super(
          InvoicesViewRoute.name,
          path: 'invoices',
        );

  static const String name = 'InvoicesView';
}

extension RouterStateExtension on _i16.RouterService {
  Future<dynamic> navigateToStartupView(
      {void Function(_i18.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const StartupViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToHomeView(
      {void Function(_i18.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const HomeViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToLoginView({
    dynamic Function(bool)? onLoginCallback,
    _i19.Key? key,
    void Function(_i18.NavigationFailure)? onFailure,
  }) async {
    return navigateTo(
      LoginViewRoute(
        onLoginCallback: onLoginCallback,
        key: key,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToVerifyEmailView(
      {void Function(_i18.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const VerifyEmailViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToAddUserDataView(
      {void Function(_i18.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const AddUserDataViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToCreateBusinessProfileView(
      {void Function(_i18.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const CreateBusinessProfileViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToUnknownView(
      {void Function(_i18.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const UnknownViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToOverviewView(
      {void Function(_i18.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const OverviewViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToSavagesView(
      {void Function(_i18.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const SavagesViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToHotDesksView(
      {void Function(_i18.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const HotDesksViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToMeetingRoomView(
      {void Function(_i18.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const MeetingRoomViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToBillingView(
      {void Function(_i18.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const BillingViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToProfileView(
      {void Function(_i18.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const ProfileViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToBookingsView(
      {void Function(_i18.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const BookingsViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToInvoicesView(
      {void Function(_i18.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const InvoicesViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithStartupView(
      {void Function(_i18.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const StartupViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithHomeView(
      {void Function(_i18.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const HomeViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithLoginView({
    dynamic Function(bool)? onLoginCallback,
    _i19.Key? key,
    void Function(_i18.NavigationFailure)? onFailure,
  }) async {
    return replaceWith(
      LoginViewRoute(
        onLoginCallback: onLoginCallback,
        key: key,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithVerifyEmailView(
      {void Function(_i18.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const VerifyEmailViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithAddUserDataView(
      {void Function(_i18.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const AddUserDataViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithCreateBusinessProfileView(
      {void Function(_i18.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const CreateBusinessProfileViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithUnknownView(
      {void Function(_i18.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const UnknownViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithOverviewView(
      {void Function(_i18.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const OverviewViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithSavagesView(
      {void Function(_i18.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const SavagesViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithHotDesksView(
      {void Function(_i18.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const HotDesksViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithMeetingRoomView(
      {void Function(_i18.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const MeetingRoomViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithBillingView(
      {void Function(_i18.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const BillingViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithProfileView(
      {void Function(_i18.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const ProfileViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithBookingsView(
      {void Function(_i18.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const BookingsViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithInvoicesView(
      {void Function(_i18.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const InvoicesViewRoute(),
      onFailure: onFailure,
    );
  }
}
