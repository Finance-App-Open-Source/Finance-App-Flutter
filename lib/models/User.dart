import 'dart:convert';

class User {
  final int id;
  final String firstName, lastName, email, avatar;

  User(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.avatar});

  static User fromJson(Map<String, dynamic> json) {
    return new User(
        id: json['id'],
        firstName: json['first_name'],
        lastName: json['last_name'],
        email: json['email'],
        avatar: json['avatar']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'first_name': this.firstName,
      'last_name': this.lastName,
      'email': this.email,
      'avatar': this.avatar,
    };
  }
}

class AuthResponseSuccess {
  final User user;
  final String token;

  AuthResponseSuccess({required this.user, required this.token});
}
