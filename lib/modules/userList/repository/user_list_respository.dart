import 'package:testapp/app/manager/db_manager.dart';
import 'package:testapp/modules/userList/model/user.dart';
import 'package:testapp/services/home_api.dart';

class UserListRepository {

  final API api = API();

  int totalPages = 1;

  Future<List<User>> getUsers(int page) async {
    return await DatabaseManager.get.getUsers(page).then((users) {
      var containUsers = false;
      users.forEach((user) {
        if (user.page == page) { containUsers = true; }
      });

      if (containUsers) { return users; }
      return requestGetUsers(page);
    });
  }

  Future<List<User>> requestGetUsers(int page) {
      return api.getUsers(page).then((response) {
        if(response.data.isNotEmpty) {
          this.saveUsers(response.data, page);
          this.totalPages = response.totalPages;
        }
        return response.data;
      });
  }

  void saveUsers(List<User> users, int page){
    users.forEach((user) {
      DatabaseManager.get.insertUser(user, page);
    });
  }

}