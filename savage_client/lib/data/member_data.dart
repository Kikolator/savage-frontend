class MemberData {
  static const kId = 'id';
  static const kUid = 'uid';
  static const kMemberVisible = 'member_visible';
  static const kCompanyName = 'business_name';
  static const kDescription = 'description';
  static const kWebsite = 'website';
  static const kPhotoUrl = 'photo_url';

  final String id;
  final String uid;
  final bool memberVisible;
  final String? companyName;
  final String? description;
  final String? website;
  final String? photoUrl;

  MemberData({
    required this.id,
    required this.uid,
    required this.memberVisible,
    required this.companyName,
    required this.description,
    required this.website,
    required this.photoUrl,
  });

  factory MemberData.fromData(Map<String, dynamic> data) {
    return MemberData(
      id: data[kId],
      uid: data[kUid],
      memberVisible: data[kMemberVisible],
      companyName: data[kCompanyName],
      description: data[kDescription],
      website: data[kWebsite],
      photoUrl: data[kPhotoUrl],
    );
  }

  Map<String, dynamic> toData() {
    return {
      kId: id,
      kUid: uid,
      kMemberVisible: memberVisible,
      kCompanyName: companyName,
      kDescription: description,
      kWebsite: website,
      kPhotoUrl: photoUrl,
    };
  }

  factory MemberData.empty() {
    return MemberData(
      id: '',
      uid: '',
      memberVisible: false,
      companyName: null,
      description: null,
      website: null,
      photoUrl: null,
    );
  }

  bool get isEmpty =>
      id.isEmpty &&
      uid.isEmpty &&
      companyName == null &&
      description == null &&
      website == null &&
      photoUrl == null;
}
