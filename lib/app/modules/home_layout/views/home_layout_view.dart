import 'package:finance_app/app/core/values/colors.dart';
import 'package:finance_app/app/modules/authentication/controllers/authentication_controller.dart';
import 'package:finance_app/app/modules/home_layout/controllers/home_layout_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';

class HomeLayoutView extends GetView<HomeLayoutController> {
  final authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return GetRouterOutlet.builder(
      builder: (context, delegate, currentRoute) {
        //This router outlet handles the appbar and the bottom navigation bar
        final currentLocation = currentRoute?.location;
        var currentIndex = 0;
        if (currentLocation?.startsWith(Routes.HISTORY_TRANSACTIONS) == true) {
          currentIndex = 1;
        }
        return Scaffold(
          appBar: AppBar(
            backgroundColor: FinanceColors.colors['primary'],
            elevation: 0,
            actions: [
              IconButton(
                icon: const Icon(Icons.exit_to_app_outlined),
                tooltip: 'Clear Storage',
                onPressed: () {
                  authController.clearStorage();
                },
              ),
            ],
          ),
          body: GetRouterOutlet(
            initialRoute: Routes.HOME,
            // anchorRoute: Routes.HOME,
            key: Get.nestedKey(Routes.HOME_LAYOUT),
          ),
          bottomNavigationBar: BottomNavigationBar(
            elevation: 0.0,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: FinanceColors.colors['primary'],
            currentIndex: currentIndex,
            onTap: (value) {
              switch (value) {
                case 0:
                  delegate.toNamed(Routes.HOME);
                  break;
                case 1:
                  delegate.toNamed(Routes.HISTORY_TRANSACTIONS);
                  break;

                default:
              }
            },
            items: [
              // _Paths.HOME_LAYOUT + [Empty]
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Inicio',
              ),
              // _Paths.HOME_LAYOUT + Routes.HISTORY_TRANSACTIONS
              BottomNavigationBarItem(
                icon: Icon(Icons.history),
                label: 'Transacciones',
              ),
            ],
          ),
        );
      },
    );
  }
}
