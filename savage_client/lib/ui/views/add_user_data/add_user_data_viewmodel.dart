import 'package:savage_client/app/app.locator.dart';
import 'package:savage_client/app/app.router.dart';
import 'package:savage_client/services/user_service.dart';
import 'package:savage_client/ui/views/add_user_data/add_user_data_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AddUserDataViewModel extends FormViewModel {
  final _userService = locator<UserService>();
  final _routerService = locator<RouterService>();

  late String _signupEmail;
  String get signupEmail => _signupEmail;

  void initialise() {
    _signupEmail = _userService.getSignupEmail;
    contactEmailValue = _signupEmail;
    setFirstNameValidationMessage(null);
    setLastNameValidationMessage(null);
    setContactEmailValidationMessage(null);
    setPhoneWhatsappValidationMessage(null);
  }

  bool _showValidationMessages = false;
  bool get showValidationMessages => _showValidationMessages;

  Future<void> submitForm() async {
    try {
      setBusy(true);
      setError(null);
      if (hasFirstName &&
          hasLastName &&
          hasContactEmail &&
          hasPhoneWhatsapp &&
          !hasAnyValidationMessage) {
        await _userService.createUser(
          firstName: firstNameValue!,
          lastName: lastNameValue!,
          contactEmail: contactEmailValue!,
          phoneWhatsapp: phoneWhatsappValue!,
        );
        _routerService.replaceWithHomeView();
      } else {
        _showValidationMessages = true;
        rebuildUi();
      }
    } catch (error) {
      setError(error.toString());
    } finally {
      setBusy(false);
    }
  }
}
