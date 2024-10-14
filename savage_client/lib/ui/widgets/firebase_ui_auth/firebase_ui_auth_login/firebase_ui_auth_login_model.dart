import 'package:savage_client/app/app.locator.dart';
import 'package:savage_client/app/app.router.dart';
import 'package:savage_client/services/dependency_wrappers/authentication_service.dart';
import 'package:savage_client/services/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class FirebaseUiAuthLoginModel extends BaseViewModel {
  final _routerService = locator<RouterService>();
  final _authenticationService = locator<AuthenticationService>();
  final _userService = locator<UserService>();

  get auth => _authenticationService.firebaseAuth;

  void userCreated() {
    _routerService.replaceWithVerifyEmailView();
    return;
  }

  void userEmailNotVerified() {
    _routerService.replaceWithVerifyEmailView();
    return;
  }

  Future<void> userEmailVerified() async {
    // Check if user doc exists
    final user = await _userService.getUser();
    if (user == null) {
      _routerService.replaceWithAddUserDataView();
      return;
    } else {
      _routerService.replaceWithHomeView();
      return;
    }
  }
}
