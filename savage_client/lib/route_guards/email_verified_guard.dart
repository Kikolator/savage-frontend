import 'package:savage_client/app/app.locator.dart';
import 'package:savage_client/app/app.router.dart';
import 'package:savage_client/services/user_service.dart';
import 'package:stacked/stacked.dart';

class EmailVerifiedGuard extends StackedRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final userService = locator<UserService>();
    if (userService.isEmailVerified) {
      resolver.next();
    } else {
      router.push(const VerifyEmailViewRoute());
    }
  }
}
