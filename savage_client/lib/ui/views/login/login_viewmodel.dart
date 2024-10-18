import 'package:savage_client/app/app.locator.dart';
import 'package:savage_client/app/app.router.dart';
import 'package:savage_client/services/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel {
  final _routerService = locator<RouterService>();
  final _userService = locator<UserService>();

  Future<void> checkIfUserIsSignedIn() async {
    try {
      setBusy(true);
      if (_userService.isSignedIn) {
        final user = await _userService.getUser();
        if (user == null) {
          _routerService.replaceWithAddUserDataView();
        } else if (user.memberData.isEmpty) {
          _routerService.replaceWithCreateBusinessProfileView();
        } else {
          _routerService.replaceWithHomeView();
        }
      }
    } catch (error) {
      setError(error.toString());
    } finally {
      setBusy(false);
    }
  }
}
