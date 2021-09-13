import 'package:finance_app/app/data/models/User.dart';
import 'package:finance_app/app/modules/authentication/controllers/authentication_controller.dart';
import 'package:finance_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final authController = Get.find<AuthController>();
  RxBool termsAccepted = false.obs;
  RxBool isPasswordVisible = false.obs;

  RxString name = "".obs;
  RxString email = "".obs;
  RxString password = "".obs;
  RxString surname = "".obs;

  register(runMutation) {
    runMutation({
      "registerInput": {
        "email": email.value,
        "password": password.value,
        "name": name.value,
        "surname": surname.value,
      }
    });
  }

  registerOnCompleted(resultData) {
    final response = resultData['register'];
    print(response['success']);
    if (!response['success']) {
      return Get.snackbar(
        "Oops!",
        response['message'],
        icon: Icon(
          Icons.person,
          color: Colors.white,
        ),
        snackPosition: SnackPosition.TOP,
        colorText: Colors.white,
        backgroundColor: Colors.red,
      );
    }

    final User user = User.fromJson({
      'email': email.value,
      'name': name.value,
      'surname': surname.value,
    });
    authController.setAuthInfo(user, response['accessToken']);
    Get.snackbar(
      "¡Bienvenido!",
      "Hola!, ${user.name} ${user.surname}",
      icon: Icon(Icons.person, color: Colors.white),
      snackPosition: SnackPosition.TOP,
      colorText: Colors.white,
      backgroundColor: Colors.green,
    );
    Get.rootDelegate.offAndToNamed(Routes.BOTTOM_TABS);
  }
}
