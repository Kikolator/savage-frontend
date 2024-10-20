import 'package:savage_client/app/app.locator.dart';
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

  final _routerService = locator<RouterService>();
  final _memberDataService = locator<MemberDataService>();
  final _userService = locator<UserService>();
  final _dialogService = locator<DialogService>();

  User? _user;

  late MemberData _memberData;
  MemberData get memberData => _memberData;

  String? _photoUrl;

  bool _memberVisibleValue = true;
  bool get memberVisisbleValue => _memberVisibleValue;

  Future<void> getUserData() async {
    try {
      setBusy(true);
      _user = await _userService.getUser();
      if (_user == null) {
        throw UnimplementedError('User is null, handle error');
      }
      final memberDataId = _user!.memberDataId;
      if (memberDataId == null) {
        throw UnimplementedError('Member data id is null, handle error');
      }
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
    } catch (error) {
      setError(error.toString());
    } finally {
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
          // Set data
          _setMemberData();
          return;
        } else if (dialogResponse != null && !dialogResponse.confirmed) {
          // Change Visible value
          _memberVisibleValue = true;
          return;
        }
      } else {
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
}
