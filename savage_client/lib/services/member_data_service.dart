import 'package:savage_client/app/app.locator.dart';
import 'package:savage_client/data/member_data.dart';
import 'package:savage_client/services/dependency_wrappers/database_service.dart';
import 'package:savage_client/services/user_service.dart';

class MemberDataService {
  final _databaseService = locator<DatabaseService>();
  final _userService = locator<UserService>();

  /// Local user member data
  MemberData? _memberData;
  MemberData? get memberData => _memberData;

  /// Local workspace members
  List<MemberData> _workspaceMembers = [];
  List<MemberData> get workspaceMembers => _workspaceMembers;

  /// Fetch the user member data
  Future<MemberData> getUserMemberData({required String memberDataId}) async {
    final Map<String, dynamic> data =
        await _databaseService.getUserMemberData(memberDataId: memberDataId);
    _memberData = MemberData.fromData(data);
    return _memberData!;
  }

  /// Sets the users member data
  Future<void> setMemberData({required MemberData memberData}) async {
    if (!_userService.isSignedIn) {
      throw Exception('User is not signed in');
    }
    _memberData = await _databaseService.setMemberData(memberData: memberData);
    return;
  }

  /// Query the workspace member data
  Future<List<MemberData>> queryWorkspaceMembers() async {
    final List<Map<String, dynamic>> memberData =
        await _databaseService.queryMemberData();
    _workspaceMembers =
        memberData.map((data) => MemberData.fromData(data)).toList();
    for (MemberData memberData in _workspaceMembers) {
      if (memberData.isEmpty) {
        _workspaceMembers.remove(memberData);
      }
    }
    return _workspaceMembers;
  }
}