import 'package:image_picker/image_picker.dart';
import 'package:savage_client/app/app.locator.dart';
import 'package:savage_client/app/app.logger.dart';
import 'package:savage_client/app/app.router.dart';
import 'package:savage_client/data/member_data.dart';
import 'package:savage_client/data/user.dart';
import 'package:savage_client/services/member_data_service.dart';
import 'package:savage_client/services/user_service.dart';
import 'package:savage_client/ui/views/create_business_profile/create_business_profile_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CreateBusinessProfileViewModel extends FormViewModel {
  // TODO add onNavigationCallback to determine if Navigator should pop or replace
  CreateBusinessProfileViewModel();

  final _logger = getLogger('CreateBusinessProfileViewModel');
  final _routerService = locator<RouterService>();
  final _memberDataService = locator<MemberDataService>();
  final _userService = locator<UserService>();
  final _dialogService = locator<DialogService>();

  User? _user;

  late MemberData _memberData;
  MemberData get memberData => _memberData;

  String? _photoUrl;
  String? get photoUrl => _photoUrl;

  XFile? _imageFile;

  bool _memberVisibleValue = true;
  bool get memberVisisbleValue => _memberVisibleValue;

  Future<void> getUserData() async {
    try {
      _logger.d('getting user data');
      setBusy(true);
      _user = await _userService.getUser();
      if (_user == null) {
        throw UnimplementedError('User is null, handle error');
      }
      final memberDataId = _user!.memberDataId;
      if (memberDataId == null) {
        _logger.v('memberDataId is null');
        // throw UnimplementedError('Member data id is null, handle error');
        return;
      } else {
        _logger.v('memberDataId is not null, getting member data');
        final memberData = await _memberDataService.getUserMemberData(
            memberDataId: memberDataId);
        _memberData = memberData;
        companyNameValue = memberData.companyName;
        descriptionValue = memberData.description;
        websiteValue = memberData.website;
        companyEmailValue = memberData.companyEmail;
        companyPhoneValue = memberData.companyPhone;
        _photoUrl = memberData.photoUrl;
        return;
      }
    } catch (error) {
      _logger.e('error getting user data', error);
      setError(error.toString());
    } finally {
      _logger.v('setting busy to false');
      setBusy(false);
    }
  }

  void skip() {
    _routerService.navigateToHomeView();
  }

  void onMemberVisibleValueChange(bool value) {
    _memberVisibleValue = value;
    rebuildUi();
    return;
  }

  Future<void> _setMemberData() async {
    setBusy(true);
    setError(null);
    final uid = _user!.uid;
    final firstName = _user!.firstName;
    final lastName = _user!.lastName;
    final memberDataId = _user!.memberDataId;
    validateForm();
    // If form is valid, execute
    if (!hasCompanyNameValidationMessage &&
        !hasDescriptionValidationMessage &&
        !hasWebsiteValidationMessage) {
      // If _imageFile is not null, update user profile pic
      if (_imageFile != null) {
        _photoUrl = await _userService.updateProfilePicture(
          file: _imageFile!,
        );
      }
      _memberData = MemberData(
        id: memberDataId ?? '',
        uid: uid,
        memberVisible: _memberVisibleValue,
        membershipStatus: _user!.membershipStatus,
        photoUrl: _photoUrl,
        companyName: companyNameValue,
        description: descriptionValue,
        website: websiteValue,
        firstName: firstName,
        lastName: lastName,
        companyEmail: companyEmailValue,
        companyPhone: companyPhoneValue,
      );
      await _memberDataService.setMemberData(
        memberData: _memberData,
      );
      _routerService.replaceWithHomeView();
      return;
    } else {
      return;
    }
  }

  Future<void> submit() async {
    try {
      if (!_memberVisibleValue) {
        final dialogResponse = await _dialogService.showConfirmationDialog(
            title: 'Profile Invisible',
            description:
                'Your profile will not be visible to other members. Are you sure to continue?',
            confirmationTitle: 'Yes',
            cancelTitle: 'No');
        if (dialogResponse != null && dialogResponse.confirmed) {
          setBusy(true);
          // Set data
          _setMemberData();
          return;
        } else if (dialogResponse != null && !dialogResponse.confirmed) {
          // Change Visible value
          _memberVisibleValue = true;
          return;
        }
      } else {
        setBusy(true);
        // set data
        _setMemberData();
        return;
      }
    } catch (error) {
      setError(error.toString());
    } finally {
      setBusy(false);
    }
  }

  void onImageSelected(XFile file) {
    _imageFile = file;
  }
}
