import 'package:finance_app/app/modules/authentication/controllers/authentication_controller.dart';
import 'package:finance_app/app/routes/app_pages.dart';
import 'package:finance_app/models/User.dart';
import 'package:finance_app/services/auth_service.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class LoginController extends GetxController {
  String _email = "eve.holt@reqres.in";
  String _password = "cityslicka";
  final globalController = Get.find<AuthController>();
  String get email => _email;
  String get password => _password;
  set email(value) => _email = value;
  set password(value) => _password = value;

  void login() async {
    print("Email: $_email, Password: $_password");

    final AuthResponseSuccess? response =
        await AuthService.instance.login(_email, _password);

    if (response != null) {
      globalController.setAuthInfo(response.user, response.token);
      Get.offAndToNamed(Routes.BOTTOM_TABS);
    }
  }
}
