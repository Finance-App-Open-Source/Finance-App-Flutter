import 'package:finance_app/app/core/utils/dependency_injection.dart';
import 'package:finance_app/app/modules/authentication/controllers/authentication_controller.dart';
import 'package:finance_app/app/routes/app_pages.dart';
import 'package:finance_app/app/core/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

initGraphql() async {
  // We're using HiveStore for persistence,
  // so we need to initialize Hive.
  await initHiveForFlutter();

  final HttpLink httpLink = HttpLink(
    'http://localhost:8000/graphql',
  );

  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      link: httpLink,
      // The default store is the InMemoryStore, which does NOT persist to disk
      cache: GraphQLCache(store: HiveStore()),
    ),
  );

  return client;
}

void main() async {
  await GetStorage.init();
  DependencyInjection.init();
  var client = await initGraphql();
  initialize();
  runApp(
    GraphQLProvider(
      client: client,
      child: FinanceApp(),
    ),
  );
}

void initialize() {
  // inject authentication controller
  Get.lazyPut(() => AuthController());
}

class FinanceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      title: 'Finance App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: FinanceColors.colors['black'],
              displayColor: FinanceColors.colors['black'],
            ),
      ),
      defaultTransition: Transition.cupertino,
      getPages: AppPages.routes,
    );
  }
}
