import 'package:savage_client/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:savage_client/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:savage_client/ui/views/home/home_view.dart';
import 'package:savage_client/ui/views/startup/startup_view.dart';
import 'package:savage_client/ui/views/unknown/unknown_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:savage_client/services/dependency_wrappers/authentication_service.dart';
import 'package:savage_client/services/dependency_wrappers/database_service.dart';
import 'package:savage_client/services/dependency_wrappers/functions_service.dart';
import 'package:savage_client/services/dependency_wrappers/storage_service.dart';
import 'package:savage_client/services/dependency_wrappers/analytics_service.dart';
import 'package:savage_client/services/dependency_wrappers/crashlytics_service.dart';
import 'package:savage_client/ui/views/login/login_view.dart';
import 'package:savage_client/ui/views/verify_email/verify_email_view.dart';
import 'package:savage_client/services/user_service.dart';
import 'package:savage_client/ui/views/add_user_data/add_user_data_view.dart';
import 'package:savage_client/ui/views/overview/overview_view.dart';
import 'package:savage_client/ui/views/hot_desks/hot_desks_view.dart';
import 'package:savage_client/ui/views/savages/savages_view.dart';
import 'package:savage_client/ui/views/meeting_room/meeting_room_view.dart';
import 'package:savage_client/ui/views/billing/billing_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    CustomRoute(page: StartupView, initial: true),
    CustomRoute(
      page: HomeView,
      path: '/',
      children: [
        MaterialRoute(path: 'overview', page: OverviewView),
        CustomRoute(path: 'savages', page: SavagesView),
        CustomRoute(path: 'hot-desks', page: HotDesksView),
        CustomRoute(path: 'meeting-room', page: MeetingRoomView),
        CustomRoute(path: 'billing', page: BillingView),
      ],
    ),
    CustomRoute(page: LoginView),
    CustomRoute(page: VerifyEmailView),
    CustomRoute(page: AddUserDataView),

// @stacked-route

    CustomRoute(page: UnknownView, path: '/404'),

    /// When none of the above routes match, redirect to UnknownView
    RedirectRoute(path: '*', redirectTo: '/404'),
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: RouterService),
    LazySingleton(
        classType: AuthenticationService,
        resolveUsing: AuthenticationService.getInstance),
    LazySingleton(
        classType: DatabaseService, resolveUsing: DatabaseService.getInstance),
    LazySingleton(classType: FunctionsService),
    LazySingleton(classType: StorageService),
    LazySingleton(classType: AnalyticsService),
    LazySingleton(classType: CrashlyticsService),
    LazySingleton(classType: UserService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
