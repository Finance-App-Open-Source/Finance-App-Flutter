import 'package:finance_app/app/core/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/bottom_tabs_controller.dart';

class BottomTabsView extends GetView<BottomTabsController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: IndexedStack(
          index: controller.selectedIndex.toInt(),
          children: controller.widgetOptions,
        ),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0.0,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: '',
            ),
          ],
          currentIndex: controller.selectedIndex.value,
          selectedItemColor: FinanceColors.colors['primary'],
          onTap: controller.onTap,
        ),
      ),
    );
  }
}
