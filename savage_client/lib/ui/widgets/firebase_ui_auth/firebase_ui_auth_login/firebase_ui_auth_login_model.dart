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

  Function(bool)? _onLoginCallback;
  set onLoginCallback(Function(bool)? function) {
    _onLoginCallback = function;
  }

  void userCreated() {
    _routerService.replaceWithVerifyEmailView(onFailure: (fail) {
      setError(fail.toString());
    });
    return;
  }

  void userEmailNotVerified() {
    _routerService.replaceWithVerifyEmailView();
    return;
  }

  Future<void> userEmailVerified() async {
    // Check if user doc exists
    final user = await _userService.getUser();
    // If user data is null, we need to create a user
    if (user == null) {
      _routerService.replaceWithAddUserDataView();
      return;
      // If there is a callback function, redirect the user to rout before
      // login call
    } else if (_onLoginCallback != null) {
      _onLoginCallback!.call(true);
      return;
      // If member data is empty, redirect the user to create a business profile
    } else if (user.memberDataId == null) {
      _routerService.replaceWithCreateBusinessProfileView();
      return;
      // Anything else, return the home view
    } else {
      _routerService.replaceWithHomeView();
      return;
    }
  }
}
