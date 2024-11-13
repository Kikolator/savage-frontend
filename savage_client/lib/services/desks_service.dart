import 'package:savage_client/app/app.locator.dart';
import 'package:savage_client/app/app.logger.dart';
import 'package:savage_client/data/desk.dart';
import 'package:savage_client/services/dependency_wrappers/authentication_service.dart';
import 'package:savage_client/services/dependency_wrappers/database_service.dart';

class DesksService {
  final _logger = getLogger('DesksService');
  final _databaseService = locator<DatabaseService>();
  final _authenticationService = locator<AuthenticationService>();

  Future<List<Desk>> fetchAvailableHotDesks() async {
    _logger.v('fetching available hot desks');
    List<Desk> desks = await _databaseService.fetchAvailableHotDesks();
    return desks;
  }

  Future<void> addDesk({required Desk desk}) async {
    _logger.v('Setting desk in db');
    final bool isAdmin = await _authenticationService.isAdmin();
    _logger.v('user is admin: $isAdmin');
    if (!isAdmin) {
      throw Exception('User is not admin');
    }
    await _databaseService.setDesk(desk: desk);
    return;
  }
}
