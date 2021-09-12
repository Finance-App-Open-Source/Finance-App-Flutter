import 'package:dio/dio.dart';
import 'package:finance_app/app/data/providers/auth_api.dart';
import 'package:finance_app/app/data/repositories/auth_repository.dart';
import 'package:get/get.dart';

class DependencyInjection {
  static void init() {
    Get.put<Dio>(Dio(BaseOptions(baseUrl: '')));

    // providers
    Get.put<AuthApi>(AuthApi());

    /// repositories
    Get.put<AuthRepository>(AuthRepository());
  }
}
