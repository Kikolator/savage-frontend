import 'package:savage_client/app/app.locator.dart';
import 'package:savage_client/app/app.router.dart';
import 'package:savage_client/data/member_data.dart';
import 'package:savage_client/services/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class MemberCardDialogModel extends BaseViewModel {
  final MemberData _memberData;
  final _userService = locator<UserService>();
  final _routerService = locator<RouterService>();

  MemberCardDialogModel(this._memberData) {
    _memberData.uid == _userService.user!.uid
        ? _isUserCard = true
        : _isUserCard = false;
  }

  bool _isUserCard = false;
  bool get isUserCard => _isUserCard;

  void callToPhone() {}

  void sendEmail() {}

  void navigateToWebsite() {}

  void editProfile() {
    _routerService.back();
    _routerService.navigateToCreateBusinessProfileView();
  }
}
