import 'package:savage_client/data/meeting_room_booking.dart';

class MeetingRoom {
  static const kId = 'id';
  static const kName = 'name';
  static const kDescription = 'description';
  static const kPhotoUrl = 'photo_url';
  static const kCapacity = 'capacity';
  static const kActive = 'active';
  static const kBookings = 'bookings';

  final String id;
  final String name;
  final String description;
  final String? photoUrl;
  final int capacity;
  final bool active;
  final List<MeetingRoomBooking> bookings;

  MeetingRoom({
    required this.id,
    required this.name,
    required this.description,
    required this.photoUrl,
    required this.capacity,
    required this.active,
    required this.bookings,
  });

  factory MeetingRoom.fromData(Map<String, dynamic> data) {
    return MeetingRoom(
        id: data[kId],
        name: data[kName],
        description: data[kDescription],
        photoUrl: data[kPhotoUrl],
        capacity: data[kCapacity],
        active: data[kActive],
        bookings: (data[kBookings] as List)
            .map((item) => MeetingRoomBooking.fromData(item))
            .toList());
  }

  Map<String, dynamic> toData() {
    return {
      kId: id,
      kName: name,
      kDescription: description,
      kPhotoUrl: photoUrl,
      kCapacity: capacity,
      kActive: active,
      kBookings: bookings.map((item) => item.toData()).toList(),
    };
  }

  MeetingRoom copyWith({
    String? id,
    String? name,
    String? description,
    String? photoUrl,
    int? capacity,
    bool? active,
    List<MeetingRoomBooking>? bookings,
  }) {
    return MeetingRoom(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      photoUrl: photoUrl ?? this.photoUrl,
      capacity: capacity ?? this.capacity,
      active: active ?? this.active,
      bookings: bookings ?? this.bookings,
    );
  }
}
