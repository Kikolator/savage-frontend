import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:savage_client/data/booking.dart';
import 'package:savage_client/data/enums/booking_status.dart';
import 'package:savage_client/data/enums/booking_type.dart';

class MeetingRoomBooking extends Booking {
  static const kRoomId = 'room_id';
  static const kRoomName = 'room_name';

  final String roomId;
  final String roomName;

  MeetingRoomBooking({
    required String id,
    required String workspaceId,
    required DateTime startTime,
    required DateTime endTime,
    required String memberId,
    required BookingStatus status,
    required BookingType type,
    required this.roomId,
    required this.roomName,
  }) : super(
          id: id,
          workspaceId: workspaceId,
          startTime: startTime,
          endTime: endTime,
          memberId: memberId,
          status: status,
          type: type,
        );

  factory MeetingRoomBooking.fromData(Map<String, dynamic> data) {
    return MeetingRoomBooking(
      id: data[Booking.kId],
      workspaceId: data[Booking.kWorkspaceId],
      startTime: (data[Booking.kStartTime] as Timestamp).toDate(),
      endTime: (data[Booking.kEndTime] as Timestamp).toDate(),
      memberId: data[Booking.kMemberId],
      status: BookingStatus.values.byName(data[Booking.kStatus]),
      roomId: data[kRoomId],
      type: BookingType.values.byName(data[Booking.kType]),
      roomName: data[kRoomName],
    );
  }

  @override
  Map<String, dynamic> toData() {
    return {
      Booking.kId: id,
      Booking.kWorkspaceId: workspaceId,
      Booking.kStartTime: startTime,
      Booking.kEndTime: endTime,
      Booking.kMemberId: memberId,
      Booking.kStatus: status.name,
      kRoomId: roomId,
      Booking.kType: type.name,
      kRoomName: roomName,
    };
  }
}
