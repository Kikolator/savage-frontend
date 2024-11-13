import 'package:savage_client/app/app.locator.dart';
import 'package:savage_client/app/app.logger.dart';
import 'package:savage_client/data/meeting_room.dart';
import 'package:savage_client/services/dependency_wrappers/authentication_service.dart';
import 'package:savage_client/services/dependency_wrappers/database_service.dart';

class MeetingRoomService {
  final _logger = getLogger('MeetingRoomService');
  final _authenticationService = locator<AuthenticationService>();

  static const kWorkspaceCollection = 'workspaces';
  static const kWorkspaceId = '0001';
  static const kMeetingRoomCollection = 'meeting_rooms';

  final _databaseService = locator<DatabaseService>();

  Future<List<MeetingRoom>> fetchAvailableMeetingRooms() async {
    try {
      _logger.v('Fetching available meeting rooms');
      List<MeetingRoom> meetingRooms =
          await _databaseService.fetchAvailableMeetingRooms();
      return meetingRooms;
    } catch (error) {
      _logger.e('Error fetching available meeting rooms: $error');
      // TODO handle error
      rethrow;
    }
  }

  Future<void> addMeetingRoom({required MeetingRoom meetingRoom}) async {
    _logger.v('Adding meeting room');
    final bool isAdmin = await _authenticationService.isAdmin();
    _logger.v('user is admin: $isAdmin');
    if (!isAdmin) {
      throw Exception('user is not admin');
    }
    await _databaseService.setMeetingRoom(meetingRoom: meetingRoom);
    return;
  }
}
