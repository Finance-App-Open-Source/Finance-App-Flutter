import 'package:finance_app/app/middleware/force_navigate_to_route_middleware.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:finance_app/app/middleware/auth_middleware.dart';
import 'package:finance_app/app/modules/accounts/bindings/accounts_binding.dart';
import 'package:finance_app/app/modules/accounts/views/accounts_view.dart';
import 'package:finance_app/app/modules/create-account/bindings/create_account_binding.dart';
import 'package:finance_app/app/modules/create-account/views/create_account_view.dart';
import 'package:finance_app/app/modules/history-transactions/bindings/history_transactions_binding.dart';
import 'package:finance_app/app/modules/history-transactions/views/history_transactions_view.dart';
import 'package:finance_app/app/modules/home/bindings/home_binding.dart';
import 'package:finance_app/app/modules/home/views/home_view.dart';
import 'package:finance_app/app/modules/home_layout/bindings/home_layout_binding.dart';
import 'package:finance_app/app/modules/home_layout/views/home_layout_view.dart';
import 'package:finance_app/app/modules/login/bindings/login_binding.dart';
import 'package:finance_app/app/modules/login/views/login_view.dart';
import 'package:finance_app/app/modules/onboard/bindings/onboard_binding.dart';
import 'package:finance_app/app/modules/onboard/views/onboard_view.dart';
import 'package:finance_app/app/modules/register/bindings/register_binding.dart';
import 'package:finance_app/app/modules/register/views/register_view.dart';
import 'package:finance_app/app/modules/root/bindings/root_binding.dart';
import 'package:finance_app/app/modules/root/views/root_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.ONBOARD;

  static final routes = [
    GetPage(
      name: _Paths.ROOT,
      page: () => RootView(),
      binding: RootBinding(),
      participatesInRootNavigator: true,
      preventDuplicates: true,
      middlewares: [
        ForceNavigateToRouteMiddleware(from: '/', to: '/onboard'),
      ],
      children: [
        GetPage(
          name: _Paths.ONBOARD,
          page: () => OnboardView(),
          binding: OnboardBinding(),
        ),
        GetPage(
          name: _Paths.LOGIN,
          page: () => LoginView(),
          binding: LoginBinding(),
          middlewares: [
            //only enter this route when not authed
            EnsureNotAuthedMiddleware(),
          ],
        ),
        GetPage(
          name: _Paths.REGISTER,
          page: () => RegisterView(),
          binding: RegisterBinding(),
          middlewares: [
            //only enter this route when not authed
            EnsureNotAuthedMiddleware(),
          ],
        ),
        GetPage(
          name: _Paths.HOME_LAYOUT,
          page: () => HomeLayoutView(),
          binding: HomeLayoutBinding(),
          preventDuplicates: true,
          middlewares: [
            //only enter this route when authed
            EnsureAuthMiddleware(),
          ],
          children: [
            GetPage(
              name: _Paths.HOME,
              page: () => HomeView(),
              binding: HomeBinding(),
            ),
            GetPage(
              name: _Paths.HISTORY_TRANSACTIONS,
              page: () => HistoryTransactionsView(),
              binding: HistoryTransactionsBinding(),
            ),
            GetPage(
              name: _Paths.ACCOUNTS,
              page: () => AccountsView(),
              binding: AccountsBinding(),
            ),
            GetPage(
              name: _Paths.CREATE_ACCOUNT,
              page: () => CreateAccountView(),
              binding: CreateAccountBinding(),
            ),
          ],
        ),
      ],
    ),
    GetPage(
      name: '/404',
      page: () => NotFoundView(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 300),
    ),
  ];
}

class NotFoundView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('404'),
        ],
      ),
    );
  }
}
