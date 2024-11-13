import 'package:savage_client/data/enums/booking_status.dart';
import 'package:savage_client/data/enums/booking_type.dart';

abstract class Booking {
  static const String kId = 'id';
  static const String kWorkspaceId = 'workspace_id';
  static const String kStartTime = 'start_time';
  static const String kEndTime = 'end_time';
  static const String kMemberId = 'member_id';
  static const String kStatus = 'status';
  static const String kType = 'type';

  final String id;
  final String workspaceId;
  final DateTime startTime;
  final DateTime endTime;
  final String memberId;
  final BookingStatus status;
  final BookingType type;

  Booking(
      {required this.id,
      required this.workspaceId,
      required this.startTime,
      required this.endTime,
      required this.memberId,
      required this.status,
      required this.type});

  Map<String, dynamic> toData() {
    throw UnimplementedError('to implement');
  }
}
