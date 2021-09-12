import 'package:finance_app/app/data/models/User.dart';
import 'package:finance_app/app/data/providers/auth_api.dart';
import 'package:get/instance_manager.dart';

class AuthRepository {
  final AuthApi _api = Get.find<AuthApi>();

  Future<AuthResponseSuccess?> login(String email, String password) =>
      _api.login(email, password);
}
