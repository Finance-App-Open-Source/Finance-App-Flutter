part of 'app_pages.dart';
// DO NOT EDIT. This is code generated via package:get_cli/get_cli.dart

abstract class Routes {
  Routes._();
  // RootLayout
  static const ROOT = _Paths.ROOT;
  static const SPLASH = _Paths.SPLASH;
  static const LOGIN = _Paths.LOGIN;
  static const REGISTER = _Paths.REGISTER;

  // HomeLayout
  static const HOME_LAYOUT = _Paths.HOME_LAYOUT;
  static const HOME = HOME_LAYOUT + _Paths.HOME;

  static const HISTORY_TRANSACTIONS = HOME_LAYOUT + _Paths.HISTORY_TRANSACTIONS;
  static const ACCOUNTS = HOME_LAYOUT + _Paths.ACCOUNTS;
  static const CREATE_ACCOUNT = HOME_LAYOUT + _Paths.CREATE_ACCOUNT;
}

abstract class _Paths {
  static const ROOT = '/';
  static const SPLASH = '/splash';
  static const HOME = '/home';
  static const HISTORY_TRANSACTIONS = '/history-transactions';
  static const LOGIN = '/login';
  static const REGISTER = '/register';
  static const ACCOUNTS = '/accounts';
  static const CREATE_ACCOUNT = '/create-account';
  static const HOME_LAYOUT = '/home-layout';
}
