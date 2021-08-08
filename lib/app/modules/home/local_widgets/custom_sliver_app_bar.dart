import 'package:flutter/material.dart';

class CustomSliverAppBar extends StatelessWidget {
  final String imgUrl;
  const CustomSliverAppBar({
    Key? key,
    required this.imgUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 250.0,
      backgroundColor: Colors.white,
      pinned: false,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.all(0.0),
        background: Image.asset(
          imgUrl,
          fit: BoxFit.cover,
        ),
        title: Stack(
          children: [
            Container(
              height: 180.0,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Balance total',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Text('\$12,000'),
                ],
              ),
            ),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0),
                  ),
                ),
                height: 20.0,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
    );
  }
}
