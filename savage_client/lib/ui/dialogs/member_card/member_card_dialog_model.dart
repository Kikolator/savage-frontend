import 'package:savage_client/app/app.locator.dart';
import 'package:savage_client/app/app.router.dart';
import 'package:savage_client/data/member_data.dart';
import 'package:savage_client/services/dependency_wrappers/url_launcher_service.dart';
import 'package:savage_client/services/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class MemberCardDialogModel extends BaseViewModel {
  final MemberData _memberData;
  final _userService = locator<UserService>();
  final _routerService = locator<RouterService>();
  final _urlLauncherService = locator<UrlLauncherService>();

  MemberCardDialogModel(this._memberData) {
    _memberData.uid == _userService.user!.uid
        ? _isUserCard = true
        : _isUserCard = false;
  }

  bool _isUserCard = false;
  bool get isUserCard => _isUserCard;

  void callToPhone() {
    _urlLauncherService.launchPhone(_memberData.companyPhone!);
  }

  void sendEmail() {
    _urlLauncherService.launchMail(_memberData.companyEmail!);
  }

  void navigateToWebsite() {
    _urlLauncherService.launchWeb(host: _memberData.website!);
  }

  void editProfile() {
    _routerService.back();
    _routerService.navigateToCreateBusinessProfileView();
  }
}
