import 'package:savage_client/app/app.locator.dart';
import 'package:savage_client/app/app.router.dart';
import 'package:savage_client/services/user_service.dart';
import 'package:savage_client/ui/views/add_user_data/add_user_data_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AddUserDataViewModel extends FormViewModel {
  final _userService = locator<UserService>();
  final _routerService = locator<RouterService>();

  late String _contactEmail;
  String get contactEmail => _contactEmail;

  Future<void> initialise() async {
    try {
      final user = await _userService.getUser();
      if (user == null) {
        _contactEmail = _userService.getSignupEmail;
        contactEmailValue = _contactEmail;
        // contactPhoneValue = _userService.getSignupPhone;
        // setFirstNameValidationMessage(null);
        // setLastNameValidationMessage(null);
        // setContactEmailValidationMessage(null);
        // setPhoneWhatsappValidationMessage(null);
      } else {
        _contactEmail = user.contactEmail;
        contactEmailValue = user.contactEmail;
        firstNameValue = user.firstName;
        lastNameValue = user.lastName;
        contactEmailValue = user.contactEmail;
        contactPhoneValue = user.contactPhone;
        phoneWhatsappValue = user.phoneWhatsapp;
      }
    } catch (error) {
      setError(error.toString());
    } finally {
      setBusy(false);
    }
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
          hasContactPhone &&
          !hasAnyValidationMessage) {
        phoneWhatsappValue =
            phoneWhatsappValue == null || phoneWhatsappValue!.isEmpty
                ? contactPhoneValue
                : phoneWhatsappValue;
        await _userService.createUser(
            firstName: firstNameValue!,
            lastName: lastNameValue!,
            contactEmail: contactEmailValue!,
            phoneWhatsapp: phoneWhatsappValue!,
            contactPhone: contactPhoneValue!);
        _routerService.navigateToCreateBusinessProfileView();
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
