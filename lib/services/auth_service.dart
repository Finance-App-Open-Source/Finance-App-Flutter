import 'package:dio/dio.dart';
import 'package:finance_app/models/User.dart';

class AuthService {
  AuthService._internal();
  static AuthService _instance = AuthService._internal();
  static AuthService get instance => _instance;

  final Dio _dio = Dio();

  Future<AuthResponseSuccess?> login(String email, String password) async {
    try {
      print("Email: $email, Password: $password");
      final Response response = await this._dio.post(
          "https://reqres.in/api/login",
          data: {'email': email, 'password': password});

      final User user = User.fromJson({
        'id': 1,
        'email': email,
        'first_name': 'Sebastian',
        'last_name': 'Manrique',
        'avatar': 'avatar',
      });

      return AuthResponseSuccess(token: response.data['token'], user: user);
    } catch (e) {
      return null;
    }
  }
}
