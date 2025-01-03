import 'package:savage_client/route_guards/authentication_guard.dart';
import 'package:savage_client/route_guards/email_verified_guard.dart';
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
import 'package:savage_client/ui/views/family/family_view.dart';
import 'package:savage_client/ui/views/meeting_room/meeting_room_view.dart';
import 'package:savage_client/ui/views/billing/billing_view.dart';
import 'package:savage_client/ui/views/profile/profile_view.dart';
import 'package:savage_client/ui/views/bookings/bookings_view.dart';
import 'package:savage_client/ui/views/invoices/invoices_view.dart';
import 'package:savage_client/services/booking_service.dart';
import 'package:savage_client/services/desks_service.dart';
import 'package:savage_client/ui/dialogs/cupertino_date_time_picker/cupertino_date_time_picker_dialog.dart';
import 'package:savage_client/ui/views/create_business_profile/create_business_profile_view.dart';
import 'package:savage_client/services/member_data_service.dart';
import 'package:savage_client/ui/dialogs/member_card/member_card_dialog.dart';
import 'package:savage_client/services/dependency_wrappers/image_picker_service.dart';
import 'package:savage_client/services/dependency_wrappers/url_launcher_service.dart';
import 'package:savage_client/services/meeting_room_service.dart';
import 'package:savage_client/ui/dialogs/add_desk/add_desk_dialog.dart';
import 'package:savage_client/ui/dialogs/add_meeting_room/add_meeting_room_dialog.dart';
import 'package:savage_client/ui/views/terms_and_conditions/terms_and_conditions_view.dart';
// @stacked-import

// TODO implement route guards
@StackedApp(
  routes: [
    CustomRoute(path: '/', page: StartupView, initial: true),
    CustomRoute(
      page: HomeView,
      path: '/',
      guards: [
        AuthenticationGuard,
        EmailVerifiedGuard,
      ],
      children: [
        CustomRoute(path: 'overview', page: OverviewView),
        CustomRoute(path: 'family', page: FamilyView, initial: true),
        CustomRoute(path: 'hot-desks', page: HotDesksView),
        CustomRoute(path: 'meeting-room', page: MeetingRoomView),
        CustomRoute(path: 'billing', page: BillingView),
        CustomRoute(path: 'profile', page: ProfileView),
        CustomRoute(path: 'bookings', page: BookingsView),
        CustomRoute(path: 'invoices', page: InvoicesView),
      ],
    ),
    CustomRoute(path: '/login', page: LoginView),
    CustomRoute(
      path: '/email-verification',
      page: VerifyEmailView,
      guards: [
        AuthenticationGuard,
      ],
    ),
    CustomRoute(
      path: '/setup-account',
      page: AddUserDataView,
      guards: [
        AuthenticationGuard,
        EmailVerifiedGuard,
      ],
    ),
    CustomRoute(
      path: '/my-profile',
      page: CreateBusinessProfileView,
      guards: [
        AuthenticationGuard,
        EmailVerifiedGuard,
      ],
    ),
    MaterialRoute(page: TermsAndConditionsView),
// @stacked-route

    CustomRoute(page: UnknownView, path: '/404'),

    /// When none of the above routes match, redirect to UnknownView
    RedirectRoute(path: '*', redirectTo: '/404'),
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: RouterService),
    LazySingleton(
        classType: AuthenticationService,
        resolveUsing: AuthenticationService.getInstance),
    LazySingleton(
        classType: DatabaseService, resolveUsing: DatabaseService.getInstance),
    LazySingleton(classType: FunctionsService),
    LazySingleton(
        classType: StorageService, resolveUsing: StorageService.getInstance),
    LazySingleton(classType: AnalyticsService),
    LazySingleton(classType: CrashlyticsService),
    LazySingleton(classType: UserService),
    LazySingleton(classType: BookingService),
    LazySingleton(classType: DesksService),
    LazySingleton(classType: MemberDataService),
    LazySingleton(classType: ImagePickerService),
    LazySingleton(classType: UrlLauncherService),
    LazySingleton(classType: MeetingRoomService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    StackedDialog(classType: CupertinoDateTimePickerDialog),
    StackedDialog(classType: MemberCardDialog),
    StackedDialog(classType: AddDeskDialog),
    StackedDialog(classType: AddMeetingRoomDialog),
// @stacked-dialog
  ],
  logger: StackedLogger(),
)
class App {}
