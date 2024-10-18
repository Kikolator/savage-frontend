import 'package:savage_client/app/app.locator.dart';
import 'package:savage_client/app/app.router.dart';
import 'package:savage_client/services/user_service.dart';
import 'package:savage_client/ui/views/create_business_profile/create_business_profile_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CreateBusinessProfileViewModel extends FormViewModel {
  final _routerService = locator<RouterService>();
  final _userService = locator<UserService>();

  String? _photoUrl;
  bool _memberVisibleValue = true;
  bool get memberVisisbleValue => _memberVisibleValue;

  Future<void> getMemberData() async {
    final memberData = await _userService.getUserMemberData();
    // TODO set member data
  }

  void skip() {
    _routerService.navigateToHomeView();
  }

  void onMemberVisibleValueChange(bool value) {
    _memberVisibleValue = value;
    rebuildUi();
  }

  Future<void> submit() async {
    try {
      setBusy(true);
      await _userService.setMemberData(
        companyName: companyNameValue,
        website: websiteValue,
        description: descriptionValue,
        photoUrl: _photoUrl,
        memberVisible: _memberVisibleValue,
      );
      _routerService.replaceWithSavagesView();
    } catch (error) {
      setError(error.toString());
    } finally {
      setBusy(false);
    }
  }
}
