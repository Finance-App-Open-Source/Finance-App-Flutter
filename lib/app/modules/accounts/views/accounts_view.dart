import 'dart:math';

import 'package:finance_app/app/routes/app_pages.dart';
import 'package:finance_app/theme.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/accounts_controller.dart';

class AccountsView extends GetView<AccountsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajustes de cuentas'),
        centerTitle: true,
        backgroundColor: FinanceTheme.colors['primary'],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: FinanceTheme.colors['primary'],
        child: Icon(Icons.add),
        onPressed: () {
          Get.toNamed(Routes.CREATE_ACCOUNT);
        },
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        padding: EdgeInsets.all(20.0),
        child: ListView.builder(
          itemCount: 100,
          itemBuilder: (context, _) {
            return AccountItem();
          },
        ),
      ),
    );
  }
}

class AccountItem extends StatelessWidget {
  const AccountItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(right: 10.0),
            decoration: BoxDecoration(
              color:
                  Colors.primaries[Random().nextInt(Colors.primaries.length)],
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            height: 60.0,
            width: 60.0,
            child: Icon(
              Icons.wallet_giftcard,
              color: Colors.white,
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Billetera',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Efectivo',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.menu),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
