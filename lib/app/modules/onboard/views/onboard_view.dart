import 'package:finance_app/app/core/utils/helpers.dart';
import 'package:finance_app/app/global_widgets/app_button.dart';
import 'package:finance_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/onboard_controller.dart';

class OnboardView extends GetView<OnboardController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(height: 20.0),
            Expanded(
              child: PageView.builder(
                scrollDirection: Axis.horizontal,
                controller: controller.pageController,
                onPageChanged: controller.onPageChanged,
                itemCount: controller.images.length,
                itemBuilder: (ctx, i) => Column(
                  children: [
                    Image(
                      height: 400.0,
                      width: MediaQuery.of(context).size.width * 0.8,
                      image: AssetImage(
                        path(
                          controller.images[i],
                        ),
                      ),
                    ),
                    Text(
                      '''Anim laboris consequat est ipsum qui. Ad mollit nisi labore consectetur et do eiusmod anim aliquip voluptate''',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.grey[600],
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            AppButton(
              child: Text(
                'Empecemos',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                  decoration: TextDecoration.none,
                ),
              ),
              onTab: () {
                controller.letsBegin();
              },
            )
          ],
        ),
      ),
    );
  }
}
