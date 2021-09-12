import 'package:finance_app/app/global_widgets/app_button.dart';
import 'package:finance_app/app/global_widgets/app_input.dart';
import 'package:finance_app/app/core/utils/extensions.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(
      init: RegisterController(),
      builder: (_) => Scaffold(
        appBar: AppBar(
          backgroundColor: HexColor.fromHex("F9F9F9"),
          shadowColor: Colors.transparent,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              //Bienvenido
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    headerContent(),
                    createAccountForm(context),
                  ],
                ),
              ),

              // Crear cuenta
              AppButton(
                onTab: () {
                  print("Sign In");
                },
                child: Text(
                  'Registrarme',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column createAccountForm(context) {
    TextStyle defaultStyle = TextStyle(color: Colors.black);
    TextStyle linkStyle = TextStyle(
      color: HexColor.fromHex('#790000'),
    );
    return Column(
      children: [
        listOfInputs(),
        termsAndConditions(defaultStyle, linkStyle),
      ],
    );
  }

  Container listOfInputs() {
    return Container(
      margin: EdgeInsets.only(bottom: 10.0),
      child: Column(
        children: [
          AppInput(
            // initialValue: _.email,
            onChanged: (value) {},
            hinText: 'Nombre',
          ),
          SizedBox(height: 10.0),
          AppInput(
            // initialValue: _.email,
            onChanged: (value) {},
            hinText: 'Correo',
          ),
          SizedBox(height: 10.0),
          AppInput(
            // initialValue: _.email,
            onChanged: (value) {},
            hinText: 'Contraseña',
            suffixIcon: Icon(
              Icons.remove_red_eye_rounded,
              color: Colors.grey[400],
            ),
          ),
        ],
      ),
    );
  }

  Row termsAndConditions(TextStyle defaultStyle, TextStyle linkStyle) {
    return Row(
      children: [
        GetBuilder<RegisterController>(builder: (_) {
          return Obx(
            () => Checkbox(
              checkColor: Colors.white,
              activeColor: Colors.red,
              value: _.termsAccepted.value,
              onChanged: (value) {
                _.termsAccepted.value = value as bool;
              },
            ),
          );
        }),
        Flexible(
          child: RichText(
            text: TextSpan(
              text: 'Estoy de acuerdo con los ',
              style: defaultStyle,
              children: [
                TextSpan(
                  text: 'Términos de Servicio ',
                  style: linkStyle,
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      print('Terms of Service');
                    },
                ),
                TextSpan(text: 'y '),
                TextSpan(
                  text: 'Política de Privacidad',
                  style: linkStyle,
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      print('Privacy Policy"');
                    },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Container headerContent() {
    return Container(
      margin: EdgeInsets.only(bottom: 30.0),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Crear Cuenta',
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: HexColor.fromHex('FF3131'),
                  fontSize: 34.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc ullamcorper tellus morbi lobortis laoreet ut odio cursus posuere.'),
        ],
      ),
    );
  }
}
