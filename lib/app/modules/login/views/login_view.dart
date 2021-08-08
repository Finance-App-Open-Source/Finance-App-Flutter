import 'package:finance_app/app/routes/app_pages.dart';
import 'package:finance_app/extensions.dart';
import 'package:finance_app/utils.dart';
import 'package:finance_app/widgets/app_button.dart';
import 'package:finance_app/widgets/app_input.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 30.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Bienvenido',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: HexColor.fromHex('FF3131'),
                                fontSize: 34.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Image(
                              image:
                                  AssetImage(path('img/icons/hand-emoji.png')),
                            )
                          ],
                        ),
                        Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc ullamcorper tellus morbi lobortis laoreet ut odio cursus posuere.'),
                      ],
                    ),
                  ),
                  AppInput(
                    initialValue: controller.email,
                    onChanged: (value) {
                      controller.email = value;
                    },
                    hinText: 'Correo',
                  ),
                  SizedBox(height: 10.0),
                  AppInput(
                    initialValue: controller.password,
                    hinText: 'Contraseña',
                    onChanged: (value) {
                      controller.password = value;
                    },
                    suffixIcon: Icon(
                      Icons.remove_red_eye_rounded,
                      color: Colors.grey[400],
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    '¿Olvidaste la contraseña?',
                    style: TextStyle(color: HexColor.fromHex("1CBEB9")),
                    textAlign: TextAlign.end,
                  ),
                ],
              ),
            ),
            Column(children: [
              AppButton(
                onTab: () async {
                  controller.login();
                },
                child: Text(
                  'Ingresar',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              GestureDetector(
                child: Text(
                  '¿No tienes cuenta?',
                  style: TextStyle(
                    color: HexColor.fromHex("790000"),
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.end,
                ),
                onTap: () {
                  Get.toNamed(Routes.REGISTER);
                },
              ),
            ])
          ],
        ),
      ),
    );
  }
}
