import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:savage_client/data/payment_method.dart';
import 'package:savage_client/data/enums/payment_status.dart';

class Payment {
  static const String _kPaymentId = 'payment_id';
  static const String _kUserId = 'user_id';
  static const String _kBookingId = 'booking_id';
  static const String _kAmount = 'amount';
  static const String _kPaymentMethod = 'payment_method';
  static const String _kPaymentStatus = 'payment_status';
  static const String _kPaymentDate = 'payment_date';

  final String paymentId;
  final String userId;
  final String bookingId;
  final double amount;
  final PaymentMethod paymentMethod;
  final PaymentStatus paymentStatus;
  final DateTime paymentDate;

  Payment({
    required this.paymentId,
    required this.userId,
    required this.bookingId,
    required this.amount,
    required this.paymentMethod,
    required this.paymentStatus,
    required this.paymentDate,
  });

  factory Payment.fromData(Map<String, dynamic> data) {
    return Payment(
      paymentId: data[_kPaymentId],
      userId: data[_kUserId],
      bookingId: data[_kBookingId],
      amount: data[_kAmount],
      paymentMethod: PaymentMethod.fromData(data[_kPaymentMethod]),
      paymentStatus: PaymentStatus.values.firstWhere(
        (element) => element.name == data[_kPaymentStatus],
      ),
      paymentDate: (data[_kPaymentDate] as Timestamp).toDate(),
    );
  }
  Map<String, dynamic> toData() {
    return {
      _kPaymentId: paymentId,
      _kUserId: userId,
      _kBookingId: bookingId,
      _kAmount: amount,
      _kPaymentMethod: paymentMethod.toData(),
      _kPaymentStatus: paymentStatus.name,
      _kPaymentDate: Timestamp.fromDate(paymentDate),
    };
  }
}
