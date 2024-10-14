import 'package:savage_client/app/app.locator.dart';
import 'package:savage_client/services/user_service.dart';
import 'package:stacked/stacked.dart';

class ProfileButtonModel extends BaseViewModel {
  final _userService = locator<UserService>();
  get photoUrl => _userService.getPhotoUrl;
}
