class User {

  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;
  int page = 0;

  User({this.id, this.email, this.firstName, this.lastName, this.avatar, this.page});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      avatar: json['avatar'],
      page: json['page'],
    );
  }

  Map<String, dynamic> toMap(int page) {
    this.page = page;
    return {
      'id': id,
      'email': email,
      'first_name': firstName,
      'last_name': lastName,
      'avatar': avatar,
      'page': page,
    };
  }

}

