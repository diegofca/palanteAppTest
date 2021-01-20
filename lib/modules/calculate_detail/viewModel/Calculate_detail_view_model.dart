import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:testapp/app/locator.dart';

class CalculateDetailViewModel extends BaseViewModel {

  final NavigationService navigationService = locator<NavigationService>();

  void navigateToBack() {
    navigationService.back();
  }

}
