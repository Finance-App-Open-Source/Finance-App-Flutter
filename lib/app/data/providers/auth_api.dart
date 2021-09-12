import 'package:dio/dio.dart';
import 'package:finance_app/app/data/models/User.dart';
import 'package:get/instance_manager.dart';

class AuthApi {
  final Dio _dio = Get.find<Dio>();

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
