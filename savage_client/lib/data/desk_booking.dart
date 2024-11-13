import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:savage_client/data/booking.dart';
import 'package:savage_client/data/enums/booking_status.dart';
import 'package:savage_client/data/enums/booking_type.dart';

class DeskBooking extends Booking {
  static const String kDeskId = 'desk_id';
  static const String kDeskNumber = 'desk_number';
  final String deskId;
  final String deskNumber;
  DeskBooking({
    required String id,
    required String workspaceId,
    required DateTime startTime,
    required DateTime endTime,
    required String memberId,
    required BookingStatus status,
    required BookingType type,
    required this.deskId,
    required this.deskNumber,
  }) : super(
          id: id,
          workspaceId: workspaceId,
          startTime: startTime,
          endTime: endTime,
          memberId: memberId,
          status: status,
          type: type,
        );

  factory DeskBooking.fromData(Map<String, dynamic> data) {
    return DeskBooking(
      id: data[Booking.kId],
      workspaceId: data[Booking.kWorkspaceId],
      startTime: (data[Booking.kStartTime] as Timestamp).toDate(),
      endTime: (data[Booking.kEndTime] as Timestamp).toDate(),
      memberId: data[Booking.kMemberId],
      status: BookingStatus.values.byName(data[Booking.kStatus]),
      deskId: data[kDeskId],
      deskNumber: data[kDeskNumber],
      type: BookingType.values.byName(data[Booking.kType]),
    );
  }

  @override
  Map<String, dynamic> toData() {
    return {
      Booking.kId: id,
      Booking.kWorkspaceId: workspaceId,
      Booking.kStartTime: Timestamp.fromDate(startTime),
      Booking.kEndTime: Timestamp.fromDate(endTime),
      Booking.kMemberId: memberId,
      Booking.kStatus: status.name,
      kDeskId: deskId,
      kDeskNumber: deskNumber,
      Booking.kType: type.name,
    };
  }
}
