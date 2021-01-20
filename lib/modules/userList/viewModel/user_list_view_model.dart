import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:testapp/app/locator.dart';
import 'package:testapp/modules/userList/model/user.dart';
import 'package:testapp/modules/userList/repository/user_list_respository.dart';

class UsersListViewModel extends BaseViewModel {

  final NavigationService navigationService = locator<NavigationService>();
  final UserListRepository repository = UserListRepository();

  int page = 1;
  List<User> users = [];

  bool isCallUsers = false;

  void requestGetUsers() {
    if (page <= repository.totalPages) {
      isCallUsers = true;
      notifyListeners();

      repository.getUsers(page).then((users) {
        this.saveUsers(users);
        this.isCallUsers = false;
        notifyListeners();
      }).catchError(error);
    }
  }

  void saveUsers(List<User> users){
    this.users.addAll(users);
    page++;
  }

  void navigateToBack() {
    navigationService.back();
  }

}