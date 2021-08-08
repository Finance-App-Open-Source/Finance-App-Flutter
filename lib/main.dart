import 'package:finance_app/app/modules/authentication/controllers/authentication_controller.dart';
import 'package:finance_app/app/routes/app_pages.dart';
import 'package:finance_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  initialize();
  runApp(FinanceApp());
}

void initialize() {
  // inject authentication controller
  Get.lazyPut(() => AuthController());
}

class FinanceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Finance App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: FinanceTheme.colors['black'],
              displayColor: FinanceTheme.colors['black'],
            ),
      ),
      getPages: AppPages.routes,
      initialRoute: AppPages.INITIAL,
    );
  }
}
