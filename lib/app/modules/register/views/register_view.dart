import 'package:finance_app/app/global_widgets/app_button.dart';
import 'package:finance_app/app/global_widgets/app_input.dart';
import 'package:finance_app/app/core/utils/extensions.dart';
import 'package:finance_app/app/graphql/mutations.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor.fromHex("F9F9F9"),
        shadowColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
        child: Column(
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
            SizedBox(height: 30.0),
            Mutation(
              options: MutationOptions(
                  document: gql(register),
                  onCompleted: (dynamic resultData) {
                    print('On completed!');
                    print(resultData.toString());
                    controller.registerOnCompleted(resultData);
                  },
                  onError: (dynamic resultData) {
                    print('On error!');
                    print(resultData.toString());
                  }),
              builder: (runMutation, result) {
                return AppButton(
                  onTab: () {
                    print("Sign In");
                    controller.register(runMutation);
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
                );
              },
            ),
            SizedBox(height: 20.0),
            GestureDetector(
              child: Text(
                '¿Ya tienes cuenta?',
                style: TextStyle(
                  color: HexColor.fromHex("790000"),
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.end,
              ),
              onTap: () {
                Get.rootDelegate.popRoute();
              },
            ),
            // Crear cuenta
          ],
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
            // initialValue: controller.email,
            onChanged: (value) {
              controller.name.value = value;
            },
            hinText: 'Nombre(s)',
          ),
          SizedBox(height: 10.0),
          AppInput(
            // initialValue: controller.email,
            onChanged: (value) {
              controller.surname.value = value;
            },
            hinText: 'Apellido(s)',
          ),
          SizedBox(height: 10.0),
          AppInput(
            // initialValue: controller.email,
            onChanged: (value) {
              controller.email.value = value;
            },
            hinText: 'Correo',
          ),
          SizedBox(height: 10.0),
          Obx(
            () => AppInput(
              // initialValue: controller.email,
              onChanged: (value) {
                controller.password.value = value;
              },
              obscureText: !controller.isPasswordVisible.value,
              hinText: 'Contraseña',
              suffixIconOnTap: () {
                controller.isPasswordVisible.value =
                    !controller.isPasswordVisible.value;
              },
              suffixIcon: Icon(
                !controller.isPasswordVisible.value
                    ? Icons.visibility
                    : Icons.visibility_off,
                color: Colors.grey[400],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row termsAndConditions(TextStyle defaultStyle, TextStyle linkStyle) {
    return Row(
      children: [
        Obx(
          () => Checkbox(
            checkColor: Colors.white,
            activeColor: Colors.red,
            value: controller.termsAccepted.value,
            onChanged: (value) {
              controller.termsAccepted.value = value as bool;
            },
          ),
        ),
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
