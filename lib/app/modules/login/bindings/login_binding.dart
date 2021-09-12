import 'package:dio/dio.dart';
import 'package:finance_app/app/data/providers/auth_api.dart';
import 'package:finance_app/app/data/repositories/auth_repository.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
  }
}
