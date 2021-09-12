import 'package:finance_app/app/global_widgets/app_button.dart';
import 'package:finance_app/app/global_widgets/app_input.dart';
import 'package:finance_app/app/core/values/colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/create_account_controller.dart';

class CreateAccountView extends GetView<CreateAccountController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crear cuenta'),
        centerTitle: true,
        backgroundColor: FinanceColors.colors['primary'],
      ),
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  AppInput(
                    hinText: 'Nombre de la cuenta',
                  ),
                  SizedBox(height: 10.0),
                  AppInput(
                    hinText: 'Número de cuenta',
                  ),
                  SizedBox(height: 10.0),
                  AppInput(
                    hinText: 'Tipo',
                  ),
                  SizedBox(height: 10.0),
                  AppInput(
                    hinText: 'Valor Inicial',
                  ),
                  SizedBox(height: 10.0),
                  AppInput(
                    hinText: 'Moneda',
                  ),
                  SizedBox(height: 10.0),
                  AppInput(
                    hinText: 'Color',
                  ),
                ],
              ),
            ),
            AppButton(
              child: Text(
                'Guardar',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                  decoration: TextDecoration.none,
                ),
              ),
              onTab: () {},
            )
          ],
        ),
      ),
    );
  }
}
