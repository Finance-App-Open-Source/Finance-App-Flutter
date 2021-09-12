import 'package:finance_app/app/data/models/User.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

  void onReady() {
    super.onReady();
    print("🖐 global onReady");
  }

  void setAuthInfo(User user, String token) {
    _me = user;
    _token = token;
    update(['auth_info']);
  }
}
