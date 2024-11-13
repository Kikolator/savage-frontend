import 'package:savage_client/data/exceptions/app_exception.dart';

class BookingException extends AppException {
  static const String noClient = 'NO_CLIENT';

  BookingException({required code, required message})
      : super(code: code, message: message);
}
