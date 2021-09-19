import 'package:finance_app/app/data/models/User.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  User? _me;
  String _token = "";

  User get me => _me!;
  String get token => _token;
  bool get isLoggedIn => _me != null && _me is User;

  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    print("🖐 authcontroller onInit");
  }

  void onReady() {
    super.onReady();
    print("🖐 authcontroller onReady");
    print("Token:");
    print(box.read("user"));
    if (box.read("user") != null) {
      _me = User.fromJson(box.read("user"));
    }
  }

  void setAuthInfo(User user, String token) {
    _me = user;
    _token = token;
    box.write("accessToken", token);
    box.write("user", user.toJson());
  }
}
