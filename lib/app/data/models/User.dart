class User {
  final int? id;
  final String name, surname, email;

  User({
    required this.id,
    required this.name,
    required this.surname,
    required this.email,
  });

  static User fromJson(Map<String, dynamic> json) {
    return new User(
      id: json['id'],
      name: json['name'],
      surname: json['surname'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'name': this.name,
      'surname': this.surname,
      'email': this.email,
    };
  }
}

class AuthResponseSuccess {
  final User user;
  final String token;

  AuthResponseSuccess({required this.user, required this.token});
}
