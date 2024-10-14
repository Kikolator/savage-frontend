import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:savage_client/data/enums/payment_method_type.dart';

class PaymentMethod {
  static const String _kMethodId = 'method_id';
  static const String _kType = 'type';
  static const String _kUserId = 'user_id';
  static const String _kProvider = 'provider';
  static const String _kLastFourDigits = 'last_four_digits';
  static const String _kExpiryDate = 'expiry_date';
  static const String _kIsDefault = 'is_default';

  final String methodId; // Unique ID for the payment method
  final PaymentMethodType
      type; // Type of payment method (e.g., credit card, PayPal)
  final String userId; // User ID associated with this payment method
  final String provider; // Payment provider (e.g., "Visa", "PayPal", etc.)
  final String lastFourDigits; // Last 4 digits of card (for credit card)
  final DateTime expiryDate; // Expiration date for credit card payments
  final bool isDefault; // Whether this is the user's default payment method

  PaymentMethod({
    required this.methodId,
    required this.type,
    required this.userId,
    required this.provider,
    required this.lastFourDigits,
    required this.expiryDate,
    required this.isDefault,
  });

  factory PaymentMethod.fromData(Map<String, dynamic> data) {
    return PaymentMethod(
      methodId: data[_kMethodId],
      type: PaymentMethodType.values.firstWhere(
        (element) => element.name == data[_kType],
      ),
      userId: data[_kUserId],
      provider: data[_kProvider],
      lastFourDigits: data[_kLastFourDigits],
      expiryDate: (data[_kExpiryDate] as Timestamp).toDate(),
      isDefault: data[_kIsDefault],
    );
  }
  Map<String, dynamic> toData() {
    return {
      _kMethodId: methodId,
      _kType: type.name,
      _kUserId: userId,
      _kProvider: provider,
      _kLastFourDigits: lastFourDigits,
      _kExpiryDate: Timestamp.fromDate(expiryDate),
      _kIsDefault: isDefault,
    };
  }
}
