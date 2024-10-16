import 'package:savage_client/app/app.locator.dart';
import 'package:savage_client/data/desk.dart';
import 'package:savage_client/services/dependency_wrappers/database_service.dart';

class DesksService {
  final _databaseService = locator<DatabaseService>();

  static const kWorkspaceCollection = 'workspaces';
  static const kWorkspaceId = '0001';
  static const kDeskCollection = 'desks';

  Future<List<Desk>> fetchAvailableHotDesks() async {
    List<Map<String, dynamic>> data = await _databaseService.getSubCollection(
      collection: kWorkspaceCollection,
      documentId: kWorkspaceId,
      subCollection: kDeskCollection,
      queryField: 'available',
      isEqualTo: true,
    );
    return data.map<Desk>((e) => Desk.fromData(e)).toList();
  }
}
