import 'package:finance_app/main.dart';
import 'package:finance_app/utils.dart';
import 'package:finance_app/widgets/app_button.dart';
import 'package:finance_app/widgets/app_input.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
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
                      image: AssetImage(path('img/icons/hand-emoji.png')),
                    )
                  ],
                ),
                AppInput(
                  hinText: 'Correo',
                ),
                SizedBox(height: 10.0),
                AppInput(
                  hinText: 'Contraseña',
                  suffixIcon: Icon(
                    Icons.remove_red_eye_rounded,
                    color: Colors.grey[400],
                  ),
                ),
              ],
            ),
          ),
          AppButton(
            child: Text(
              'Ingresar',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.white,
                decoration: TextDecoration.none,
              ),
            ),
          )
        ],
      ),
    );
  }
}
