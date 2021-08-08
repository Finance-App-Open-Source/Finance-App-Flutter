import 'package:finance_app/models/User.dart';
import 'package:get/state_manager.dart';

class AuthController extends GetxController {
  User? _me;
  String _token = "";

  User get me => _me!;
  String get token => _token;

  @override
  void onInit() {
    super.onInit();
    print("🖐 global onInit");
  }

  void setAuthInfo(User user, String token) {
    _me = user;
    _token = token;
    update(['auth_info']);
  }
}
