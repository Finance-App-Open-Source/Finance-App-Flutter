import 'package:finance_app/app/modules/authentication/controllers/authentication_controller.dart';
import 'package:get/get.dart';
import '../routes/app_pages.dart';

class EnsureAuthMiddleware extends GetMiddleware {
  final AuthController _authController = Get.find<AuthController>();
  @override
  Future<GetNavConfig?> redirectDelegate(GetNavConfig route) async {
    if (!_authController.isLoggedIn) {
      final newRoute = Routes.LOGIN_THEN(route.location!);
      return GetNavConfig.fromRoute(newRoute);
    }
    return await super.redirectDelegate(route);
  }
}

class EnsureNotAuthedMiddleware extends GetMiddleware {
  final AuthController _authController = Get.find<AuthController>();
  @override
  Future<GetNavConfig?> redirectDelegate(GetNavConfig route) async {
    print('EnsureNotAuthedMiddleware');
    if (_authController.isLoggedIn) {
      //NEVER navigate to auth screen, when user is already authed
      // return null;

      //OR redirect user to another screen
      return GetNavConfig.fromRoute(Routes.HOME_LAYOUT);
    }
    return await super.redirectDelegate(route);
  }
}
