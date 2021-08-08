import 'package:finance_app/app/modules/history-transactions/views/history_transactions_view.dart';
import 'package:finance_app/app/modules/home/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomTabsController extends GetxController {
  final RxInt selectedIndex = 0.obs;
  final TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final List<Widget> widgetOptions = <Widget>[
    HomeView(),
    HistoryTransactionsView(),
  ];

  void onTap(index) {
    selectedIndex.value = index;
    print(selectedIndex.value);
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
