import 'package:finance_app/app/core/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../controllers/root_controller.dart';

class RootView extends GetView<RootController> {
  @override
  Widget build(BuildContext context) {
    return GetRouterOutlet.builder(
      builder: (context, delegate, current) {
        final title = current?.location;
        return Scaffold(
          appBar: AppBar(
            title: Text(title ?? ''),
            centerTitle: true,
            backgroundColor: FinanceColors.colors['primary'],
          ),
          resizeToAvoidBottomInset: false,
          body: GetRouterOutlet(
            initialRoute: Routes.ONBOARD,
          ),
        );
      },
    );
  }
}
