import 'package:flutter_test/flutter_test.dart';
import 'package:savage_client/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('FunctionsServiceTest -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
