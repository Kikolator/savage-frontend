import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:savage_client/data/booking.dart';
import 'package:savage_client/data/enums/membership_status.dart';
import 'package:savage_client/data/enums/membership_type.dart';
import 'package:savage_client/data/payment_method.dart';

class User {
  static const kUid = 'uid';
  static const kFirstName = 'first_name';
  static const kLastName = 'last_name';
  static const kPhoneWhatsapp = 'phone_whatsapp';
  static const kContactEmail = 'contact_email';
  static const kSignupEmail = 'signup_email';
  static const kSignupPhone = 'signup_phone';
  static const kPhotoUrl = 'photo_url';
  static const kMembershipStatus = 'membership_status';
  static const kMembershipType = 'membership_type';
  static const kBookings = 'bookings';
  static const kJoinedAt = 'joined_at';
  static const kPaymentMethods = 'payment_methods';

  final String uid, firstName, lastName, contactEmail;
  final String? signupEmail, signupPhone, phoneWhatsapp, photoUrl;
  final MembershipStatus membershipStatus;
  final MembershipType? membershipType;
  final List<Booking>? bookings;
  final DateTime? joinedAt;
  final List<PaymentMethod>? paymentMethods;

  User({
    required this.uid,
    required this.firstName,
    required this.lastName,
    required this.contactEmail,
    this.phoneWhatsapp,
    this.signupEmail,
    this.signupPhone,
    this.photoUrl,
    required this.membershipStatus,
    this.membershipType,
    this.bookings,
    this.joinedAt,
    this.paymentMethods,
  });

  factory User.fromData(Map<String, dynamic> data) {
    return User(
      uid: data[kUid],
      firstName: data[kFirstName],
      lastName: data[kLastName],
      phoneWhatsapp: data[kPhoneWhatsapp],
      contactEmail: data[kContactEmail],
      signupEmail: data[kSignupEmail],
      signupPhone: data[kSignupPhone],
      photoUrl: data[kPhotoUrl],
      membershipStatus: MembershipStatus.values.firstWhere(
          (element) => element.toString() == data[kMembershipStatus]),
      membershipType: data[kMembershipType] != null
          ? MembershipType.values
              .firstWhere((e) => e.name == data[kMembershipType])
          : null,
      joinedAt: data[kJoinedAt] != null
          ? (data[kJoinedAt] as Timestamp).toDate()
          : null,
      bookings: data[kBookings] != null
          ? (data[kBookings] as List).map((e) => Booking.fromData(e)).toList()
          : null,
    );
  }

  Map<String, dynamic> toData() => {
        kUid: uid,
        kFirstName: firstName,
        kLastName: lastName,
        kPhoneWhatsapp: phoneWhatsapp,
        kContactEmail: contactEmail,
        kSignupEmail: signupEmail,
        kSignupPhone: signupPhone,
        kPhotoUrl: photoUrl,
        kMembershipStatus: membershipStatus.toString(),
        kMembershipType: membershipType?.name,
        kBookings: bookings?.map((e) => e.toData()).toList(),
        kJoinedAt: joinedAt == null ? null : Timestamp.fromDate(joinedAt!),
        kPaymentMethods: paymentMethods?.map((e) => e.toData()).toList(),
      };
}
