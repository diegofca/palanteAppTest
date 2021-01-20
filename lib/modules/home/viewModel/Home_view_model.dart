import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:testapp/app/locator.dart';
import 'package:testapp/app/route.gr.dart';

class HomeViewModel extends BaseViewModel {

  final NavigationService navigationService = locator<NavigationService>();

  Future navigateToDetailCredit() async {
    await navigationService.navigateTo(Routes.calculateDetailView);
  }

  Future navigateToUsersList() async {
    await navigationService.navigateTo(Routes.usersListView);
  }

}