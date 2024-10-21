import 'package:savage_client/data/enums/membership_status.dart';

class MemberData {
  static const kId = 'id';
  static const kUid = 'uid';
  static const kMemberVisible = 'member_visible';
  static const kMembershipStatus = 'membership_status';
  static const kCompanyName = 'company_name';
  static const kFirstName = 'first_name';
  static const kLastName = 'last_name';
  static const kDescription = 'description';
  static const kWebsite = 'website';
  static const kCompanyEmail = 'company_email';
  static const kCompanyPhone = 'company_phone';
  static const kPhotoUrl = 'photo_url';

  String id;
  String uid;
  String firstName;
  String lastName;
  final bool memberVisible;
  final MembershipStatus membershipStatus;
  final String? companyName;
  final String? description;
  final String? website;
  final String? companyEmail;
  final String? companyPhone;
  String? photoUrl;

  MemberData({
    required this.id,
    required this.uid,
    required this.memberVisible,
    required this.membershipStatus,
    required this.companyName,
    required this.firstName,
    required this.lastName,
    required this.description,
    required this.website,
    required this.companyEmail,
    required this.companyPhone,
    required this.photoUrl,
  });

  factory MemberData.fromData(Map<String, dynamic> data) {
    return MemberData(
      id: data[kId],
      uid: data[kUid],
      memberVisible: data[kMemberVisible],
      membershipStatus: MembershipStatus.values
          .firstWhere((e) => e.name == data[kMembershipStatus]),
      companyName: data[kCompanyName],
      firstName: data[kFirstName],
      lastName: data[kLastName],
      description: data[kDescription],
      website: data[kWebsite],
      companyEmail: data[kCompanyEmail],
      companyPhone: data[kCompanyPhone],
      photoUrl: data[kPhotoUrl],
    );
  }

  Map<String, dynamic> toData() {
    return {
      kId: id,
      kUid: uid,
      kMemberVisible: memberVisible,
      kMembershipStatus: membershipStatus.name,
      kCompanyName: companyName,
      kFirstName: firstName,
      kLastName: lastName,
      kDescription: description,
      kWebsite: website,
      kCompanyEmail: companyEmail,
      kCompanyPhone: companyPhone,
      kPhotoUrl: photoUrl,
    };
  }

  factory MemberData.empty() {
    return MemberData(
      id: '',
      uid: '',
      memberVisible: false,
      membershipStatus: MembershipStatus.inactive,
      companyName: null,
      firstName: '',
      lastName: '',
      description: null,
      website: null,
      companyEmail: null,
      companyPhone: null,
      photoUrl: null,
    );
  }

  void setId(String value) {
    id = value;
  }

  void setUid(String value) {
    uid = value;
  }

  void setFirstName(String value) {
    firstName = value;
  }

  void setLastName(String value) {
    lastName = value;
  }

  bool get isEmpty =>
      (companyName == null || companyName!.isEmpty) &&
      (description == null || description!.isEmpty) &&
      (website == null || website!.isEmpty) &&
      (companyEmail == null || companyEmail!.isEmpty) &&
      (companyPhone == null || companyPhone!.isEmpty) &&
      (photoUrl == null || photoUrl!.isEmpty);
}
