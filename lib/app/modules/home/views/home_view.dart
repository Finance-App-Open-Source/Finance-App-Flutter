import 'package:finance_app/app/modules/authentication/controllers/authentication_controller.dart';
import 'package:finance_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    final globalController = Get.find<AuthController>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: FinanceTheme.colors['primary'],
        title: Text(
            'Hola ${globalController.me.firstName} ${globalController.me.lastName}!'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Lista de cuentas',
              style: TextStyle(
                color: FinanceTheme.colors['black'],
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5.0),
              height: MediaQuery.of(context).size.height * 0.30,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, i) => AccountCard(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AccountCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      width: MediaQuery.of(context).size.width * 0.5,
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
    );
  }
}
