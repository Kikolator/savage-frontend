import 'package:savage_client/app/app.locator.dart';
import 'package:savage_client/app/app.logger.dart';
import 'package:savage_client/app/app.router.dart';
import 'package:savage_client/data/enums/membership_status.dart';
import 'package:savage_client/data/member_data.dart';
import 'package:savage_client/services/member_data_service.dart';
import 'package:savage_client/services/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class FamilyViewModel extends BaseViewModel {
  final _logger = getLogger('FamilyViewModel');
  final _memberDataService = locator<MemberDataService>();
  final _userService = locator<UserService>();
  final _routerService = locator<RouterService>();
  final _dialogService = locator<DialogService>();

  bool _isActiveMember = false;
  bool get isActiveMember => _isActiveMember;

  MemberData? _userMemberData;
  MemberData? get userMemberData => _userMemberData;

  List<MemberData> _workspaceMembers = [];
  List<MemberData> get workspaceMembers => _workspaceMembers;

  void navigateToCreateBusinessProfile() {
    _routerService.navigateToCreateBusinessProfileView();
  }

  Future<void> getMemberData() async {
    try {
      _logger.d('getting member data');
      setBusy(true);
      final user = await _userService.getUser();
      if (user == null) {
        throw UnimplementedError('User is null, handle error');
      }

      _isActiveMember = user.membershipStatus == MembershipStatus.active;
      _logger.v('isActiveMember: $_isActiveMember');

      final memberDataId = user.memberDataId;
      _logger.v('memberDataId: $memberDataId');

      if (memberDataId != null) {
        _logger
            .v('memberDataId is not null, getting member data: $memberDataId');
        _userMemberData = await _memberDataService.getUserMemberData(
            memberDataId: memberDataId);
      }
      if (_isActiveMember) {
        _logger.v('user is active member, getting workspace members');
        _workspaceMembers = await _memberDataService.queryWorkspaceMembers();
      }

      return;
    } catch (error) {
      _logger.e('error', error);
      if (error is UnimplementedError) {
        rethrow;
      }
      setError(error.toString());
    } finally {
      setBusy(false);
    }
  }

  void editUserMemberData() {
    _routerService.navigateToCreateBusinessProfileView();
  }

  void alreadyAMember() {
    _dialogService.showDialog(
        title: 'Already a member?',
        description:
            'Please give us a few moments to verify your data. If after 24 hours your account is still not active, please contact us at hub@savage-coworking.com');
  }
}
