part of 'app_pages.dart';
// DO NOT EDIT. This is code generated via package:get_cli/get_cli.dart

abstract class Routes {
  Routes._();

  // HomeLayout
  static const HOME_LAYOUT = _Paths.HOME_LAYOUT;
  static const HOME = HOME_LAYOUT + _Paths.HOME;

  static const HISTORY_TRANSACTIONS = HOME_LAYOUT + _Paths.HISTORY_TRANSACTIONS;
  static const ACCOUNTS = HOME_LAYOUT + _Paths.ACCOUNTS;
  static const CREATE_ACCOUNT = HOME_LAYOUT + _Paths.CREATE_ACCOUNT;

  // RootLayout
  static const ROOT = _Paths.ROOT;
  static const LOGIN = _Paths.LOGIN;
  // ignore: non_constant_identifier_names
  static String LOGIN_THEN(String afterSuccessfulLogin) =>
      '$LOGIN?then=${Uri.encodeQueryComponent(afterSuccessfulLogin)}';
  static const REGISTER = _Paths.REGISTER;
  static const ONBOARD = _Paths.ONBOARD;
}

abstract class _Paths {
  static const ROOT = '/';
  static const HOME = '/home';
  static const HISTORY_TRANSACTIONS = '/history-transactions';
  static const LOGIN = '/login';
  static const REGISTER = '/register';
  static const ACCOUNTS = '/accounts';
  static const CREATE_ACCOUNT = '/create-account';
  static const HOME_LAYOUT = '/home-layout';
  static const ONBOARD = '/onboard';
}
