import 'package:savage_client/app/app.locator.dart';
import 'package:savage_client/services/user_service.dart';
import 'package:stacked/stacked.dart';

class ProfileButtonModel extends BaseViewModel {
  final _userService = locator<UserService>();

  String? _photoUrl;
  String? get photoUrl => _photoUrl;

  void setPhotoUrl(String? photoUrl) {
    if (photoUrl != null) {
      _photoUrl = photoUrl;
    } else {
      _photoUrl = _userService.getPhotoUrl;
    }
    rebuildUi();
  }
}
