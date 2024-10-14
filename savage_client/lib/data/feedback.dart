import 'package:cloud_firestore/cloud_firestore.dart';

class Feedback {
  static const String _kFeedbackId = 'feedback_id';
  static const String _kUserId = 'user_id';
  static const String _kWorkspaceId = 'workspace_id';
  static const String _kBookingId = 'booking_id';
  static const String _kRating = 'rating';
  static const String _kComment = 'comment';
  static const String _kTimestamp = 'timestamp';

  final String feedbackId;
  final String userId;
  final String workspaceId;
  final String bookingId;
  final int rating;
  final String comment;
  final DateTime timestamp;

  Feedback({
    required this.feedbackId,
    required this.userId,
    required this.workspaceId,
    required this.bookingId,
    required this.rating,
    required this.comment,
    required this.timestamp,
  });

  factory Feedback.fromData(Map<String, dynamic> data) {
    return Feedback(
      feedbackId: data[_kFeedbackId],
      userId: data[_kUserId],
      workspaceId: data[_kWorkspaceId],
      bookingId: data[_kBookingId],
      rating: data[_kRating],
      comment: data[_kComment],
      timestamp: (data[_kTimestamp] as Timestamp).toDate(),
    );
  }
  Map<String, dynamic> toData() {
    return {
      _kFeedbackId: feedbackId,
      _kUserId: userId,
      _kWorkspaceId: workspaceId,
      _kBookingId: bookingId,
      _kRating: rating,
      _kComment: comment,
      _kTimestamp: Timestamp.fromDate(timestamp),
    };
  }
}
