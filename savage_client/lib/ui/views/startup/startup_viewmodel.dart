import 'package:savage_client/data/user.dart';
import 'package:savage_client/services/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:savage_client/app/app.locator.dart';
import 'package:savage_client/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _routerService = locator<RouterService>();
  final _userService = locator<UserService>();

  // Place anything here that needs to happen before we get into the application
  Future runStartupLogic() async {
    // This is where you can make decisions on where your app should navigate when
    // you have custom startup logic

    // if (kDebugMode) {
    //   await _databaseService.addDummyData();
    // }

    if (!_userService.isSignedIn) {
      _routerService.replaceWithLoginView();
      return;
    }

    if (!_userService.isEmailVerified) {
      _routerService.replaceWithVerifyEmailView();
      return;
    }

    final User? user = await _userService.getUser();

    if (user == null) {
      _routerService.replaceWithAddUserDataView();
      return;
    } else if (user.memberDataId == null) {
      _routerService.replaceWithCreateBusinessProfileView();
      return;
    } else {
      _routerService.replaceWithHomeView();
      return;
    }
  }
}
