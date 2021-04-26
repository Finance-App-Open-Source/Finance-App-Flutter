import 'package:finance_app/models/User.dart';
import 'package:finance_app/services/auth_service.dart';
import 'package:get/state_manager.dart';

class LoginController extends GetxController {
  String _email = "eve.holt@reqres.in";
  String _password = "cityslicka";

  String get email => _email;
  String get password => _password;
  set email(value) => _email = value;
  set password(value) => _password = value;

  Future<void> login() async {
    print("Email: $_email, Password: $_password");

    final AuthResponseSuccess? response =
        await AuthService.instance.login(_email, _password);

    if (response != null) {
      print(response.token);
      print(response.user.toJson());
    }
  }
}
