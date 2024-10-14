import 'package:savage_client/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DrawerMenuButtonModel extends BaseViewModel {
  final _routerService = locator<RouterService>();

  void navigateToRoute(PageRouteInfo route) {
    _routerService.navigateTo(route);
  }
}
