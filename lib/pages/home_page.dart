import 'package:finance_app/controllers/global_controller.dart';
import 'package:finance_app/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Re render home page!");
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (_) => Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: GetBuilder<GlobalController>(
            id: 'auth_info',
            builder: (globalContext) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(globalContext.me.firstName +
                    " " +
                    globalContext.me.lastName),
                Text(globalContext.token)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
