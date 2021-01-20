import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:testapp/modules/userList/model/user_response.dart';

class API {

  Future<UserResponse> getUsers(int page) async {
    final response = await http.get('https://reqres.in/api/users?page=$page',
        headers: {
          HttpHeaders.acceptHeader: 'application/json',
        }
    );

    if (response.statusCode == 200) {
      UserResponse responseUser = UserResponse.fromJson(jsonDecode(response.body));
      return responseUser;
    } else {
      throw Exception('Failed to load album');
    }
  }

}