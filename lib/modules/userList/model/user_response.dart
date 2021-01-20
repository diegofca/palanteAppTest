import 'package:testapp/modules/userList/model/user.dart';

class UserResponse {
  final int page;
  final int perPage;
  final int total;
  final int totalPages;
  final List<User> data;

  UserResponse({this.page, this.perPage, this.total, this.totalPages, this.data});

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
        page: json['page'],
        perPage: json['per_page'],
        total: json['total'],
        totalPages: json['total_pages'],
        data:  List<User>.from(json['data'].map((i) => User.fromJson(i)))
    );
  }
}