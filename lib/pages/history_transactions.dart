import 'package:finance_app/extensions.dart';
import 'package:finance_app/theme.dart';
import 'package:flutter/material.dart';

class HistoryTransactions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 80.0, right: 40.0, left: 40.0),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 30.0),
              child: heading(),
            ),
            buildHeadings(),
            Flexible(
              child: ListView.builder(
                padding: EdgeInsets.only(top: 10.0),
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) =>
                    transactionItem(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container transactionItem(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: 10.0),
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(100.0),
                  ),
                  color: FinanceTheme.colors['terciary'],
                ),
                child: Icon(
                  Icons.transfer_within_a_station,
                  color: Colors.white,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Transferencia',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Billetera',
                    style: TextStyle(
                      color: FinanceTheme.colors['gray'],
                    ),
                  )
                ],
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '\$ 10,000',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: FinanceTheme.colors['success']),
              ),
              Text(
                'Billetera',
                style: TextStyle(
                  color: FinanceTheme.colors['gray'],
                ),
              )
            ],
          ),
        ],
      ),
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: 20.0),
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
        color: Colors.white,
      ),
    );
  }

  Row buildHeadings() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Categoría',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          children: [
            Text(
              'Esta semana',
              style: TextStyle(
                color: FinanceTheme.colors['terciary'],
              ),
            ),
            Icon(
              Icons.keyboard_arrow_down,
              color: FinanceTheme.colors['terciary'],
            )
          ],
        ),
      ],
    );
  }

  Row heading() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Historial de Transacciones',
          style: TextStyle(
            fontSize: 21.0,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
