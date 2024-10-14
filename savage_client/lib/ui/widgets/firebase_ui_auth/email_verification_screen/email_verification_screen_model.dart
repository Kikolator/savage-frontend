import 'package:savage_client/app/app.locator.dart';
import 'package:savage_client/app/app.router.dart';
import 'package:savage_client/services/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class EmailVerificationScreenModel extends BaseViewModel {
  final _routerService = locator<RouterService>();
  final _userService = locator<UserService>();

  void onAuthCancelled() async {
    await _userService.signOut();
    _routerService.clearStackAndShow(const LoginViewRoute());
  }

  void onEmailVerified() {
    _routerService.clearStackAndShow(const AddUserDataViewRoute());
  }
}
