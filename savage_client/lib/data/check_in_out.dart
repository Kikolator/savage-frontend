import 'package:cloud_firestore/cloud_firestore.dart';

class CheckInOut {
  static const String kId = 'id';
  static const String kUid = 'uid';
  static const String kCheckedIn = 'checked_in';
  static const String kTimestamp = 'timestamp';
  static const String kWorkspaceId = 'workspace_id';

  final String id;
  final String uid;
  final bool checkedIn;
  final DateTime timestamp;
  final String workspaceId;

  CheckInOut({
    required this.id,
    required this.uid,
    required this.checkedIn,
    required this.timestamp,
    required this.workspaceId,
  });

  factory CheckInOut.fromData(Map<String, dynamic> data) {
    return CheckInOut(
      id: data[kId],
      uid: data[kUid],
      checkedIn: data[kCheckedIn],
      timestamp: (data[kTimestamp] as Timestamp).toDate(),
      workspaceId: data[kWorkspaceId],
    );
  }

  Map<String, dynamic> toData() {
    return {
      kId: id,
      kUid: uid,
      kCheckedIn: checkedIn,
      kTimestamp: Timestamp.fromDate(timestamp),
      kWorkspaceId: workspaceId,
    };
  }
}
