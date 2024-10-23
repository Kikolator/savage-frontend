import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:savage_client/data/enums/membership_status.dart';
import 'package:savage_client/data/enums/membership_type.dart';

class User {
  static const kUid = 'uid';
  static const kFirstName = 'first_name';
  static const kLastName = 'last_name';
  static const kContactEmail = 'contact_email';
  static const kContactPhone = 'contact_phone';
  static const kSignupEmail = 'signup_email';
  static const kSignupPhone = 'signup_phone';
  static const kPhoneWhatsapp = 'phone_whatsapp';
  static const kPhotoUrl = 'photo_url';
  static const kMembershipStatus = 'membership_status';
  static const kMembershipTypes = 'membership_types';
  static const kAvailableCredits = 'available_credits';
  static const kJoinedAt = 'joined_at';
  static const kMemberDataId = 'member_data_id';
  static const kRequestInvoice = 'request_invoice';
  static const kInvoiceData = 'invoice_data';
  static const kCheckedIn = 'checked_in';

  final String uid, firstName, lastName, contactEmail, contactPhone;
  final String? signupEmail, signupPhone, phoneWhatsapp;
  String? photoUrl;

  /// active when the user has a membership or set to inactive
  /// when no membership
  final MembershipStatus membershipStatus;

  /// A list of active membership types
  final List<MembershipType> membershipTypes;

  /// Amount of credits.
  /// 1 credit = 1 hour of hot desk
  /// Null in case membership type does not require credits
  final double? availableCredits;
  final DateTime joinedAt;
  bool requestInvoice, checkedIn;
  String? memberDataId;
  final Map<String, dynamic> invoiceData;

  User({
    required this.uid,
    required this.firstName,
    required this.lastName,
    required this.contactEmail,
    required this.contactPhone,
    required this.signupEmail,
    required this.signupPhone,
    required this.phoneWhatsapp,
    required this.photoUrl,
    required this.membershipStatus,
    required this.membershipTypes,
    required this.availableCredits,
    required this.joinedAt,
    required this.memberDataId,
    required this.requestInvoice,
    required this.invoiceData,
    required this.checkedIn,
  });

  factory User.fromData(Map<String, dynamic> data) {
    return User(
      uid: data[kUid],
      firstName: data[kFirstName],
      lastName: data[kLastName],
      contactEmail: data[kContactEmail],
      contactPhone: data[kContactPhone],
      signupEmail: data[kSignupEmail],
      signupPhone: data[kSignupPhone],
      phoneWhatsapp: data[kPhoneWhatsapp],
      photoUrl: data[kPhotoUrl],
      membershipStatus: MembershipStatus.values.firstWhere(
        (element) => element.name == data[kMembershipStatus],
      ),
      membershipTypes: (data[kMembershipTypes] as List)
          .map((e) => MembershipType.values.firstWhere(
                (element) => element.name == e,
              ))
          .toList(),
      availableCredits: data[kAvailableCredits],
      joinedAt: (data[kJoinedAt] as Timestamp).toDate(),
      memberDataId: data[kMemberDataId],
      requestInvoice: data[kRequestInvoice],
      invoiceData: data[kInvoiceData],
      checkedIn: data[kCheckedIn],
    );
  }

  Map<String, dynamic> toData() => {
        kUid: uid,
        kFirstName: firstName,
        kLastName: lastName,
        kContactEmail: contactEmail,
        kContactPhone: contactPhone,
        kSignupEmail: signupEmail,
        kSignupPhone: signupPhone,
        kPhoneWhatsapp: phoneWhatsapp,
        kPhotoUrl: photoUrl,
        kMembershipStatus: membershipStatus.name,
        kMembershipTypes: membershipTypes.map((e) => e.name).toList(),
        kAvailableCredits: availableCredits,
        kJoinedAt: Timestamp.fromDate(joinedAt),
        kMemberDataId: memberDataId,
        kRequestInvoice: requestInvoice,
        kInvoiceData: invoiceData,
        kCheckedIn: checkedIn,
      };

  void setMemberDataId(String id) {
    memberDataId = id;
  }

  void setCheckedIn(bool checkedIn) {
    this.checkedIn = checkedIn;
  }
}
