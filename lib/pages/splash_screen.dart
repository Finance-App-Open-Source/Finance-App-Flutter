import 'dart:async';

import 'package:finance_app/pages/login_page.dart';
import 'package:finance_app/utils.dart';
import 'package:finance_app/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final List<String> images = [
    'img/splash/run-health.png',
    'img/splash/locked-security.png',
    'img/splash/relationship.png'
  ];

  int _currentPage = 0;
  late Timer _timer;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(30.0),
        child: Column(
          children: [
            SizedBox(height: 100.0),
            Expanded(
              child: PageView.builder(
                scrollDirection: Axis.horizontal,
                controller: _pageController,
                onPageChanged: _onPageChanged,
                itemCount: images.length,
                itemBuilder: (ctx, i) => Column(
                  children: [
                    Image(
                      height: 400.0,
                      width: MediaQuery.of(context).size.width * 0.8,
                      image: AssetImage(path(images[i])),
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
                setState(() {
                  _timer.cancel();
                  Get.off(() => LoginPage(), transition: Transition.zoom);
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
