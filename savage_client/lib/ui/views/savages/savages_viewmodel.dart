import 'package:savage_client/app/app.locator.dart';
import 'package:savage_client/app/app.router.dart';
import 'package:savage_client/data/member_data.dart';
import 'package:savage_client/services/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SavagesViewModel extends BaseViewModel {
  final _userService = locator<UserService>();
  final _routerService = locator<RouterService>();
  late MemberData _memberData;
  MemberData get memberData => _memberData;

  void navigateToCreateBusinessProfile() {
    _routerService.navigateToCreateBusinessProfileView();
  }

  Future<void> setMemberData() async {
    try {
      setBusy(true);
      _memberData = await _userService.getUserMemberData();
    } catch (error) {
      setError(error.toString());
    } finally {
      setBusy(false);
    }
  }
}
