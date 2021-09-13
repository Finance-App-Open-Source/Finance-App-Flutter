import 'package:finance_app/app/core/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';
import '../controllers/history_transactions_controller.dart';

class HistoryTransactionsView extends GetView<HistoryTransactionsController> {
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
                    TransactionItem(
                  Icons.transfer_within_a_station,
                  FinanceColors.colors['terciary'] as Color,
                  'Transferencia',
                  'Billetera',
                ),
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
                  color: FinanceColors.colors['terciary'],
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
                      color: FinanceColors.colors['gray'],
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
                    color: FinanceColors.colors['success']),
              ),
              Text(
                'Billetera',
                style: TextStyle(
                  color: FinanceColors.colors['gray'],
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
            color: Colors.black.withOpacity(0.05),
            blurRadius: 21,
            offset: Offset(0, 5),
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
                color: FinanceColors.colors['terciary'],
              ),
            ),
            Icon(
              Icons.keyboard_arrow_down,
              color: FinanceColors.colors['terciary'],
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

class TransactionItem extends StatefulWidget {
  final IconData icon;
  final Color iconBgColor;
  final String title;
  final String description;
  @override
  State<TransactionItem> createState() => _TransactionItemState();

  TransactionItem(this.icon, this.iconBgColor, this.title, this.description);
}

class _TransactionItemState extends State<TransactionItem> {
  bool pressed = false;
  @override
  Widget build(BuildContext context) {
    final settingsItem =
        ({required Widget child}) => Styled.widget(child: child)
            .alignment(Alignment.center)
            .borderRadius(all: 15)
            .ripple()
            .backgroundColor(Colors.white, animate: true)
            .clipRRect(all: 10.0) // clip ripple
            .borderRadius(all: 25, animate: true)
            // .elevation(
            //   pressed ? 0 : 20,
            //   borderRadius: BorderRadius.circular(25),
            //   shadowColor: Color(0x30000000),
            // ) // shadow borderRadius
            .boxShadow(
              color: Colors.black.withOpacity(pressed ? 0 : 0.05),
              blurRadius: 21,
              offset: Offset(0, 5),
            )
            .constrained(height: 80)
            .padding(vertical: 12) // margin
            .gestures(
              onTapChange: (tapStatus) => setState(() => pressed = tapStatus),
              onTapDown: (details) => print('tapDown'),
              onTap: () => print('onTap'),
            )
            .scale(all: pressed ? 0.95 : 1.0, animate: true)
            .animate(Duration(milliseconds: 150), Curves.easeOut);

    final Widget icon = Icon(widget.icon, size: 20, color: Colors.white)
        .padding(all: 12)
        .decorated(
          color: widget.iconBgColor,
          borderRadius: BorderRadius.circular(30),
        )
        .padding(left: 15, right: 10);
    final Widget title = Text(
      widget.title,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    ).padding(bottom: 5);

    final Widget description = Text(
      widget.description,
      style: TextStyle(
        color: Colors.black26,
        fontWeight: FontWeight.bold,
        fontSize: 12,
      ),
    );
    return settingsItem(
      child: <Widget>[
        icon,
        <Widget>[
          title,
          description,
        ].toColumn(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
      ].toRow(),
    );
  }
}
