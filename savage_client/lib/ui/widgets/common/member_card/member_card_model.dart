import 'package:savage_client/app/app.dialogs.dart';
import 'package:savage_client/app/app.locator.dart';
import 'package:savage_client/data/member_data.dart';
import 'package:savage_client/services/dependency_wrappers/url_launcher_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class MemberCardModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final _urlLauncherService = locator<UrlLauncherService>();
  final MemberData memberData;

  MemberCardModel(this.memberData);

  void showDetails() {
    _dialogService.showCustomDialog<dynamic, MemberData>(
        variant: DialogType.memberCard, data: memberData);
  }

  void navigateToWebsite() {
    _urlLauncherService.launchWeb(host: memberData.website!);
  }

  void sendEmail() {
    _urlLauncherService.launchMail(memberData.companyEmail!);
  }

  void callToPhone() {
    _urlLauncherService.launchPhone(memberData.companyPhone!);
  }
}
