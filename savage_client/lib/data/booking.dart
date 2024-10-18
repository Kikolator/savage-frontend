import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:savage_client/data/enums/booking_status.dart';
// import 'package:savage_client/data/enums/currency.dart';
// import 'package:savage_client/data/payment_method.dart';

class Booking {
  static const String _kBookingId = 'booking_id';
  static const String kUserId = 'user_id';
  static const String _kWorkspaceId = 'workspace_id';
  static const String _kDeskId = 'desk_id';
  static const String _kDeskNumber = 'desk_number';
  static const String _kStartDateTime = 'start_date_time';
  static const String _kEndDateTime = 'end_date_time';
  // static const String _kPrice = 'price';
  // static const String _kCurrency = 'currency';
  static const String _kStatus = 'status';
  // static const String _kPaymentMethod = 'payment_method';

  final String bookingId;
  final String userId;
  final String workspaceId;
  final String deskId;
  final String deskNumber;
  final DateTime startDateTime;
  final DateTime endDateTime;
  // final double price;
  // final Currency currency;
  final BookingStatus status;
  // final PaymentMethod paymentMethod;

  Booking({
    required this.bookingId,
    required this.userId,
    required this.workspaceId,
    required this.deskId,
    required this.deskNumber,
    required this.startDateTime,
    required this.endDateTime,
    // required this.price,
    // required this.currency,
    required this.status,
    // required this.paymentMethod,
  });

  factory Booking.fromData(Map<String, dynamic> data) {
    return Booking(
      bookingId: data[_kBookingId],
      userId: data[kUserId],
      workspaceId: data[_kWorkspaceId],
      deskId: data[_kDeskId],
      deskNumber: data[_kDeskNumber],
      startDateTime: (data[_kStartDateTime] as Timestamp).toDate(),
      endDateTime: (data[_kEndDateTime] as Timestamp).toDate(),
      // price: data[_kPrice],
      // currency: Currency.values.firstWhere(
      // (element) => element.name == data[_kCurrency],
      // ),
      status: BookingStatus.values.firstWhere(
        (element) => element.name == data[_kStatus],
      ),
      // paymentMethod: PaymentMethod.fromData(data[_kPaymentMethod]),
    );
  }
  Map<String, dynamic> toData() {
    return {
      _kBookingId: bookingId,
      kUserId: userId,
      _kWorkspaceId: workspaceId,
      _kDeskId: deskId,
      _kDeskNumber: deskNumber,
      _kStartDateTime: Timestamp.fromDate(startDateTime),
      _kEndDateTime: Timestamp.fromDate(endDateTime),
      // _kPrice: price,
      // _kCurrency: currency.name,
      _kStatus: status.name,
      // _kPaymentMethod: paymentMethod.toData(),
    };
  }
}
