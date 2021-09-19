import 'package:finance_app/app/core/utils/dependency_injection.dart';
import 'package:finance_app/app/routes/app_pages.dart';
import 'package:finance_app/app/core/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

initGraphql() async {
  // We're using HiveStore for persistence,
  // so we need to initialize Hive.
  await initHiveForFlutter();

  final HttpLink httpLink = HttpLink(
    'https://finance-nestjs.herokuapp.com/graphql',
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

  runApp(
    GraphQLProvider(
      client: client,
      child: FinanceApp(),
    ),
  );
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
      defaultTransition: Transition.size,
      getPages: AppPages.routes,
      builder: EasyLoading.init(),
    );
  }
}
