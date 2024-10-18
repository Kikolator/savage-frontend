import 'package:savage_client/app/app.locator.dart';
import 'package:savage_client/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CreateBusinessProfileViewModel extends BaseViewModel {
  final _routerService = locator<RouterService>();
  void skip() {
    _routerService.navigateToHomeView();
  }
}
