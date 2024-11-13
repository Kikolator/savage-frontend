import 'package:savage_client/app/app.locator.dart';
import 'package:savage_client/app/app.logger.dart';
import 'package:savage_client/app/app.router.dart';
import 'package:savage_client/services/user_service.dart';
import 'package:savage_client/ui/views/add_user_data/add_user_data_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AddUserDataViewModel extends FormViewModel {
  final _logger = getLogger('AddUserDataViewModel');
  final _userService = locator<UserService>();
  final _routerService = locator<RouterService>();

  late String _contactEmail;
  String get contactEmail => _contactEmail;

  bool _showValidationMessages = false;
  bool get showValidationMessages => _showValidationMessages;

  // DateTime? _dateOfBirthValue;
  // DateTime? get dateOfBirthValue => _dateOfBirthValue;

  // final _dateOfBirthController = BoardDateTimeTextController();
  // BoardDateTimeTextController get dateOfBirthController =>
  //     _dateOfBirthController;

  bool _termsAccepted = false;
  bool get termsAccepted => _termsAccepted;

  Future<void> initialise() async {
    try {
      _logger.d('initialising view model');
      setBusy(true);
      setError(null);
      final user = await _userService.getUser();
      if (user == null) {
        _logger.v('user is null');
        _contactEmail = _userService.getSignupEmail;
        // contactPhoneValue = _userService.getSignupPhone;
        // setFirstNameValidationMessage(null);
        // setLastNameValidationMessage(null);
        // setContactEmailValidationMessage(null);
        // setPhoneWhatsappValidationMessage(null);
      } else {
        _logger.v('user is not null');
        _logger.v(user.toString());
        firstNameValue = user.firstName;
        lastNameValue = user.lastName;
        contactPhoneValue = user.signupPhone;
        phoneWhatsappValue = user.whatsappPhone;
        // _dateOfBirthController.setDate(user.dateOfBirth);
        // _dateOfBirthValue = user.dateOfBirth;
      }
    } catch (error) {
      _logger.e('error on initialise');
      setError(error.toString());
    } finally {
      _logger.v('setting busy to false');
      setBusy(false);
    }
  }

  Future<void> submitForm() async {
    try {
      _logger.d('Submitting form');
      setBusy(true);
      setError(null);
      if (hasFirstName &&
          hasLastName &&
          hasContactPhone &&
          !hasAnyValidationMessage &&
          hasDob &&
          _termsAccepted) {
        _logger.v('form validated');
        phoneWhatsappValue =
            phoneWhatsappValue == null || phoneWhatsappValue!.isEmpty
                ? contactPhoneValue
                : phoneWhatsappValue;
        await _userService.createUser(
          firstName: firstNameValue!,
          lastName: lastNameValue!,
          dateOfBirth: dobValue!,
          phoneWhatsapp: phoneWhatsappValue!,
          contactPhone: contactPhoneValue!,
          termsAndConditionsVersion: '0.1',
        );
        _logger.v('navigating to business profile view');
        _routerService.navigateToCreateBusinessProfileView();
      } else {
        _logger.v('validation error, showing validation message');
        _showValidationMessages = true;
        rebuildUi();
      }
    } catch (error) {
      _logger.e('error on submit');
      setError(error.toString());
    } finally {
      setBusy(false);
    }
  }

  // void setDateOfBirth(DateTime date) {
  //   // TODO check date of birth is in the past.
  //   _dateOfBirthValue = date;
  // }

  void acceptTerms(bool? value) {
    if (value != null) {
      _termsAccepted = value;
      rebuildUi();
    }
  }

  Future<void> navigateToTermsAndConditions() async {
    final result = await _routerService.navigateToTermsAndConditionsView();
    if (result != null && result) {
      _termsAccepted = true;
      rebuildUi();
    }
  }
}
