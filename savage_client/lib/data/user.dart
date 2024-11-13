import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:savage_client/app/app.logger.dart';
import 'package:savage_client/data/enums/membership_status.dart';

class User {
  // Database fields
  static const kUid = 'uid';
  static const kFirstName = 'first_name';
  static const kLastName = 'last_name';
  static const kSignupEmail = 'signup_email';
  static const kSignupPhone = 'signup_phone';
  static const kWhatsappPhone = 'whatsapp_phone';
  static const kDateOfBirth = 'date_of_birth';
  static const kPhotoUrl = 'photo_url';
  static const kMembershipStatus = 'membership_status';
  static const kMembershipIds = 'membership_ids';
  static const kJoinedAt = 'joined_at';
  static const kMemberDataId = 'member_data_id';
  static const kRequestInvoice = 'request_invoice';
  static const kInvoiceData = 'invoice_data';
  static const kCheckedIn = 'checked_in';
  static const kEmailNotifications = 'email_notifications';
  static const kNewsletterSubscription = 'newsletter_subscription';
  static const kTermsAndConditionsVersion = 'terms_and_conditions_version';

  final String uid;
  final String firstName;
  final String lastName;
  final String? signupEmail;
  final String? signupPhone;
  final String? whatsappPhone;
  final DateTime dateOfBirth;
  String? photoUrl;
  final MembershipStatus? membershipStatus;
  final List<String> membershipIds;
  final DateTime joinedAt;
  final String? memberDataId;
  final bool requestInvoice;
  final Map<String, dynamic> invoiceData;
  bool checkedIn;
  final bool emailNotifications;
  final bool newsletterSubscription;
  final String termsAndConditionsVersion;

  User(
      {required this.uid,
      required this.firstName,
      required this.lastName,
      required this.dateOfBirth,
      required this.signupEmail,
      required this.signupPhone,
      required this.whatsappPhone,
      required this.photoUrl,
      required this.membershipStatus,
      required this.membershipIds,
      required this.joinedAt,
      required this.memberDataId,
      required this.requestInvoice,
      required this.invoiceData,
      required this.checkedIn,
      required this.emailNotifications,
      required this.newsletterSubscription,
      required this.termsAndConditionsVersion});

  factory User.fromData(Map<String, dynamic> data) {
    try {
      getLogger('User').d('creating user from data');
      return User(
        uid: data[kUid],
        firstName: data[kFirstName],
        lastName: data[kLastName],
        dateOfBirth: (data[kDateOfBirth] as Timestamp).toDate(),
        signupEmail: data[kSignupEmail],
        signupPhone: data[kSignupPhone],
        whatsappPhone: data[kWhatsappPhone],
        photoUrl: data[kPhotoUrl],
        membershipStatus: data[kMembershipStatus] != null
            ? MembershipStatus.values.firstWhere(
                (element) => element.name == data[kMembershipStatus],
              )
            : null,
        membershipIds: (data[kMembershipIds] as List<dynamic>).cast<String>(),
        joinedAt: (data[kJoinedAt] as Timestamp).toDate(),
        memberDataId: data[kMemberDataId],
        requestInvoice: data[kRequestInvoice],
        invoiceData: data[kInvoiceData],
        checkedIn: data[kCheckedIn],
        emailNotifications: data[kEmailNotifications],
        newsletterSubscription: data[kNewsletterSubscription],
        termsAndConditionsVersion: data[kTermsAndConditionsVersion],
      );
    } catch (error) {
      getLogger('User').e(error);
      rethrow;
    }
  }

  Map<String, dynamic> toData() => {
        kUid: uid,
        kFirstName: firstName,
        kLastName: lastName,
        kDateOfBirth: Timestamp.fromDate(dateOfBirth),
        kSignupEmail: signupEmail,
        kSignupPhone: signupPhone,
        kWhatsappPhone: whatsappPhone,
        kPhotoUrl: photoUrl,
        kMembershipStatus: membershipStatus?.name,
        kMembershipIds: membershipIds,
        kJoinedAt: Timestamp.fromDate(joinedAt),
        kMemberDataId: memberDataId,
        kRequestInvoice: requestInvoice,
        kInvoiceData: invoiceData,
        kCheckedIn: checkedIn,
        kEmailNotifications: emailNotifications,
        kNewsletterSubscription: newsletterSubscription,
        kTermsAndConditionsVersion: termsAndConditionsVersion,
      };
}
