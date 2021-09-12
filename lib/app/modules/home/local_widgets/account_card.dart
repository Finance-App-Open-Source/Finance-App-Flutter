import 'dart:math';
import 'package:finance_app/app/data/models/Account.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:intl/intl.dart';

final formatCurrency = new NumberFormat.simpleCurrency(
  decimalDigits: 0,
);

class AccountCard extends StatelessWidget {
  final Account account;
  final accountTypeIcons = {
    'CASH': SimpleLineIcons.wallet,
    'SAVING_ACCOUNT': MaterialCommunityIcons.piggy_bank,
  };

  AccountCard({required this.account});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.all(8.0),
          padding: EdgeInsets.all(25.0),
          width: MediaQuery.of(context).size.width * 0.4,
          decoration: BoxDecoration(
            color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.09),
                blurRadius: 21,
                offset: Offset(0, 5),
              )
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                account.name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 21,
                ),
              ),
              Text(
                '${formatCurrency.format(account.balance)}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
        Positioned(
          top: 30.0,
          left: 20.0,
          child: IconButton(
            onPressed: () {},
            icon: Icon(accountTypeIcons[account.accountType]),
            iconSize: 32,
            splashRadius: 21.0,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
