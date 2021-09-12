import 'package:finance_app/app/modules/home/local_widgets/account_card.dart';
import 'package:finance_app/app/modules/authentication/controllers/authentication_controller.dart';
import 'package:finance_app/app/modules/home/local_widgets/custom_sliver_app_bar.dart';
import 'package:finance_app/app/data/models/Account.dart';
import 'package:finance_app/app/routes/app_pages.dart';
import 'package:finance_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  // final globalController = Get.find<AuthController>();
  final String bgBalanceAppBar = "assets/img/backgrounds/primary-bg.png";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          CustomSliverAppBar(
            imgUrl: bgBalanceAppBar,
          ),
          SliverHomeBody(),
        ],
      ),
    );
  }
}

class SliverHomeBody extends StatelessWidget {
  const SliverHomeBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      child: Container(
        padding: EdgeInsets.only(left: 20.0, right: 20.0),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Lista de cuentas',
                  style: TextStyle(
                    color: FinanceTheme.colors['black'],
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.settings),
                  onPressed: () {
                    Get.rootDelegate.toNamed(Routes.ACCOUNTS);
                  },
                ),
              ],
            ),
            SizedBox(
              height: 5.0,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5.0),
              height: MediaQuery.of(context).size.height * 0.25,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, i) => AccountCard(
                  account: Account(
                    'Efectivo',
                    'SAVING_ACCOUNT',
                    10000,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
