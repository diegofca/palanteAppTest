import 'package:auto_route/auto_route_annotations.dart';
import 'package:testapp/modules/calculate_detail/ui/calculate_detail_view.dart';
import 'package:testapp/modules/home/ui/home_view.dart';
import 'package:testapp/modules/userList/ui/user_list_view.dart';

@MaterialAutoRouter(
  routes: <AutoRoute> [
    MaterialRoute(page: HomeView, initial: true),
    MaterialRoute(page: CalculateDetailView, fullscreenDialog: true),
    MaterialRoute(page: UsersListView, fullscreenDialog: true)
  ]
)
class $Router { }