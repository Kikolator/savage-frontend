import 'package:savage_client/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends IndexTrackingViewModel {
  final _routerService = locator<RouterService>();

  HomeViewModel() {
    /// Sets current index to page according to url in web platforms.
    setCurrentWebPageIndex(_routerService);
  }
}
