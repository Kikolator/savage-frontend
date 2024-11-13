import 'package:flutter/material.dart';
import 'package:savage_client/app/app.locator.dart';
import 'package:savage_client/app/app.router.dart';
import 'package:savage_client/data/user.dart';
import 'package:savage_client/services/user_service.dart';
import 'package:savage_client/ui/widgets/common/drawer_menu_button/drawer_menu_button.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends IndexTrackingViewModel {
  HomeViewModel() {
    /// Sets current index to page according to url in web platforms.
    setCurrentWebPageIndex(_routerService);
  }

  final _routerService = locator<RouterService>();
  final _snackbarService = locator<SnackbarService>();
  final _userService = locator<UserService>();
  final _dialogService = locator<DialogService>();

  // Busy objects
  static const kCheckInOutBusyObject = 'checkInOut';

  // Titles for the drawer menu
  static const String kOverviewViewTitle = 'Overview';
  static const String kSavagesViewTitle = 'Family';
  static const String kHotDesksViewTitle = 'Hot Desks';
  static const String kMeetingRoomViewTitle = 'Meeting Room';
  static const String kBillingViewTitle = 'Billing';

  // Titles for end drawer menu
  static const String kProfileViewtitle = 'Profile';
  static const String kBookingsViewTitle = 'Bookings';
  static const String kInvoicesViewTitle = 'Invoices';

  // Icon data for the drawer menu
  static const IconData kOverviewViewIconData = Icons.dashboard;
  static const IconData kSavagesViewIconData = Icons.groups_2;
  static const IconData kHotDesksViewIconData = Icons.laptop;
  static const IconData kMeetingRoomViewIconData = Icons.meeting_room;
  static const IconData kBillingViewIconData = Icons.credit_card;

  // index values for routes
  static const int kOverviewViewIndex = 0;
  static const int kSavagesViewIndex = 1;
  static const int kHotDesksViewIndex = 2;
  static const int kMeetingRoomViewIndex = 3;
  static const int kBillingViewIndex = 4;
  static const int kProfileViewIndex = 5;
  static const int kBookingsViewIndex = 6;
  static const int kInvoicesViewIndex = 7;

  User? _user;
  String? get firstName => _user?.firstName;
  String? get lastName => _user?.lastName;
  String get signupEmail => _userService.getSignupEmail;

  late bool _checkedIn;
  bool get checkedIn => _checkedIn;

  Future<void> fetchUser() async {
    setBusy(true);
    final User? user = await _userService.getUser();
    if (user == null) {
      throw UnimplementedError('User not found');
      // TODO Sign out
      // TODO Clear stack and navigate to signin
    } else {
      _user = user;
      _checkedIn = user.checkedIn;
    }
    setBusy(false);
  }

  // TODO listen to user

  Future<void> checkInOut() async {
    setBusyForObject(kCheckInOutBusyObject, true);
    _checkedIn = !_checkedIn;
    await _userService.setCheckInOut(_checkedIn);
    _user?.checkedIn = _checkedIn;
    setBusyForObject(kCheckInOutBusyObject, false);
    // Show snackbar
    if (_checkedIn) {
      _snackbarService.showSnackbar(
          title: 'Check In',
          message: 'You\'ve succesfully checked in! Now get some work done...',
          duration: const Duration(seconds: 3));
    } else {
      _snackbarService.showSnackbar(
          title: 'Check Out',
          message: 'You\'ve succesfully checked out. See you soon!',
          duration: const Duration(seconds: 3));
    }
  }

  /// Overview
  /// Savages
  /// HotDesks
  /// MeetingRoom
  /// Billing
  List<Widget> drawerItems() => [
        // DrawerMenuButton(
        //   title: kOverviewViewTitle,
        //   icon: kOverviewViewIconData,
        //   route: const OverviewViewRoute(),
        //   selected: currentIndex == kOverviewViewIndex,
        //   onSelected: () => setIndex(kOverviewViewIndex),
        // ),
        DrawerMenuButton(
          title: kSavagesViewTitle,
          icon: kSavagesViewIconData,
          route: const FamilyViewRoute(),
          selected: currentIndex == kSavagesViewIndex,
          onSelected: () => setIndex(kSavagesViewIndex),
        ),
        DrawerMenuButton(
          title: kHotDesksViewTitle,
          icon: kHotDesksViewIconData,
          route: const HotDesksViewRoute(),
          selected: currentIndex == kHotDesksViewIndex,
          onSelected: () => setIndex(kHotDesksViewIndex),
        ),
        DrawerMenuButton(
          title: kMeetingRoomViewTitle,
          icon: kMeetingRoomViewIconData,
          route: const MeetingRoomViewRoute(),
          selected: currentIndex == kMeetingRoomViewIndex,
          onSelected: () => setIndex(kMeetingRoomViewIndex),
        ),
        // DrawerMenuButton(
        //   title: kBillingViewTitle,
        //   icon: kBillingViewIconData,
        //   route: const BillingViewRoute(),
        //   selected: currentIndex == kBillingViewIndex,
        //   onSelected: () => setIndex(kBillingViewIndex),
        // ),
      ];

  /// Checkin
  /// Profile
  /// Bookings
  /// Invoices
  List<Widget> endDrawerItems() => [
        // DrawerMenuButton(
        //   route: const ProfileViewRoute(),
        //   selected: currentIndex == kProfileViewIndex,
        //   title: kProfileViewtitle,
        //   onSelected: () => setIndex(kProfileViewIndex),
        // ),
        DrawerMenuButton(
          route: const BookingsViewRoute(),
          selected: currentIndex == kBookingsViewIndex,
          title: kBookingsViewTitle,
          onSelected: () => setIndex(kBookingsViewIndex),
        ),
        // DrawerMenuButton(
        //   route: const InvoicesViewRoute(),
        //   selected: currentIndex == kInvoicesViewIndex,
        //   title: kInvoicesViewTitle,
        //   onSelected: () => setIndex(kInvoicesViewIndex),
        // ),
      ];

  Future<void> logOut() async {
    final response = await _dialogService.showConfirmationDialog(
      title: 'Sign Out',
      description: 'Are you sure you want to log out?',
      confirmationTitle: 'Log Out',
      cancelTitle: 'Cancel',
    );
    if (response != null && response.confirmed) {
      await _userService.signOut();
      _routerService.clearStackAndShow(LoginViewRoute());
    }
  }
}
