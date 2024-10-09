// Mocks generated by Mockito 5.4.4 from annotations
// in savage_client/test/helpers/test_helpers.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;
import 'dart:ui' as _i8;

import 'package:flutter/material.dart' as _i5;
import 'package:mockito/mockito.dart' as _i1;
import 'package:stacked/stacked.dart' as _i2;
import 'package:stacked_services/src/bottom_sheet/bottom_sheet_service.dart'
    as _i6;
import 'package:stacked_services/src/dialog/dialog_service.dart' as _i9;
import 'package:stacked_services/src/models/overlay_request.dart' as _i10;
import 'package:stacked_services/src/models/overlay_response.dart' as _i7;
import 'package:stacked_services/src/navigation/router_service.dart' as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeRootStackRouter_0 extends _i1.SmartFake
    implements _i2.RootStackRouter {
  _FakeRootStackRouter_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeRouteData_1 extends _i1.SmartFake implements _i2.RouteData {
  _FakeRouteData_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeRoutingController_2 extends _i1.SmartFake
    implements _i2.RoutingController {
  _FakeRoutingController_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [RouterService].
///
/// See the documentation for Mockito's code generation for more information.
class MockRouterService extends _i1.Mock implements _i3.RouterService {
  @override
  _i2.RootStackRouter get router => (super.noSuchMethod(
        Invocation.getter(#router),
        returnValue: _FakeRootStackRouter_0(
          this,
          Invocation.getter(#router),
        ),
        returnValueForMissingStub: _FakeRootStackRouter_0(
          this,
          Invocation.getter(#router),
        ),
      ) as _i2.RootStackRouter);

  @override
  set router(_i2.RootStackRouter? _router) => super.noSuchMethod(
        Invocation.setter(
          #router,
          _router,
        ),
        returnValueForMissingStub: null,
      );

  @override
  List<_i2.StackedPage<dynamic>> get stack => (super.noSuchMethod(
        Invocation.getter(#stack),
        returnValue: <_i2.StackedPage<dynamic>>[],
        returnValueForMissingStub: <_i2.StackedPage<dynamic>>[],
      ) as List<_i2.StackedPage<dynamic>>);

  @override
  _i2.RouteData get topRoute => (super.noSuchMethod(
        Invocation.getter(#topRoute),
        returnValue: _FakeRouteData_1(
          this,
          Invocation.getter(#topRoute),
        ),
        returnValueForMissingStub: _FakeRouteData_1(
          this,
          Invocation.getter(#topRoute),
        ),
      ) as _i2.RouteData);

  @override
  dynamic setRouter(_i2.RootStackRouter? router) => super.noSuchMethod(
        Invocation.method(
          #setRouter,
          [router],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i4.Future<dynamic> navigateTo(
    _i2.PageRouteInfo<dynamic>? route, {
    _i2.OnNavigationFailure? onFailure,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #navigateTo,
          [route],
          {#onFailure: onFailure},
        ),
        returnValue: _i4.Future<dynamic>.value(),
        returnValueForMissingStub: _i4.Future<dynamic>.value(),
      ) as _i4.Future<dynamic>);

  @override
  _i4.Future<void> navigateToPath({
    required String? path,
    bool? includePrefixMatches = false,
    _i2.OnNavigationFailure? onFailure,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #navigateToPath,
          [],
          {
            #path: path,
            #includePrefixMatches: includePrefixMatches,
            #onFailure: onFailure,
          },
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);

  @override
  _i4.Future<T?> navigateWithTransition<T extends Object?>(
    _i5.Widget? widget, {
    _i5.RouteTransitionsBuilder? transitionBuilder,
    bool? fullscreenDialog = false,
    Duration? transitionDuration = const Duration(milliseconds: 300),
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #navigateWithTransition,
          [widget],
          {
            #transitionBuilder: transitionBuilder,
            #fullscreenDialog: fullscreenDialog,
            #transitionDuration: transitionDuration,
          },
        ),
        returnValue: _i4.Future<T?>.value(),
        returnValueForMissingStub: _i4.Future<T?>.value(),
      ) as _i4.Future<T?>);

  @override
  _i4.Future<T?> replaceWith<T extends Object?>(
    _i2.PageRouteInfo<dynamic>? route, {
    _i2.OnNavigationFailure? onFailure,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #replaceWith,
          [route],
          {#onFailure: onFailure},
        ),
        returnValue: _i4.Future<T?>.value(),
        returnValueForMissingStub: _i4.Future<T?>.value(),
      ) as _i4.Future<T?>);

  @override
  _i4.Future<void> clearStackAndShow(
    _i2.PageRouteInfo<dynamic>? route, {
    _i2.OnNavigationFailure? onFailure,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #clearStackAndShow,
          [route],
          {#onFailure: onFailure},
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);

  @override
  _i4.Future<void> clearStackAndShowView(
    _i5.Widget? widget, {
    _i5.RouteTransitionsBuilder? transitionBuilder,
    bool? fullscreenDialog = false,
    Duration? transitionDuration = const Duration(milliseconds: 300),
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #clearStackAndShowView,
          [widget],
          {
            #transitionBuilder: transitionBuilder,
            #fullscreenDialog: fullscreenDialog,
            #transitionDuration: transitionDuration,
          },
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);

  @override
  void popForced<T extends Object?>([T? result]) => super.noSuchMethod(
        Invocation.method(
          #popForced,
          [result],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i4.Future<bool> pop<T extends Object?>([T? result]) => (super.noSuchMethod(
        Invocation.method(
          #pop,
          [result],
        ),
        returnValue: _i4.Future<bool>.value(false),
        returnValueForMissingStub: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);

  @override
  void back<T extends Object?>({T? result}) => super.noSuchMethod(
        Invocation.method(
          #back,
          [],
          {#result: result},
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i2.RoutingController topMostRouter({bool? ignorePagelessRoutes = false}) =>
      (super.noSuchMethod(
        Invocation.method(
          #topMostRouter,
          [],
          {#ignorePagelessRoutes: ignorePagelessRoutes},
        ),
        returnValue: _FakeRoutingController_2(
          this,
          Invocation.method(
            #topMostRouter,
            [],
            {#ignorePagelessRoutes: ignorePagelessRoutes},
          ),
        ),
        returnValueForMissingStub: _FakeRoutingController_2(
          this,
          Invocation.method(
            #topMostRouter,
            [],
            {#ignorePagelessRoutes: ignorePagelessRoutes},
          ),
        ),
      ) as _i2.RoutingController);

  @override
  _i4.Future<T?> pushNativeRoute<T extends Object?>(_i5.Route<T>? route) =>
      (super.noSuchMethod(
        Invocation.method(
          #pushNativeRoute,
          [route],
        ),
        returnValue: _i4.Future<T?>.value(),
        returnValueForMissingStub: _i4.Future<T?>.value(),
      ) as _i4.Future<T?>);
}

/// A class which mocks [BottomSheetService].
///
/// See the documentation for Mockito's code generation for more information.
class MockBottomSheetService extends _i1.Mock
    implements _i6.BottomSheetService {
  @override
  void setCustomSheetBuilders(Map<dynamic, _i6.SheetBuilder>? builders) =>
      super.noSuchMethod(
        Invocation.method(
          #setCustomSheetBuilders,
          [builders],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i4.Future<_i7.SheetResponse<dynamic>?> showBottomSheet({
    required String? title,
    String? description,
    String? confirmButtonTitle = r'Ok',
    String? cancelButtonTitle,
    bool? enableDrag = true,
    bool? barrierDismissible = true,
    bool? isScrollControlled = false,
    Duration? exitBottomSheetDuration,
    Duration? enterBottomSheetDuration,
    bool? ignoreSafeArea,
    bool? useRootNavigator = false,
    double? elevation = 1.0,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #showBottomSheet,
          [],
          {
            #title: title,
            #description: description,
            #confirmButtonTitle: confirmButtonTitle,
            #cancelButtonTitle: cancelButtonTitle,
            #enableDrag: enableDrag,
            #barrierDismissible: barrierDismissible,
            #isScrollControlled: isScrollControlled,
            #exitBottomSheetDuration: exitBottomSheetDuration,
            #enterBottomSheetDuration: enterBottomSheetDuration,
            #ignoreSafeArea: ignoreSafeArea,
            #useRootNavigator: useRootNavigator,
            #elevation: elevation,
          },
        ),
        returnValue: _i4.Future<_i7.SheetResponse<dynamic>?>.value(),
        returnValueForMissingStub:
            _i4.Future<_i7.SheetResponse<dynamic>?>.value(),
      ) as _i4.Future<_i7.SheetResponse<dynamic>?>);

  @override
  _i4.Future<_i7.SheetResponse<T>?> showCustomSheet<T, R>({
    dynamic variant,
    String? title,
    String? description,
    bool? hasImage = false,
    String? imageUrl,
    bool? showIconInMainButton = false,
    String? mainButtonTitle,
    bool? showIconInSecondaryButton = false,
    String? secondaryButtonTitle,
    bool? showIconInAdditionalButton = false,
    String? additionalButtonTitle,
    bool? takesInput = false,
    _i8.Color? barrierColor = const _i8.Color(2315255808),
    double? elevation = 1.0,
    bool? barrierDismissible = true,
    bool? isScrollControlled = false,
    String? barrierLabel = r'',
    dynamic customData,
    R? data,
    bool? enableDrag = true,
    Duration? exitBottomSheetDuration,
    Duration? enterBottomSheetDuration,
    bool? ignoreSafeArea,
    bool? useRootNavigator = false,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #showCustomSheet,
          [],
          {
            #variant: variant,
            #title: title,
            #description: description,
            #hasImage: hasImage,
            #imageUrl: imageUrl,
            #showIconInMainButton: showIconInMainButton,
            #mainButtonTitle: mainButtonTitle,
            #showIconInSecondaryButton: showIconInSecondaryButton,
            #secondaryButtonTitle: secondaryButtonTitle,
            #showIconInAdditionalButton: showIconInAdditionalButton,
            #additionalButtonTitle: additionalButtonTitle,
            #takesInput: takesInput,
            #barrierColor: barrierColor,
            #elevation: elevation,
            #barrierDismissible: barrierDismissible,
            #isScrollControlled: isScrollControlled,
            #barrierLabel: barrierLabel,
            #customData: customData,
            #data: data,
            #enableDrag: enableDrag,
            #exitBottomSheetDuration: exitBottomSheetDuration,
            #enterBottomSheetDuration: enterBottomSheetDuration,
            #ignoreSafeArea: ignoreSafeArea,
            #useRootNavigator: useRootNavigator,
          },
        ),
        returnValue: _i4.Future<_i7.SheetResponse<T>?>.value(),
        returnValueForMissingStub: _i4.Future<_i7.SheetResponse<T>?>.value(),
      ) as _i4.Future<_i7.SheetResponse<T>?>);

  @override
  void completeSheet(_i7.SheetResponse<dynamic>? response) =>
      super.noSuchMethod(
        Invocation.method(
          #completeSheet,
          [response],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [DialogService].
///
/// See the documentation for Mockito's code generation for more information.
class MockDialogService extends _i1.Mock implements _i9.DialogService {
  @override
  void registerCustomDialogBuilders(
          Map<dynamic, _i9.DialogBuilder>? builders) =>
      super.noSuchMethod(
        Invocation.method(
          #registerCustomDialogBuilders,
          [builders],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void registerCustomDialogBuilder({
    required dynamic variant,
    required _i5.Widget Function(
      _i5.BuildContext,
      _i10.DialogRequest<dynamic>,
      dynamic Function(_i7.DialogResponse<dynamic>),
    )? builder,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #registerCustomDialogBuilder,
          [],
          {
            #variant: variant,
            #builder: builder,
          },
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i4.Future<_i7.DialogResponse<dynamic>?> showDialog({
    String? title,
    String? description,
    String? cancelTitle,
    _i8.Color? cancelTitleColor,
    String? buttonTitle = r'Ok',
    _i8.Color? buttonTitleColor,
    bool? barrierDismissible = false,
    _i9.DialogPlatform? dialogPlatform,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #showDialog,
          [],
          {
            #title: title,
            #description: description,
            #cancelTitle: cancelTitle,
            #cancelTitleColor: cancelTitleColor,
            #buttonTitle: buttonTitle,
            #buttonTitleColor: buttonTitleColor,
            #barrierDismissible: barrierDismissible,
            #dialogPlatform: dialogPlatform,
          },
        ),
        returnValue: _i4.Future<_i7.DialogResponse<dynamic>?>.value(),
        returnValueForMissingStub:
            _i4.Future<_i7.DialogResponse<dynamic>?>.value(),
      ) as _i4.Future<_i7.DialogResponse<dynamic>?>);

  @override
  _i4.Future<_i7.DialogResponse<T>?> showCustomDialog<T, R>({
    dynamic variant,
    String? title,
    String? description,
    bool? hasImage = false,
    String? imageUrl,
    bool? showIconInMainButton = false,
    String? mainButtonTitle,
    bool? showIconInSecondaryButton = false,
    String? secondaryButtonTitle,
    bool? showIconInAdditionalButton = false,
    String? additionalButtonTitle,
    bool? takesInput = false,
    _i8.Color? barrierColor = const _i8.Color(2315255808),
    bool? barrierDismissible = false,
    String? barrierLabel = r'',
    bool? useSafeArea = true,
    dynamic customData,
    R? data,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #showCustomDialog,
          [],
          {
            #variant: variant,
            #title: title,
            #description: description,
            #hasImage: hasImage,
            #imageUrl: imageUrl,
            #showIconInMainButton: showIconInMainButton,
            #mainButtonTitle: mainButtonTitle,
            #showIconInSecondaryButton: showIconInSecondaryButton,
            #secondaryButtonTitle: secondaryButtonTitle,
            #showIconInAdditionalButton: showIconInAdditionalButton,
            #additionalButtonTitle: additionalButtonTitle,
            #takesInput: takesInput,
            #barrierColor: barrierColor,
            #barrierDismissible: barrierDismissible,
            #barrierLabel: barrierLabel,
            #useSafeArea: useSafeArea,
            #customData: customData,
            #data: data,
          },
        ),
        returnValue: _i4.Future<_i7.DialogResponse<T>?>.value(),
        returnValueForMissingStub: _i4.Future<_i7.DialogResponse<T>?>.value(),
      ) as _i4.Future<_i7.DialogResponse<T>?>);

  @override
  _i4.Future<_i7.DialogResponse<dynamic>?> showConfirmationDialog({
    String? title,
    String? description,
    String? cancelTitle = r'Cancel',
    _i8.Color? cancelTitleColor,
    String? confirmationTitle = r'Ok',
    _i8.Color? confirmationTitleColor,
    bool? barrierDismissible = false,
    _i9.DialogPlatform? dialogPlatform,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #showConfirmationDialog,
          [],
          {
            #title: title,
            #description: description,
            #cancelTitle: cancelTitle,
            #cancelTitleColor: cancelTitleColor,
            #confirmationTitle: confirmationTitle,
            #confirmationTitleColor: confirmationTitleColor,
            #barrierDismissible: barrierDismissible,
            #dialogPlatform: dialogPlatform,
          },
        ),
        returnValue: _i4.Future<_i7.DialogResponse<dynamic>?>.value(),
        returnValueForMissingStub:
            _i4.Future<_i7.DialogResponse<dynamic>?>.value(),
      ) as _i4.Future<_i7.DialogResponse<dynamic>?>);

  @override
  void completeDialog(_i7.DialogResponse<dynamic>? response) =>
      super.noSuchMethod(
        Invocation.method(
          #completeDialog,
          [response],
        ),
        returnValueForMissingStub: null,
      );
}
