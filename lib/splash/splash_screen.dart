import 'package:finance_app/login_page.dart';
import 'package:finance_app/utils.dart';
import 'package:flutter/material.dart';

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
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
            image: AssetImage(path(images[currentIndex])),
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
          GestureDetector(
            onTap: () {
              setState(() {
                currentIndex += 1;
                if (currentIndex >= images.length) {
                  currentIndex = 0;
                  Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                    return LoginPage();
                  }));
                }
              });
            },
            child: Container(
              margin: EdgeInsets.only(
                top: 40.0,
              ),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.red.withOpacity(0.5),
                    blurRadius: 21,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              padding: EdgeInsets.all(10.0),
              width: 200.0,
              child: Text(
                'Siguiente',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
