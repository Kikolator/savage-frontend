import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:savage_client/data/booking.dart';

class Desk {
  static const String _kDeskId = 'desk_id';
  static const String _kWorkspaceId = 'workspace_id';
  static const String _kNumber = 'number';
  static const String _kType = 'type';
  static const String _kAvailable = 'available';
  static const String _kAssignedTo = 'assigned_to';
  static const String _kAssignedUntil = 'assigned_until';
  static const String _kBookings = 'bookings';
  static const String _kPhotoUrl = 'photo_url';

  final String deskId;
  final String workspaceId;
  final String number; // Desk number (unique within a workspace)
  final String type; // Type of desk: "flexible" or "fixed"
  final bool available; // Availability status
  final String? assignedTo; // User ID (for fixed desks, null if flexible)
  final DateTime?
      assignedUntil; // Date until the desk is assigned (for fixed desks)
  final List<Booking> bookings; // Bookings for flex desks
  final String? photoUrl; // A photo of the desk

  Desk({
    required this.deskId,
    required this.workspaceId,
    required this.number,
    required this.type,
    required this.available,
    this.assignedTo,
    this.assignedUntil,
    required this.bookings,
    this.photoUrl,
  });

  // Factory method to create a Desk from Firestore document data
  factory Desk.fromData(Map<String, dynamic> data) {
    return Desk(
      deskId: data[_kDeskId],
      workspaceId: data[_kWorkspaceId],
      number: data[_kNumber],
      type: data[_kType],
      available: data[_kAvailable],
      assignedTo: data[_kAssignedTo],
      assignedUntil: data[_kAssignedUntil] != null
          ? (data[_kAssignedUntil] as Timestamp).toDate()
          : null,
      bookings: (data[_kBookings] as List<dynamic>)
          .map<Booking>((e) => Booking.fromData(e))
          .toList(),
      photoUrl: data[_kPhotoUrl],
    );
  }

  // Convert Desk object to map for storing in Firestore
  Map<String, dynamic> toData() {
    return {
      _kDeskId: deskId,
      _kWorkspaceId: workspaceId,
      _kNumber: number,
      _kType: type,
      _kAvailable: available,
      _kAssignedTo: assignedTo,
      _kAssignedUntil:
          assignedUntil != null ? Timestamp.fromDate(assignedUntil!) : null,
      _kBookings: bookings.map((e) => e.toData()).toList(),
      _kPhotoUrl: photoUrl,
    };
  }
}
